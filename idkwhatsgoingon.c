//  square.c: Uses timer 2 interrupt to generate a square wave in pin
//  P2.0 and a 75% duty cycle wave in pin P2.1
//  Copyright (c) 2010-2018 Jesus Calvino-Fraga
//  ~C51~
// This will be the main control code for the claw servo attached to the robot
//

#include <stdio.h>
#include <stdlib.h>
#include <EFM8LB1.h>

// ~C51~

#define SYSCLK 72000000L
#define BAUDRATE 115200L
#define PERIOD 1/15412

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
//#define motorF P3_0
//#define motorB P3_1


#define thresholdVolt 0.5 //50/1000

//#define LCD_D4 P2_4

//#define LCD_D5 P2_3

//#define INPUT P2_0
#define OUT0 P2_0
#define OUT1 P2_1
#define constant_delay_time 20 //how long the delay for each signal is 

#define BUTTON1 P3_1
#define BUTTON2 P3_3
#define BUTTON3 P3_7
#define BUTTON4 P0_5
#define BUTTON5 P0_3

#define LEDGREEN P0_6
#define LEDWHITE P1_0
#define LEDRED P0_7

#define LASER P3_0
#define PIR P2_4


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
int stop[]={0,0,0,0};
int forward[]={1,1,1,1};
int backward[]={1,0,1,1};
int left[]={1,0,0,1};
int right[]={1,0,1,0};

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
	
/*
					 // Initialize timer 4 for periodic interrupts
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

void PWMbackward(void) {
	pwmSig1 = 99;
	pwmSig2 = 0;
	
	pwmSig3 = 0;
	pwmSig4 =99;

	LEDRED = 1;
	LEDGREEN = 1;
	LEDWHITE = 1;
	printf("Backward\n\r");
}

void PWMforward(void) {
	pwmSig1 = 0;
	pwmSig2 = 99;
	
	pwmSig3 = 99;
	pwmSig4 = 0;

	LEDRED = 1;
	LEDGREEN = 1;
	LEDWHITE = 0;
	printf("Forward\n\r");
}

void PWMRight(void) {
	pwmSig1 = 0;
	pwmSig2 = 99;
	
	pwmSig3 = 0;
	pwmSig4 = 99;
	
	LEDRED = 1;
	LEDGREEN = 0;
	LEDWHITE = 1;

	printf("Right\n\r");
}

void PWMLeft(void) {
	pwmSig1 = 99;
	pwmSig2 = 0;
	
	pwmSig3 = 99;
	pwmSig4 = 0;
	
	LEDRED = 1;
	LEDGREEN = 0;
	LEDWHITE = 1;
	
	printf("Left\n\r");
}

void PWMbackwardM(void) {
	pwmSig1 = 50;
	pwmSig2 = 0;
	
	pwmSig3 = 0;
	pwmSig4 =50;

	LEDRED = 1;
	LEDGREEN = 1;
	LEDWHITE = 1;
	printf("Backward\n\r");
}

void PWMforwardM(void) {
	pwmSig1 = 0;
	pwmSig2 = 50;
	
	pwmSig3 = 50;
	pwmSig4 = 0;

	LEDRED = 1;
	LEDGREEN = 1;
	LEDWHITE = 0;
	printf("Forward\n\r");
}

void PWMRightM(void) {
	pwmSig1 = 0;
	pwmSig2 = 50;
	
	pwmSig3 = 0;
	pwmSig4 = 50;
	
	LEDRED = 1;
	LEDGREEN = 0;
	LEDWHITE = 1;

	printf("Right\n\r");
}

void PWMLeftM(void) {
	pwmSig1 = 50;
	pwmSig2 = 0;
	
	pwmSig3 = 50;
	pwmSig4 = 0;
	
	LEDRED = 1;
	LEDGREEN = 0;
	LEDWHITE = 1;
	
	printf("Left\n\r");
}

void PWMStop(void) {
	pwmSig1 = 0;
	pwmSig2 = 0;
	
	pwmSig3 = 0;
	pwmSig4 = 0;
	
	LEDRED = 0;
	LEDGREEN = 1;
	LEDWHITE = 1;
	
	printf("Stop\n\r");
}

float periodcalc(void) {
		float period1;
		int overflow_count;
		
		TL0=0; 
		TH0=0;
		TF0=0;
		overflow_count=0;
		TR0=0;
		
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
		while(P1_6!=1) // Wait for the signal to be zero
		{
			if(TF0==1) // Did the 16-bit timer overflow?
			{
				TF0=0;
				overflow_count++;
			}
			
		}		
		
		TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
		period1=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
		printf("%f\n\r", period1);
		return period1*1000; //return period of high pulse in seconds
}


//compare two arrays and returns true if same else returns false 
int arrayEqual (int arr1[], int size, int arr2[]){
  int i; 
  for(i=0; i<size; i++){
    if(arr1[i]!=arr2[i])
      return 0; 
  }
  return 1; 
}

//checks the signal sent from the transmitter and checks the predetermined commands
//does different activities depending on the command sent
  
void checkCommands (void){
 if(arrayEqual(command, 4, stop)) PWMStop();
 else if (arrayEqual(command,4,forward)) PWMforwardM(); 
 else if (arrayEqual(command,4,backward)) PWMbackwardM(); 
 else if (arrayEqual(command,4, left)) PWMLeftM(); 
 else if (arrayEqual(command,4, right)) PWMRightM(); 
 else PWMStop(); //defaults to a halt (redundant)
 waitms(350);
}

//***SOFTWARE APPROACH*****//

