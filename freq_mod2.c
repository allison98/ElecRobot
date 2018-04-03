// ADC.c:  Shows how to use the 14-bit ADC.  This program
// measures the voltage from some pins of the EFM8LB1 using the ADC.
//
// (c) 2008-2018, Jesus Calvino-Fraga
//

#include <stdio.h>
#include <stdlib.h>
#include <EFM8LB1.h>

// ~C51~  

#define SYSCLK 72000000L
#define BAUDRATE 115200L
#define LCD_RS P2_6
#define LCD_D4 P2_4
#define LCD_D5 P2_3
#define LCD_D6 P2_2
#define LCD_D7 P2_1
#define LCD_E  P2_5
#define CHARS_PER_LINE 16


// for the motor 1
#define motorR1 P1_4
#define motorR2 P1_5

// for motor 2
#define motorL1 P1_2
#define motorL2 P1_3

// for the claw system
//#define clawO P2_5
//#define clawC P2_6

// the cart system for the crane
#define motorF P3_0
#define motorB P3_1


#define thresholdVolt 0.05 //50/1000
//14550/14580 - doable 
//15150- 14550

//14550	RIGHT
//14700 BACKWARD
//14850 STOP
//15000 FORWARD
//15150	LEFT
#define STOP 		14800 
#define FORWARD		15000
#define BACKWARD 	14650
#define LEFT		15150
#define RIGHT 		14550
#define ERR			50

//#define LCD_D4 P2_4

//#define LCD_D5 P2_3

//#define INPUT P2_0
#define OUT0 P2_0
#define OUT1 P2_1
#define constant_delay_time 10 //how long the delay for each signal is 

#define BUTTON1 P3_2
#define BUTTON2 P3_3



volatile unsigned char pwm_count = 0; // used in the timer 2 ISR
volatile unsigned char pwm_count1 = 0; // this will be usec in the timer 3 ISR
volatile unsigned char pwm_count2 = 0; // this will be used in the timer 4 ISR
volatile unsigned char pwm_count3 = 0; //


volatile unsigned int pwmSig1;
volatile unsigned int pwmSig2;

volatile unsigned int pwmSig3;
volatile unsigned int pwmSig4;

volatile unsigned int pwmSig5;
volatile unsigned int pwmSig6;

volatile unsigned int cartMoveF;
volatile unsigned int cartMoveB;

volatile int flag = 0;
volatile int claw_flag = 0;
int stop[]={1,0,0,0};
int forward[]={1,1,1,1};
int backward[]={1,0,0,0};
int left[]={1,0,1,0};
int right[]={1,1,0,1};

int command[4] = {0,0,0,0};

volatile unsigned int x = 2;

char _c51_external_startup(void)
{
	// Disable Watchdog with key sequence
	SFRPAGE = 0x00;
	WDTCN = 0xDE; //First key
	WDTCN = 0xAD; //Second key

	VDM0CN = 0x80;       // enable VDD monitor
	RSTSRC = 0x02 | 0x04;  // Enable reset on missing clock detector and VDD

#if (SYSCLK == 48000000L)
	SFRPAGE = 0x10;
	PFE0CN = 0x10; // SYSCLK < 50 MHz.
	SFRPAGE = 0x00;
#elif (SYSCLK == 72000000L)
	SFRPAGE = 0x10;
	PFE0CN = 0x20; // SYSCLK < 75 MHz.
	SFRPAGE = 0x00;
#endif

#if (SYSCLK == 12250000L)
	CLKSEL = 0x10;
	CLKSEL = 0x10;
	while ((CLKSEL & 0x80) == 0);
#elif (SYSCLK == 24500000L)
	CLKSEL = 0x00;
	CLKSEL = 0x00;
	while ((CLKSEL & 0x80) == 0);
#elif (SYSCLK == 48000000L)
	// Before setting clock to 48 MHz, must transition to 24.5 MHz first
	CLKSEL = 0x00;
	CLKSEL = 0x00;
	while ((CLKSEL & 0x80) == 0);
	CLKSEL = 0x07;
	CLKSEL = 0x07;
	while ((CLKSEL & 0x80) == 0);
#elif (SYSCLK == 72000000L)
	// Before setting clock to 72 MHz, must transition to 24.5 MHz first
	CLKSEL = 0x00;
	CLKSEL = 0x00;
	while ((CLKSEL & 0x80) == 0);
	CLKSEL = 0x03;
	CLKSEL = 0x03;
	while ((CLKSEL & 0x80) == 0);
#else
#error SYSCLK must be either 12250000L, 24500000L, 48000000L, or 72000000L
#endif

	P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	XBR0 = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)
	XBR1 = 0X00;
	XBR2 = 0x40; // Enable crossbar and weak pull-ups

				 // Configure Uart 0
