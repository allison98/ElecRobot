#include <XC.h>
#include <sys/attribs.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#pragma config FNOSC = FRCPLL       // Internal Fast RC oscillator (8 MHz) w/ PLL
#pragma config FPLLIDIV = DIV_2     // Divide FRC before PLL (now 4 MHz)
#pragma config FPLLMUL = MUL_20     // PLL Multiply (now 80 MHz)
#pragma config FPLLODIV = DIV_2     // Divide After PLL (now 40 MHz) see figure 8.1 in datasheet for more info
#pragma config FWDTEN = OFF         // Watchdog Timer Disabled
#pragma config FPBDIV = DIV_1       // PBCLK = SYCLK

#define SYSCLK 40000000L
#define DEF_FREQ 16000L
#define Baud2BRG(desired_baud)      ( (SYSCLK / (16*desired_baud))-1)

//volatile int advalx = 0;
//volatile int adcvaly = 0;
volatile float voltagex = 0;
volatile float voltagey = 0;
volatile float backwardflag = 0;

void __ISR(_TIMER_1_VECTOR, IPL5SOFT) Timer1_Handler(void)
{
	LATBbits.LATB6 = !LATBbits.LATB6; // Blink led on RB6
	IFS0CLR=_IFS0_T1IF_MASK; // Clear timer 1 interrupt flag, bit 4 of IFS0
	
	if (LATBbits.LATB6 == 0) {
		backwardflag = 1;
	}
	if (LATBbits.LATB6 == 1) {
		backwardflag = 0;
	}
}

void SetupTimer1 (void)
{
	// Explanation here:
	// https://www.youtube.com/watch?v=bu6TTZHnMPY
	__builtin_disable_interrupts();
	PR1 =(SYSCLK/(DEF_FREQ*2L))-1; // since SYSCLK/FREQ = PS*(PR1+1)
	TMR1 = 0;
	T1CONbits.TCKPS = 0; // Pre-scaler: 1
	T1CONbits.TCS = 0; // Clock source
	T1CONbits.ON = 1;
	IPC1bits.T1IP = 5;
	IPC1bits.T1IS = 0;
	IFS0bits.T1IF = 0;
	IEC0bits.T1IE = 1;
	
	INTCONbits.MVEC = 1; //Int multi-vector
	__builtin_enable_interrupts();
}

/* UART2Configure() sets up the UART2 for the most standard and minimal operation
 *  Enable TX and RX lines, 8 data bits, no parity, 1 stop bit, idle when HIGH
 *
 * Input: Desired Baud Rate
 * Output: Actual Baud Rate from baud control register U2BRG after assignment*/
int UART2Configure( int desired_baud)
{
	U2RXRbits.U2RXR = 4;    //SET RX to RB8
	RPB9Rbits.RPB9R = 2;    //SET RB9 to TX
	
    U2MODE = 0;         // disable autobaud, TX and RX enabled only, 8N1, idle=HIGH
    U2STA = 0x1400;     // enable TX and RX
    U2BRG = Baud2BRG(desired_baud); // U2BRG = (FPb / (16*baud)) - 1
    
    U2MODESET = 0x8000;     // enable UART2
    
    // Calculate actual baud rate
    int actual_baud = SYSCLK / (16 * (U2BRG+1));
    return actual_baud;
}

/* SerialTransmit() transmits a string to the UART2 TX pin MSB first
 *
 * Inputs: *buffer = string to transmit */
int SerialTransmit(const char *buffer)
{
    unsigned int size = strlen(buffer);
    while( size)
    {
        while( U2STAbits.UTXBF);    // wait while TX buffer full
        U2TXREG = *buffer;          // send single character to transmit buffer
        buffer++;                   // transmit next character on following loop
        size--;                     // loop until all characters sent (when size = 0)
    }
 
    while( !U2STAbits.TRMT);        // wait for last transmission to finish
 
    return 0;
}
 
/* SerialReceive() is a blocking function that waits for data on
 *  the UART2 RX buffer and then stores all incoming data into *buffer
 *
 * Note that when a carriage return '\r' is received, a nul character
 *  is appended signifying the strings end
 *
 * Inputs:  *buffer = Character array/pointer to store received data into
 *          max_size = number of bytes allocated to this pointer
 * Outputs: Number of characters received */