//send the reciever signal back to the microcontroller ADC to get the voltage/ peak/amplitude 
float voltsAtPeak(void) {
//	while(ADC_at_Pin(QFP32_MUX_P1_6)==0); //input pin waiting to be  
	while(ADC_at_Pin(QFP32_MUX_P1_6)==0); //this waiting for the pin to be high/ 1 
	Timer3us((PERIOD*1.0E6)/4.0); //PERIOD IS DEFINED
	return(Volts_at_Pin(QFP32_MUX_P1_6));
//		printf("\t\t\tpeak of reference: =%f \n", peak);
}


//****HARDWARE APPROACH*****//

//WITH THE HELP OF PEAK DETECTOR 
//try to get the signal from zero cross: zero cross gives the period
//get it from the peak detector


//read the signal from the Inductor. The signal from the indcor is called Signal_Inductor
int getDigitalSignal (void){
  
 	if (Volts_at_Pin(QFP32_MUX_P2_3)>=thresholdVolt) //not too low to be a noise/ a valid signal for high, 1
 		{
 		printf("\nread 1:  at pin 2.3: %f\r", Volts_at_Pin(QFP32_MUX_P2_3));
 		return 1;
 		} 
 	else //if (Volts_at_Pin(QFP32_MUX_P2_3)<thresholdVolt){ //noise or too low to be recognozed as a high, 1 
 	//	printf("\nread 0: Volt at pin 2.3: %f\r", Volts_at_Pin(QFP32_MUX_P2_3));
 		return 0; 
 		
}



//wait for a quarter period
void waitquarterperiod(void){
	waitms(constant_delay_time);
}


//read the one bit data from getDigitalSignal and group together inside command array that we 
//compare with the pre-defined left,right,forward and backward arrays using the checkCommands() function
void recieveData (){
	int checkcomm= 0; 
	int i; 
  
  while(getDigitalSignal()==0); 	//wait for the signal to be 1 
  //if (getDigitalSignal()==1){	//gets the first 1 that identifies a command 
  //waitms(60);//175);
  //if (getDigitalSignal()==1)
  waitms(175);	//wait 
  command[0] = 1;
  
  for( i=1; i<4; i++){
  	waitms(358); //wait for a period
  	command[i]=getDigitalSignal();	
  	}
  	
  	checkCommands();				//does activity depending on the command given 
  //	command[0] = 0;
  //	command[1] = 0;
  //	command[2] = 0;
  //	command[3] = 0; 			//clear the command array 
  
  
}

int checkMode(){
	if(!BUTTON1 || x == 0){
		while(!BUTTON1);
		x= 0;
		return 0;
	}
	else if(!BUTTON2 || x == 1){
		while(!BUTTON2);
		x = 1;
		return 1;
	}
	else if(!BUTTON3 || x == 3){
		while(!BUTTON3);
		x = 3;
		return 3;
	}
	else{
		x = 2;
		return 2;
	}
}