#if (((SYSCLK/BAUDRATE)/(2L*12L))>0xFFL)
#error Timer 0 reload value is incorrect because (SYSCLK/BAUDRATE)/(2L*12L) > 0xFF
#endif
	SCON0 = 0x10;
	TH1 = 0x100 - ((SYSCLK / BAUDRATE) / (2L * 12L));
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	TMOD |= 0x20;
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready

			 // Initialize timer 2 for periodic interrupts
	TMR2CN0 = 0x00;   // Stop Timer2; Clear TF2;
	CKCON0 |= 0b_0001_0000; // Timer 2 uses the system clock
	TMR2RL = (0x10000L - (SYSCLK / 10000L)); // Initialize reload value
	TMR2 = 0xffff;   // Set to reload immediately
	ET2 = 1;         // Enable Timer2 interrupts
	TR2 = 1;         // Start Timer2 (TMR2CN is bit addressable)
	
/*					 // Initialize timer 4 for periodic interrupts
	TMR4CN0 = 0x00;
	CKCON0 |= 0b_0001_0000;
	TMR4RL = (0x10000L - (SYSCLK / 10000L));
	TMR4 = 0xffff; // set to reload immediately
	ET4 = 1; // enable timer 4 interrupts
	TR4 = 1; // Start timer 4

	TMR3CN0 = 0x00;
	CKCON0 |= 0b_0001_0000;
	TMR3RL = (0x10000L - (SYSCLK / 10000L));
	TMR3 = 0xffff; // set to reload immediately
	ET3 = 1; // enable timer 3 interrupts
	TR3 = 1; // Start timer 3
*/
	EA = 1; // Enable interrupts


	return 0;
}
void Timer3us(unsigned int us)
{
	unsigned int i;               // usec counter
	
	// The input for Timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON0:
	CKCON0|=0b_0100_0000;
	
	TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	
	TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	for (i = 0; i < us; i++)       // Count <us> overflows
	{
		while (!(TMR3CN0 & 0x80));  // Wait for overflow
		TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	}
	TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
}
void waitms (unsigned int ms)
{
	unsigned int j;
	unsigned char k;
	for(j=0; j<ms; j++)
		for (k=0; k<4; k++) Timer3us(250);
}

unsigned int ADC_at_Pin(unsigned char pin)
{
	ADC0MX = pin;   // Select input from pin
	ADBUSY = 1;       // Dummy conversion first to select new pin
	while (ADBUSY); // Wait for dummy conversion to finish
	ADBUSY = 1;     // Convert voltage at the pin
	while (ADBUSY); // Wait for conversion to complete
	return (ADC0);
}

// Forward and Back interrupt
void Timer2_ISR(void) interrupt 5
{
	TF2H = 0; // Clear Timer2 interrupt flag

	pwm_count++;
	if (pwm_count>100)
		pwm_count = 0;

	// this will move the robot forward and backwards if the joystick
	motorR1 = pwm_count>pwmSig1 ? 0 : 1;
	motorR2 = pwm_count>pwmSig2 ? 0 : 1;
	
	motorL1 = pwm_count>pwmSig3 ? 0 : 1;
	motorL2 = pwm_count>pwmSig4 ? 0 : 1;

	OUT0=pwm_count>80?0:1;
}