unsigned int SerialReceive(char *buffer, unsigned int max_size)
{
    unsigned int num_char = 0;
 
    /* Wait for and store incoming data until either a carriage return is received
     *   or the number of received characters (num_chars) exceeds max_size */
    while(num_char < max_size)
    {
        while( !U2STAbits.URXDA);   // wait until data available in RX buffer
        *buffer = U2RXREG;          // empty contents of RX buffer into *buffer pointer

        while( U2STAbits.UTXBF);    // wait while TX buffer full
        U2TXREG = *buffer;          // echo
 
        // insert nul character to indicate end of string
        if( *buffer == '\r')
        {
            *buffer = '\0';     
            break;
        }
 
        buffer++;
        num_char++;
    }
 
    return num_char;
}

int myAtoi(char *str)
{
    int i, res=0;
    for (i=0; str[i]!='\0'; ++i) res=res*10+(str[i]-'0');
    return res;
}

void PrintNumber(int N, int Base, int digits)
{ 
	char HexDigit[]="0123456789ABCDEF";
	int j;
	#define NBITS 32
	char buff[NBITS+1];
	buff[NBITS]=0;

	j=NBITS-1;
	while ( (N>0) | (digits>0) )
	{
		buff[j--]=HexDigit[N%Base];
		N/=Base;
		if(digits!=0) digits--;
	}
	SerialTransmit(&buff[j+1]);
}

// Good information about ADC in PIC32 found here:
// http://umassamherstm5.org/tech-tutorials/pic32-tutorials/pic32mx220-tutorials/adc
void ADCConf(void)
{
    AD1CON1CLR = 0x8000;    // disable ADC before configuration
    AD1CON1 = 0x00E0;       // internal counter ends sampling and starts conversion (auto-convert), manual sample
    AD1CON2 = 0;            // AD1CON2<15:13> set voltage reference to pins AVSS/AVDD
    AD1CON3 = 0x0f01;       // TAD = 4*TPB, acquisition time = 15*TAD 
    AD1CON1SET=0x8000;      // Enable ADC
}

int ADCRead(char analogPIN)
{
    AD1CHS = analogPIN << 16;    // AD1CHS<16:19> controls which analog pin goes to the ADC
 
    AD1CON1bits.SAMP = 1;        // Begin sampling
    while(AD1CON1bits.SAMP);     // wait until acquisition is done
    while(!AD1CON1bits.DONE);    // wait until conversion done
 
    return ADC1BUF0;             // result stored in ADC1BUF0
}
/*
void checkCommand(float voltagex, float voltagey){
	//Forward
	if((voltagey>=0 && voltagey<=0.5) && (voltagex>=1.4 && voltagex<=1.8 ))
		PWMStraight();
	//Back
	else if((voltagey>=2.8 && voltagey<=3.3) && (voltagex>=1.4 && voltagex<=1.8 ))
		PWMBack();
		
	//Left
	else if(voltagex>=0 && voltagex<=0.5 && (voltagey>=1.4 && voltagey<=1.8 ))
		PWMBack();
	//Right
	else if(voltagex>=2.8 && voltagex<=3.3 && (voltagey>=1.4 && voltagey<=1.8 ))
		sendCommand(4);
	//Stop
	else;
		sendCommand(0);
}
*/
void readVolt() {
	int adcvalx, adcvaly;
	
	adcvalx = ADCRead(4);  // note that we call pin AN4 (RB2) by it's analog number 
	adcvaly = ADCRead(5);  // note that we call pin AN5 (RB3) by it's analog number
    //printf("adc value: %d", adcvalx);
    voltagex=adcvalx*3.3/1023.0;
    voltagey=adcvaly*3.3/1023.0;    
}


void MsDelay(unsigned long int mS)
{
    unsigned long int j = 0;
    for(mS; mS > 0; mS--){
            for(j = 0; j < 7; j++){
            	asm("NOP"); asm("NOP"); asm("NOP"); asm("NOP");
                asm("NOP"); asm("NOP"); asm("NOP"); asm("NOP");
                asm("NOP"); asm("NOP"); asm("NOP"); asm("NOP");
                asm("NOP"); asm("NOP"); asm("NOP"); asm("NOP");
                asm("NOP");     
                    
            }
    }
}