//Automation
void detectobstacle(float threshold){

  //int turnOnAutomation = 1;

  //motorR1 = pwm_count>pwmSig1 ? 0 : 1;
  //motorR2 = pwm_count>pwmSig2 ? 0 : 1;

  //motorL1 = pwm_count>pwmSig3 ? 0 : 1;
  //motorL2 = pwm_count>pwmSig4 ? 0 : 1;
  
  //while(turnOnAutomation == 1){
    if(threshold <= 4.0 ){
      //Turn right 90 degrees
      printf("Turn right \r\n");
      PWMRight();
      waitms(500); //Make waits longer
      waitms(500); 
      waitms(300); 
      //stop, check again for obstacle
      PWMStop();
      waitms(500);
      waitms(250);
    }


 	 else{
 	 	printf("Go Straight \r\n");
      	// if no obstacle, go straight
      	PWMforward();
      }


    //}
}

void laserPattern(float rate){
	LASER = 0;
	if(rate<0.8)
		waitms(200);
	else if(rate>=0.8 && rate<4.0)
		waitms(500);
	else if(rate>=8.0 && rate<8.8)
		waitms(800);
	else
		waitms(1000);
	LASER = 1;
}

void main(void)
{
	int checkcommand= 0, i;
	int sig1 = 0;
	int sig2 = 0;
	float  peak = 0;
	float voltspeak=0;
	float periodpwm = 0;
	
	float period = 0;
	int overflow_count=0;
	float pir_voltage;
	
	int mode_toggle = 2; //0 = auto ; 1 = manual ; 2 = do nothing
	
	TL0=0;
	TH0=0;
	TF0=0;	
	TIMER0_Init();

	InitPinADC(1, 6); // Configure P2.5 as analog input
	InitPinADC(2, 3); //???	
	InitPinADC(2, 4); //PIR
	InitPinADC(2, 6); //Temp Sensor
	InitADC();
		
	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	printf("Square wave generator for the EFM8LB1.\r\n"
		"Check pins P2.2 and P2.1 with the oscilloscope.\r\n");

	printf("\n\r");
	//time = 0;
	PWMStop();
	//SPEAKER = 0;
	while (1)
	{
		mode_toggle = checkMode();
	
		//Auto
		if(mode_toggle == 0){
		printf("auto \r\n");
			overflow_count=0;
			TL0=0; 
			TH0=0;
			TF0=0;
		
			while(P2_1!=0); // Wait for the signal to be zero
			while(P2_1!=1); // Wait for the signal to be one
			TR0=1; // Start the timer
			while(P2_1!=0) // Wait for the signal to be zero
			{
				if(TF0==1) // Did the 16-bit timer overflow?
				{
					TF0=0;
					overflow_count++;
				}
			}
			/*while(P2_1!=1) // Wait for the signal to be one
			{
				if(TF0==1) // Did the 16-bit timer overflow?
				{
					TF0=0;
					overflow_count++;
				}
			}*/
			TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
			period=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
			// Send the period to the serial port
			printf( "\rT=%f ms   \n ", period*1000.0);
					waitms(50);
			detectobstacle(period*1000.0);
			laserPattern(period*1000);
			
			//use period to create limit commands
			
			///speed=343.00;
		//	distance=speed*period*1000;
		//	distance=(period*10000000)*0.0061;
		//	printf( "\rdistance = %f cm\n ", (distance));
			
			waitms(50);	
			
		}
		//Manual
		else if(mode_toggle == 1){
			recieveData();	//keep reading data continously 
	    	printf("Command: ");
	    	for(i=0; i<4; i++)
	    		 printf("%d\t", command[i]);
	    	printf("\n\r");
	    	command[0] = 0;
	  		command[1] = 0;
	  		command[2] = 0;
	  		command[3] = 0;
			
			//periodcalc(); 
  		}
		else if( mode_toggle == 3){
			pir_voltage = Volts_at_Pin(QFP32_MUX_P2_4);
			if(pir_voltage >= 3.0 && pir_voltage <= 3.4)
				PWMStop();
			else
				PWMforward();
			waitms(100);
			printf("pir_voltage: %f \r\n", pir_voltage);
		
		}
		else{
			printf("Do nothing\r\n");	
		 }
	}
} 