// interrupt for the wheels
/*
void Timer3_ISR(void) interrupt 14
{
	TF3H = 0;
	pwm_count++;
	if (pwm_count1>100)
		pwm_count1 = 0;
		

}

// this will be used to control the claw thats mounted on the robot
void Timer4_ISR(void) interrupt 17
{
	TF4H = 0;
	pwm_count2++;
	if (pwm_count>100)
		pwm_count = 0;

}

//
void Timer5_ISR(void) interrupt 18
{
	TF5H = 0;
}*/
void InitADC(void)
{
	SFRPAGE = 0x00;
	ADC0CN1 = 0b_10_000_000; //14-bit,  Right justified no shifting applied, perform and Accumulate 1 conversion.
	ADC0CF0 = 0b_11111_0_00; // SYSCLK/32
	ADC0CF1 = 0b_0_0_011110; // Same as default for now
	ADC0CN0 = 0b_0_0_0_0_0_00_0; // Same as default for now
	ADC0CF2 = 0b_0_01_11111; // GND pin, Vref=VDD
	ADC0CN2 = 0b_0_000_0000;  // Same as default for now. ADC0 conversion initiated on write of 1 to ADBUSY.
	ADEN = 1; // Enable ADC
}
void TIMER0_Init(void)
{
	TMOD &= 0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	TMOD |= 0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	TR0 = 0; // Stop Timer/Counter 0
}
#define VDD 3.3035 // The measured value of VDD in volts


float Volts_at_Pin(unsigned char pin)
{
	return ((ADC_at_Pin(pin)*VDD) / 0b_0011_1111_1111_1111);
}
void InitPinADC(unsigned char portno, unsigned char pinno)
{
	unsigned char mask;

	mask = 1 << pinno;

	SFRPAGE = 0x20;
	switch (portno)
	{
	case 0:
		P0MDIN &= (~mask); // Set pin as analog input
		P0SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
	case 1:
		P1MDIN &= (~mask); // Set pin as analog input
		P1SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
	case 2:
		P2MDIN &= (~mask); // Set pin as analog input
		P2SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
	default:
		break;
	}
	SFRPAGE = 0x00;
}

// check the input
// process the input 
// output will be the different pwms
// straight: both wheels move forward
// turning: one wheel is on

void PWMforward(void) {
	pwmSig1 = 99;
	pwmSig2 = 0;
	
	pwmSig3 = 0;
	pwmSig4 =99;

}

void PWMbackward(void) {
	pwmSig1 = 0;
	pwmSig2 = 99;
	
	pwmSig3 = 99;
	pwmSig4 = 0;


}

void PWMLeft(void) {
	pwmSig1 = 0;
	pwmSig2 = 99;
	
	pwmSig3 = 0;
	pwmSig4 = 99;

}

void PWMRight(void) {
	pwmSig1 = 99;
	pwmSig2 = 0;
	
	pwmSig3 = 99;
	pwmSig4 = 0;
//	printf("Right\n\r");
}

void PWMStop(void) {
	pwmSig1 = 0;
	pwmSig2 = 0;
	
	pwmSig3 = 0;
	pwmSig4 = 0;
	//printf("Stop\n\r");
}


