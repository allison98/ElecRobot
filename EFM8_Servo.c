//  EFM8_Servo.c: Uses timer 5 interrupt to generate a servo motor control signal.
//
//  Copyright (c) 2010-2018 Jesus Calvino-Fraga
//  ~C51~

#include <EFM8LB1.h>
#include <stdlib.h>
#include <stdio.h>

volatile unsigned int pwm_reload;
volatile unsigned int pwm_reload2;
volatile unsigned int pwm_reload3;

volatile unsigned char pwm_state=0;
volatile unsigned char pwm_state2 = 0;
volatile unsigned char pwm_state3 = 0;

volatile unsigned char count20ms;
volatile unsigned char count20ms2;
volatile unsigned char count20ms3;
#define PWMOUT P2_0
#define PWMOUT2 P3_0
#define PWMOUT3 P3_1

#define SYSCLK 72000000L // SYSCLK frequency in Hz
#define BAUDRATE 115200L
#define RELOAD_10MS (0x10000L-(SYSCLK/(12L*100L)))
#define TIMER_4_FREQ 5000L
#define TIMER_2_FREQ 3000L
char _c51_external_startup (void)
{
	// Disable Watchdog with key sequence
	SFRPAGE = 0x00;
	WDTCN = 0xDE; //First key
	WDTCN = 0xAD; //Second key
  
	VDM0CN |= 0x80;
	RSTSRC = 0x02;

	#if (SYSCLK == 48000000L)	
		SFRPAGE = 0x10;
		PFE0CN  = 0x10; // SYSCLK < 50 MHz.
		SFRPAGE = 0x00;
	#elif (SYSCLK == 72000000L)
		SFRPAGE = 0x10;
		PFE0CN  = 0x20; // SYSCLK < 75 MHz.
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
	
	// Configure the pins used for square output
	P2MDOUT|=0b_0000_0011;
	P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	XBR1     = 0X10; // Enable T0 on P0.0
	XBR2     = 0x40; // Enable crossbar and weak pull-ups

	#if (((SYSCLK/BAUDRATE)/(2L*12L))>0xFFL)
		#error Timer 0 reload value is incorrect because (SYSCLK/BAUDRATE)/(2L*12L) > 0xFF
	#endif
	// Configure Uart 0
	SCON0 = 0x10;
	CKCON0 |= 0b_0000_0000 ; // Timer 1 uses the system clock divided by 12.
	TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready
		
	// Initialize timer 2 for periodic interrupts
	TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	CKCON0|=0b_0001_0000; // Timer 2 uses the system clock
	pwm_reload3=0x10000L-(SYSCLK*1.5e-3)/12.0;
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2 (TMR2CN is bit addressable)
	
	// Initialize timer 4 for periodic interrupts
	SFRPAGE=0x10;
	TMR4CN0=0x00;   // Stop Timer4; Clear TF4; WARNING: lives in SFR page 0x10
	pwm_reload2=0x10000L-(SYSCLK*1.5e-3)/12.0;
	TMR4=0xffff;   // Set to reload immediately
	EIE2|=0b_0000_0100;     // Enable Timer4 interrupts
	TR4=1;

	// Initialize timer 5 for periodic interrupts
	SFRPAGE=0x10;
	TMR5CN0=0x00;
	pwm_reload=0x10000L-(SYSCLK*1.5e-3)/12.0; // 1.5 miliseconds pulse is the center of the servo
	TMR5=0xffff;   // Set to reload immediately
	EIE2|=0b_0000_1000; // Enable Timer5 interrupts
	TR5=1;         // Start Timer5 (TMR5CN0 is bit addressable)
	
	EA=1;
	
	SFRPAGE=0x00;
	
	return 0;
}
void Timer3us(unsigned char us)
{
	unsigned char i;               // usec counter
	
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

void InitPinADC (unsigned char portno, unsigned char pinno)
{
	unsigned char mask;
	
	mask=1<<pinno;

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
#define VDD 3.3
float Volts_at_Pin(unsigned char pin)
{
	return ((ADC_at_Pin(pin)*VDD) / 0b_0011_1111_1111_1111);
}
// Forward and Back interrupt


void Timer2_ISR (void) interrupt INTERRUPT_TIMER2
{
	SFRPAGE=0x0;
	TF2H = 0; // Clear Timer2 interrupt flag
	switch (pwm_state3)
	{
	   case 0:
	      PWMOUT3=1;
	      TMR5RL=RELOAD_10MS;
	      pwm_state3=1;
	      count20ms3++;
	   break;
	   case 1:
	      PWMOUT3=0;
	      TMR2RL=RELOAD_10MS-pwm_reload3;
	      pwm_state3=2;
	   break;
	   default:
	      PWMOUT3=0;
	      TMR2RL=pwm_reload3;
	      pwm_state3=0;
	   break;
	}

}


void Timer5_ISR (void) interrupt INTERRUPT_TIMER5
{
	SFRPAGE=0x10;
	TF5H = 0; // Clear Timer5 interrupt flag
	// Since the maximum time we can achieve with this timer in the
	// configuration above is about 10ms, implement a simple state
	// machine to produce the required 20ms period.
	switch (pwm_state)
	{
	   case 0:
	      PWMOUT=1;
	      TMR5RL=RELOAD_10MS;
	      pwm_state=1;
	      count20ms++;
	   break;
	   case 1:
	      PWMOUT=0;
	      TMR5RL=RELOAD_10MS-pwm_reload;
	      pwm_state=2;
	   break;
	   default:
	      PWMOUT=0;
	      TMR5RL=pwm_reload;
	      pwm_state=0;
	   break;
	}

}
void Timer4_ISR (void) interrupt INTERRUPT_TIMER4
{
	SFRPAGE=0x10;
	TF4H = 0; // Clear Timer4 interrupt flag
	// Since the maximum time we can achieve with this timer in the
	// configuration above is about 10ms, implement a simple state
	// machine to produce the required 20ms period.
	switch (pwm_state2)
	{
	   case 0:
	      PWMOUT2=1;
	      TMR4RL=RELOAD_10MS;
	      pwm_state2=1;
	      count20ms2++;
	   break;
	   case 1:
	      PWMOUT2=0;
	      TMR4RL=RELOAD_10MS-pwm_reload2;
	      pwm_state2=2;
	   break;
	   default:
	      PWMOUT2=0;
	      TMR4RL=pwm_reload2;
	      pwm_state2=0;
	   break;
	}
	}


void main (void)
{
    float pulse_width;
    float left, right, left2, right2, left3, right3;
    float light;
    float pulse_width2, pulse_width3;
    count20ms=0; // Count20ms is an atomic variable, so no problem sharing with timer 5 ISR
    while((1000/20)>count20ms); // Wait a second to give PuTTy a chance to start
    
	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	printf("EFM8 Servo motor signal generation using Timer 5.\r\n");
	
	InitPinADC(2,6);
	InitPinADC(2,5);
	
	InitPinADC(1,6);
	
	InitPinADC(2,3);
	InitPinADC(2,4);
	
	InitPinADC(2,1);
	InitPinADC(2,6);
	
	InitADC();
	pulse_width = 1.5;
	pulse_width2 = 1.5;
	pulse_width3 = 1.5;
	
    // In a HS-422 servo a pulse width between 0.6 to 2.4 ms gives about 180 deg
    // of rotation range.
	while(1)
	{//
	waitms(18);
	if (pulse_width <0.5)
	pulse_width = 0.5;
	else if (pulse_width >2.8)
	pulse_width = 2.8;
	
	if (pulse_width2 <0.5)
	pulse_width2 = 0.5;
	else if (pulse_width2 >2.8)
	pulse_width2 = 2.8;
	
	if (pulse_width3 <1.0)
	pulse_width3 = 1.0;
	else if (pulse_width3 >1.5)
	pulse_width3 = 1.5;
	
	pwm_reload=0x10000L-(SYSCLK*pulse_width*1.0e-3)/12.0;
	pwm_reload2=0x10000L-(SYSCLK*pulse_width2*1.0e-3)/12.0;
	pwm_reload3=0x10000L-(SYSCLK*pulse_width3*1.0e-3)/12.0;
	
	 left = Volts_at_Pin(QFP32_MUX_P2_4);
	 right = Volts_at_Pin(QFP32_MUX_P2_5);
	 
	 left2 = Volts_at_Pin(QFP32_MUX_P2_2);
	 right2 = Volts_at_Pin(QFP32_MUX_P2_3);
	 
	 left3 = Volts_at_Pin(QFP32_MUX_P2_6);
	 right3 = Volts_at_Pin(QFP32_MUX_P2_1);
	 
	 light = Volts_at_Pin(QFP32_MUX_P1_6);
	 
	printf("left = %f, right = %f, light = %f \r\n", left, right, light );
	printf("left2 = %f, right2 = %f, light = %f \r\n", left2, right2, light );
	printf("left3 = %f, right3 = %f, light = %f \r", left3, right3, light );
	
	
	if (left <0.000005 && right >0.000005){
	pulse_width = pulse_width+0.05;
	}
	else if (right <0.000005 && left >0.000005){
	pulse_width = pulse_width-0.05;

	}
	
	if (left2 <0.000005 && right2 >0.000005){
	pulse_width2 = pulse_width2+0.05;
	}
	else if (right2 <0.000005 && left2 >0.000005){
	pulse_width2 = pulse_width2-0.05;

	}
	if (left3 <0.000005 && right3 >0.000005){
	pulse_width3 = pulse_width3+0.05;
	}
	else if (right3 <0.000005 && left3 >0.000005){
	pulse_width3 = pulse_width3-0.05;

	}
	
	if (light <0.6)
	P0_6 = 0;
	else 
	P0_6=1;
	
 
	
	}
}