void main (void)
{
    char buf[128]; // declare receive buffer with max size 128
    unsigned int rx_size;
	int newF;
	unsigned long reload;
	
	
	// Configure pins as analog inputs
	ANSELBbits.ANSB3 = 1;   // set RB3 (AN5, pin 7 of DIP28) as analog pin
	TRISBbits.TRISB3 = 1;   // set RB3 as an input
	ANSELBbits.ANSB2 = 1;   // set RB2 (AN4, pin 6 of DIP28) as analog pin
	TRISBbits.TRISB2 = 1;   // set RB2 as an input
	
	DDPCON = 0;
	CFGCON = 0;
	TRISBbits.TRISB6 = 0;
	LATBbits.LATB6 = 0;	
	INTCONbits.MVEC = 1;
	SetupTimer1();

    // Peripheral Pin Select
    U2RXRbits.U2RXR = 4; //SET RX to RB8
    RPB9Rbits.RPB9R = 2; //SET RB9 to TX
 
    UART2Configure(115200); // Configure UART2 for a baud rate of 115200
    U2MODESET = 0x8000; // enable UART2
 
 	ADCConf();
 
    SerialTransmit("Frequency generator for the PIC32MX130F064B.\r\n");
    SerialTransmit("By Jesus Calvino-Fraga (c) 2018.\r\n\r\n");
	
	while (1)
	{
    	SerialTransmit("Frequency: ");
        rx_size = SerialReceive(buf, 128); // wait here until data is received
 
        if( rx_size > 0)
        { 
		    newF=myAtoi(buf);
		    if(newF>200000L)
		    {
		       SerialTransmit("Warning: High frequencies will cause the interrupt service routine for\r\n"
		             "the timer to take all available processor time.  Capping to 200000Hz.\r\n");
		       newF=200000L;
		    }
		    if(newF>0)
		    {
			    reload=(SYSCLK/(newF*2L))-1;
			    SerialTransmit("\r\nFrequency set to: ");
		        PrintNumber(SYSCLK/((reload+1)*2L), 10, 1);
		        T1CONbits.ON = 0;
		        PR1=reload;
		        T1CONbits.ON = 1;
	        }
        }
        SerialTransmit("\r\n");
        
        while(1){
      		readVolt();
      		printf("Voltage1: X:%f  Y:%f\r\n", voltagex, voltagey);
      		
      		//Forward // this is good :)
      		if((voltagey>=0 && voltagey<=0.5) && (voltagex>=1.4 && voltagex<=1.8 )) {
	        	while(1) {
		        	//square wave is normal
		        	readVolt();
		        	printf("Voltage2: X:%f  Y:%f\r\n", voltagex, voltagey);
		        	if((voltagey>=0 && voltagey<=0.5) && (voltagex>=1.4 && voltagex<=1.8 ));
						//do nothing	
					else
					printf("It's breaking.\r\n");
						break;
				}
			}

			//Backward
				// send high, low, low, high -- high low, low, high ---
			else if((voltagey>=2.8 && voltagey<=3.3) && (voltagex>=1.4 && voltagex<=1.8 )) {
			//	backwardflag = 0;
			//	_delay_ms(1000);
				MsDelay(100000);
				MsDelay(100000);
				MsDelay(100000);
				T1CONbits.ON = 0;
				MsDelay(100000);
				MsDelay(100000);
				MsDelay(100000);				
				while(1) {
					readVolt();
					if((voltagey>=2.8 && voltagey<=3.3) && (voltagex>=1.4 && voltagex<=1.8 )) {
					//	if (backwardflag == 1) {
					//		T1CONbits.ON = 0;
					//	}	
						T1CONbits.ON = 1;
						//backward will be 
						//T1CONbits.ON = 0; 
						//MsDelay(10);
					/*	T1CONbits.ON = 1;
						MsDelay(100000);
						MsDelay(100000);
						MsDelay(100000);
						T1CONbits.ON = 0;
						MsDelay(100000);
						MsDelay(100000);
						MsDelay(100000);*/
					}
					else {
						break;
					}
				}
			}
			
			//Stop //works great

			else {
				while(1){
					T1CONbits.ON = 0;
					printf("hi\r\n");
					readVolt();
					if((voltagex>=1.4 && voltagex<=1.8) && (voltagey>=1.4 && voltagey<=1.8))
						T1CONbits.ON = 0; // keep square wave off while joystick is not moving
					else {
						T1CONbits.ON = 1; // exit while look and turn square wave back on
						break;	
					}
				}
			}			
						
			
			//checkCommand(voltagex, voltagey);
        }
        
        
	}
}