float freq_calc(void){
	int overflow_count, period1; 
	// Reset the counter
	TL0=0;  
	TH0=0;
	TF0=0;	
	overflow_count=0;
		
		
	while(P1_6!=0); // Wait for the signal to be zero
	while(P1_6!=1) // Wait for the signal to be one
	{	
		TR0=1;
	/*	if((overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK)>1000){
			TR0=0; 
			return 1;//1000; 
			//break ; 
		}*/
	}
		TL0=0;  
		TH0=0;
		TF0=0;	
		overflow_count=0;
		TR0=1; // Start the timer
		while(P1_6!=0) // Wait for the signal to be zero
		{
			if(TF0==1) // Did the 16-bit timer overflow?
			{
				TF0=0;
				overflow_count++;
			}
		/*	if((overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK)>1000){
				TR0=0; 
				return 1;///1000; 
			}
	*/
		}
		while(P1_6!=1) // Wait for the signal to be one
		{
			if(TF0==1) // Did the 16-bit timer overflow?
			{
				TF0=0;
				overflow_count++;
			}
		/*	if((overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK)>1000){
				TR0=0; 
				return 1;///1000; 

			}*/
			
		}
		TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
		period1=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
		// Send the period to the serial port
		printf( "\rf=%f Hz ,  Period=%fms\n", 1/(period1), period1*1000.0);
		return 1/period1; 

}

void main (void)
{	
	float freq, period1, overflow_count; 
	int i;
	int max=0;   
	TL0=0; 
	TH0=0;
	TF0=0;
	overflow_count=0; 
	TIMER0_Init();

    waitms(500); // Give PuTTy a chance to start before sending
	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	
	printf ("ADC test program\n"
	        "File: %s\n"
	        "Compiled: %s, %s\n\n",
	        __FILE__, __DATE__, __TIME__);
	
	
	InitPinADC(1, 2); // Configure P2.3 as analog input
	InitPinADC(1, 3); // Configure P2.4 as analog input

    InitADC();
	
	//InitPinADC(1, 2); // Configure P2.3 as analog input
	//InitPinADC(1, 3); // Configure P2.4 as analog input

    //InitADC();
   
		//STOP: 	1/1000
		//FORWARD: 	14705
		//BACKWARD:	14850
		//LEFT:		15000
		//RIGHT: 	15300
	while (1)
    {
    	//freq=freq_calc(); 
    	//if((freq>=300 && freq<=450)||(freq>=1400 && freq<=1500)||
  		//(freq>=1060 && freq<=1090)||(time>=1780) || (time>=600 && time<=750) ){
  		
  		// Reset the counter
		TL0=0;  
		TH0=0;
		TF0=0;
		overflow_count=0;
		
		
		//***TEST SIGNAL PERIOD***//
		while(P1_6!=0); // Wait for the signal to be zero
		while(P1_6!=1); // Wait for the signal to be one
		TR0=1; // Start the timer
		while(P1_6!=0) // Wait for the signal to be zero
		{
			if(TF0==1) // Did the 16-bit timer overflow?
			{
				TF0=0;
				overflow_count++;
			}
		}
		while(P1_6!=1) // Wait for the signal to be one
		{
			if(TF0==1) // Did the 16-bit timer overflow?
			{
				TF0=0;
				overflow_count++;
			}
		}
		
		TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
		period1=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
		freq=1/period1; 
		// Send the period to the serial port
		printf( "\rf=%f Hz ,     Period=%fms\n", 1/(period1), period1*1000.0);
  		
  		
  		
  		///***** CHECK COMMAND *****////
  			if(freq>=RIGHT-(ERR) && freq<=RIGHT+ERR){
  				printf("RIGHT\n\r");
  				PWMRight();
  				}
  			else if(freq>=FORWARD-ERR && freq<=FORWARD+ERR){
  				printf("FORWARD\n\r");
  				PWMforward();
  			}
  			else if(freq>=BACKWARD-ERR && freq<=BACKWARD+ERR){
  				printf("BACKWARD\n\r");
  				PWMbackward();
  			}
  			else if(freq>=LEFT-ERR && freq<=LEFT+ERR){
  				printf("LEFT\n\r");
  				PWMLeft();
  			}
  			else //if (freq>=STOP-ERR && freq<=STOP+ERR)//if(time>=2700 && time<=2900){
  			{	printf("STOP\n\r");
  				PWMStop();
  			}
		waitms(1500);
    }
	
}
