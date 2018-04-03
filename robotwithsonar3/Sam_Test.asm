;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Mon Apr 02 19:12:03 2018
;--------------------------------------------------------
$name Sam_Test
$optc51 --model-small
$printf_float
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _InitPinADC_PARM_2
	public _main
	public _detectobstacle
	public _waitquarterperiod
	public _voltsAtPeak
	public _checkTime
	public _PWMStop
	public _PWMRight
	public _PWMLeft
	public _PWMbackward
	public _PWMforward
	public _InitPinADC
	public _Volts_at_Pin
	public _TIMER0_Init
	public _InitADC
	public _Timer2_ISR
	public _ADC_at_Pin
	public _waitms
	public _Timer3us
	public __c51_external_startup
	public _command
	public _right
	public _left
	public _backward
	public _forward
	public _stop
	public _claw_flag
	public _flag
	public _cartMoveB
	public _cartMoveF
	public _pwmSig6
	public _pwmSig5
	public _pwmSig4
	public _pwmSig3
	public _pwmSig2
	public _pwmSig1
	public _pwm_count3
	public _pwm_count2
	public _pwm_count1
	public _pwm_count
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_ADC0ASAH       DATA 0xb6
_ADC0ASAL       DATA 0xb5
_ADC0ASCF       DATA 0xa1
_ADC0ASCT       DATA 0xc7
_ADC0CF0        DATA 0xbc
_ADC0CF1        DATA 0xb9
_ADC0CF2        DATA 0xdf
_ADC0CN0        DATA 0xe8
_ADC0CN1        DATA 0xb2
_ADC0CN2        DATA 0xb3
_ADC0GTH        DATA 0xc4
_ADC0GTL        DATA 0xc3
_ADC0H          DATA 0xbe
_ADC0L          DATA 0xbd
_ADC0LTH        DATA 0xc6
_ADC0LTL        DATA 0xc5
_ADC0MX         DATA 0xbb
_B              DATA 0xf0
_CKCON0         DATA 0x8e
_CKCON1         DATA 0xa6
_CLEN0          DATA 0xc6
_CLIE0          DATA 0xc7
_CLIF0          DATA 0xe8
_CLKSEL         DATA 0xa9
_CLOUT0         DATA 0xd1
_CLU0CF         DATA 0xb1
_CLU0FN         DATA 0xaf
_CLU0MX         DATA 0x84
_CLU1CF         DATA 0xb3
_CLU1FN         DATA 0xb2
_CLU1MX         DATA 0x85
_CLU2CF         DATA 0xb6
_CLU2FN         DATA 0xb5
_CLU2MX         DATA 0x91
_CLU3CF         DATA 0xbf
_CLU3FN         DATA 0xbe
_CLU3MX         DATA 0xae
_CMP0CN0        DATA 0x9b
_CMP0CN1        DATA 0x99
_CMP0MD         DATA 0x9d
_CMP0MX         DATA 0x9f
_CMP1CN0        DATA 0xbf
_CMP1CN1        DATA 0xac
_CMP1MD         DATA 0xab
_CMP1MX         DATA 0xaa
_CRC0CN0        DATA 0xce
_CRC0CN1        DATA 0x86
_CRC0CNT        DATA 0xd3
_CRC0DAT        DATA 0xcb
_CRC0FLIP       DATA 0xcf
_CRC0IN         DATA 0xca
_CRC0ST         DATA 0xd2
_DAC0CF0        DATA 0x91
_DAC0CF1        DATA 0x92
_DAC0H          DATA 0x85
_DAC0L          DATA 0x84
_DAC1CF0        DATA 0x93
_DAC1CF1        DATA 0x94
_DAC1H          DATA 0x8a
_DAC1L          DATA 0x89
_DAC2CF0        DATA 0x95
_DAC2CF1        DATA 0x96
_DAC2H          DATA 0x8c
_DAC2L          DATA 0x8b
_DAC3CF0        DATA 0x9a
_DAC3CF1        DATA 0x9c
_DAC3H          DATA 0x8e
_DAC3L          DATA 0x8d
_DACGCF0        DATA 0x88
_DACGCF1        DATA 0x98
_DACGCF2        DATA 0xa2
_DERIVID        DATA 0xad
_DEVICEID       DATA 0xb5
_DPH            DATA 0x83
_DPL            DATA 0x82
_EIE1           DATA 0xe6
_EIE2           DATA 0xf3
_EIP1           DATA 0xbb
_EIP1H          DATA 0xee
_EIP2           DATA 0xed
_EIP2H          DATA 0xf6
_EMI0CN         DATA 0xe7
_FLKEY          DATA 0xb7
_HFO0CAL        DATA 0xc7
_HFO1CAL        DATA 0xd6
_HFOCN          DATA 0xef
_I2C0ADM        DATA 0xff
_I2C0CN0        DATA 0xba
_I2C0DIN        DATA 0xbc
_I2C0DOUT       DATA 0xbb
_I2C0FCN0       DATA 0xad
_I2C0FCN1       DATA 0xab
_I2C0FCT        DATA 0xf5
_I2C0SLAD       DATA 0xbd
_I2C0STAT       DATA 0xb9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xf2
_IT01CF         DATA 0xe4
_LFO0CN         DATA 0xb1
_P0             DATA 0x80
_P0MASK         DATA 0xfe
_P0MAT          DATA 0xfd
_P0MDIN         DATA 0xf1
_P0MDOUT        DATA 0xa4
_P0SKIP         DATA 0xd4
_P1             DATA 0x90
_P1MASK         DATA 0xee
_P1MAT          DATA 0xed
_P1MDIN         DATA 0xf2
_P1MDOUT        DATA 0xa5
_P1SKIP         DATA 0xd5
_P2             DATA 0xa0
_P2MASK         DATA 0xfc
_P2MAT          DATA 0xfb
_P2MDIN         DATA 0xf3
_P2MDOUT        DATA 0xa6
_P2SKIP         DATA 0xcc
_P3             DATA 0xb0
_P3MDIN         DATA 0xf4
_P3MDOUT        DATA 0x9c
_PCA0CENT       DATA 0x9e
_PCA0CLR        DATA 0x9c
_PCA0CN0        DATA 0xd8
_PCA0CPH0       DATA 0xfc
_PCA0CPH1       DATA 0xea
_PCA0CPH2       DATA 0xec
_PCA0CPH3       DATA 0xf5
_PCA0CPH4       DATA 0x85
_PCA0CPH5       DATA 0xde
_PCA0CPL0       DATA 0xfb
_PCA0CPL1       DATA 0xe9
_PCA0CPL2       DATA 0xeb
_PCA0CPL3       DATA 0xf4
_PCA0CPL4       DATA 0x84
_PCA0CPL5       DATA 0xdd
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xae
_PCA0CPM4       DATA 0xaf
_PCA0CPM5       DATA 0xcc
_PCA0H          DATA 0xfa
_PCA0L          DATA 0xf9
_PCA0MD         DATA 0xd9
_PCA0POL        DATA 0x96
_PCA0PWM        DATA 0xf7
_PCON0          DATA 0x87
_PCON1          DATA 0xcd
_PFE0CN         DATA 0xc1
_PRTDRV         DATA 0xf6
_PSCTL          DATA 0x8f
_PSTAT0         DATA 0xaa
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_REG0CN         DATA 0xc9
_REVID          DATA 0xb6
_RSTSRC         DATA 0xef
_SBCON1         DATA 0x94
_SBRLH1         DATA 0x96
_SBRLL1         DATA 0x95
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_SBUF1          DATA 0x92
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SCON1          DATA 0xc8
_SFRPAGE        DATA 0xa7
_SFRPGCN        DATA 0xbc
_SFRSTACK       DATA 0xd7
_SMB0ADM        DATA 0xd6
_SMB0ADR        DATA 0xd7
_SMB0CF         DATA 0xc1
_SMB0CN0        DATA 0xc0
_SMB0DAT        DATA 0xc2
_SMB0FCN0       DATA 0xc3
_SMB0FCN1       DATA 0xc4
_SMB0FCT        DATA 0xef
_SMB0RXLN       DATA 0xc5
_SMB0TC         DATA 0xac
_SMOD1          DATA 0x93
_SP             DATA 0x81
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0CN0        DATA 0xf8
_SPI0DAT        DATA 0xa3
_SPI0FCN0       DATA 0x9a
_SPI0FCN1       DATA 0x9b
_SPI0FCT        DATA 0xf7
_SPI0PCF        DATA 0xdf
_TCON           DATA 0x88
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TMOD           DATA 0x89
_TMR2CN0        DATA 0xc8
_TMR2CN1        DATA 0xfd
_TMR2H          DATA 0xcf
_TMR2L          DATA 0xce
_TMR2RLH        DATA 0xcb
_TMR2RLL        DATA 0xca
_TMR3CN0        DATA 0x91
_TMR3CN1        DATA 0xfe
_TMR3H          DATA 0x95
_TMR3L          DATA 0x94
_TMR3RLH        DATA 0x93
_TMR3RLL        DATA 0x92
_TMR4CN0        DATA 0x98
_TMR4CN1        DATA 0xff
_TMR4H          DATA 0xa5
_TMR4L          DATA 0xa4
_TMR4RLH        DATA 0xa3
_TMR4RLL        DATA 0xa2
_TMR5CN0        DATA 0xc0
_TMR5CN1        DATA 0xf1
_TMR5H          DATA 0xd5
_TMR5L          DATA 0xd4
_TMR5RLH        DATA 0xd3
_TMR5RLL        DATA 0xd2
_UART0PCF       DATA 0xd9
_UART1FCN0      DATA 0x9d
_UART1FCN1      DATA 0xd8
_UART1FCT       DATA 0xfa
_UART1LIN       DATA 0x9e
_UART1PCF       DATA 0xda
_VDM0CN         DATA 0xff
_WDTCN          DATA 0x97
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_XOSC0CN        DATA 0x86
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0xa3a2
_TMR5RL         DATA 0xd3d2
_TMR0           DATA 0x8c8a
_TMR1           DATA 0x8d8b
_TMR2           DATA 0xcfce
_TMR3           DATA 0x9594
_TMR4           DATA 0xa5a4
_TMR5           DATA 0xd5d4
_SBRL1          DATA 0x9695
_PCA0           DATA 0xfaf9
_PCA0CP0        DATA 0xfcfb
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xf5f4
_PCA0CP4        DATA 0x8584
_PCA0CP5        DATA 0xdedd
_ADC0ASA        DATA 0xb6b5
_ADC0GT         DATA 0xc4c3
_ADC0           DATA 0xbebd
_ADC0LT         DATA 0xc6c5
_DAC0           DATA 0x8584
_DAC1           DATA 0x8a89
_DAC2           DATA 0x8c8b
_DAC3           DATA 0x8e8d
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_TEMPE          BIT 0xe8
_ADGN0          BIT 0xe9
_ADGN1          BIT 0xea
_ADWINT         BIT 0xeb
_ADBUSY         BIT 0xec
_ADINT          BIT 0xed
_IPOEN          BIT 0xee
_ADEN           BIT 0xef
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_C0FIF          BIT 0xe8
_C0RIF          BIT 0xe9
_C1FIF          BIT 0xea
_C1RIF          BIT 0xeb
_C2FIF          BIT 0xec
_C2RIF          BIT 0xed
_C3FIF          BIT 0xee
_C3RIF          BIT 0xef
_D1SRC0         BIT 0x88
_D1SRC1         BIT 0x89
_D1AMEN         BIT 0x8a
_D01REFSL       BIT 0x8b
_D3SRC0         BIT 0x8c
_D3SRC1         BIT 0x8d
_D3AMEN         BIT 0x8e
_D23REFSL       BIT 0x8f
_D0UDIS         BIT 0x98
_D1UDIS         BIT 0x99
_D2UDIS         BIT 0x9a
_D3UDIS         BIT 0x9b
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES0            BIT 0xac
_ET2            BIT 0xad
_ESPI0          BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS0            BIT 0xbc
_PT2            BIT 0xbd
_PSPI0          BIT 0xbe
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_7           BIT 0xb7
_CCF0           BIT 0xd8
_CCF1           BIT 0xd9
_CCF2           BIT 0xda
_CCF3           BIT 0xdb
_CCF4           BIT 0xdc
_CCF5           BIT 0xdd
_CR             BIT 0xde
_CF             BIT 0xdf
_PARITY         BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_CE             BIT 0x9d
_SMODE          BIT 0x9e
_RI1            BIT 0xc8
_TI1            BIT 0xc9
_RBX1           BIT 0xca
_TBX1           BIT 0xcb
_REN1           BIT 0xcc
_PERR1          BIT 0xcd
_OVR1           BIT 0xce
_SI             BIT 0xc0
_ACK            BIT 0xc1
_ARBLOST        BIT 0xc2
_ACKRQ          BIT 0xc3
_STO            BIT 0xc4
_STA            BIT 0xc5
_TXMODE         BIT 0xc6
_MASTER         BIT 0xc7
_SPIEN          BIT 0xf8
_TXNF           BIT 0xf9
_NSSMD0         BIT 0xfa
_NSSMD1         BIT 0xfb
_RXOVRN         BIT 0xfc
_MODF           BIT 0xfd
_WCOL           BIT 0xfe
_SPIF           BIT 0xff
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_T2XCLK0        BIT 0xc8
_T2XCLK1        BIT 0xc9
_TR2            BIT 0xca
_T2SPLIT        BIT 0xcb
_TF2CEN         BIT 0xcc
_TF2LEN         BIT 0xcd
_TF2L           BIT 0xce
_TF2H           BIT 0xcf
_T4XCLK0        BIT 0x98
_T4XCLK1        BIT 0x99
_TR4            BIT 0x9a
_T4SPLIT        BIT 0x9b
_TF4CEN         BIT 0x9c
_TF4LEN         BIT 0x9d
_TF4L           BIT 0x9e
_TF4H           BIT 0x9f
_T5XCLK0        BIT 0xc0
_T5XCLK1        BIT 0xc1
_TR5            BIT 0xc2
_T5SPLIT        BIT 0xc3
_TF5CEN         BIT 0xc4
_TF5LEN         BIT 0xc5
_TF5L           BIT 0xc6
_TF5H           BIT 0xc7
_RIE            BIT 0xd8
_RXTO0          BIT 0xd9
_RXTO1          BIT 0xda
_RFRQ           BIT 0xdb
_TIE            BIT 0xdc
_TXHOLD         BIT 0xdd
_TXNF1          BIT 0xde
_TFRQ           BIT 0xdf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_pwm_count:
	ds 1
_pwm_count1:
	ds 1
_pwm_count2:
	ds 1
_pwm_count3:
	ds 1
_pwmSig1:
	ds 2
_pwmSig2:
	ds 2
_pwmSig3:
	ds 2
_pwmSig4:
	ds 2
_pwmSig5:
	ds 2
_pwmSig6:
	ds 2
_cartMoveF:
	ds 2
_cartMoveB:
	ds 2
_flag:
	ds 2
_claw_flag:
	ds 2
_stop:
	ds 8
_forward:
	ds 8
_backward:
	ds 8
_left:
	ds 8
_right:
	ds 8
_command:
	ds 8
_checkTime_overflow_count_1_73:
	ds 2
_checkTime_sloc0_1_0:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
_InitPinADC_PARM_2:
	ds 1
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_Timer2_ISR_sloc0_1_0:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x002b
	ljmp	_Timer2_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:53: volatile unsigned char pwm_count = 0; // used in the timer 2 ISR
	mov	_pwm_count,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:54: volatile unsigned char pwm_count1 = 0; // this will be usec in the timer 3 ISR
	mov	_pwm_count1,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:55: volatile unsigned char pwm_count2 = 0; // this will be used in the timer 4 ISR
	mov	_pwm_count2,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:56: volatile unsigned char pwm_count3 = 0; //
	mov	_pwm_count3,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:71: volatile int flag = 0;
	clr	a
	mov	_flag,a
	mov	(_flag + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:72: volatile int claw_flag = 0;
	clr	a
	mov	_claw_flag,a
	mov	(_claw_flag + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:73: int stop[]={1,0,0,0};
	mov	_stop,#0x01
	mov	(_stop + 1),#0x00
	mov	(_stop + 0x0002),#0x00
	mov	((_stop + 0x0002) + 1),#0x00
	mov	(_stop + 0x0004),#0x00
	mov	((_stop + 0x0004) + 1),#0x00
	mov	(_stop + 0x0006),#0x00
	mov	((_stop + 0x0006) + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:74: int forward[]={1,1,1,1};
	mov	_forward,#0x01
	mov	(_forward + 1),#0x00
	mov	(_forward + 0x0002),#0x01
	mov	((_forward + 0x0002) + 1),#0x00
	mov	(_forward + 0x0004),#0x01
	mov	((_forward + 0x0004) + 1),#0x00
	mov	(_forward + 0x0006),#0x01
	mov	((_forward + 0x0006) + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:75: int backward[]={1,0,0,0};
	mov	_backward,#0x01
	mov	(_backward + 1),#0x00
	mov	(_backward + 0x0002),#0x00
	mov	((_backward + 0x0002) + 1),#0x00
	mov	(_backward + 0x0004),#0x00
	mov	((_backward + 0x0004) + 1),#0x00
	mov	(_backward + 0x0006),#0x00
	mov	((_backward + 0x0006) + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:76: int left[]={1,0,1,0};
	mov	_left,#0x01
	mov	(_left + 1),#0x00
	mov	(_left + 0x0002),#0x00
	mov	((_left + 0x0002) + 1),#0x00
	mov	(_left + 0x0004),#0x01
	mov	((_left + 0x0004) + 1),#0x00
	mov	(_left + 0x0006),#0x00
	mov	((_left + 0x0006) + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:77: int right[]={1,1,0,1};
	mov	_right,#0x01
	mov	(_right + 1),#0x00
	mov	(_right + 0x0002),#0x01
	mov	((_right + 0x0002) + 1),#0x00
	mov	(_right + 0x0004),#0x00
	mov	((_right + 0x0004) + 1),#0x00
	mov	(_right + 0x0006),#0x01
	mov	((_right + 0x0006) + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:79: int command[4] = {0,0,0,0};
	mov	_command,#0x00
	mov	(_command + 1),#0x00
	mov	(_command + 0x0002),#0x00
	mov	((_command + 0x0002) + 1),#0x00
	mov	(_command + 0x0004),#0x00
	mov	((_command + 0x0004) + 1),#0x00
	mov	(_command + 0x0006),#0x00
	mov	((_command + 0x0006) + 1),#0x00
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:81: char _c51_external_startup(void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:84: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:85: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:86: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:88: VDM0CN = 0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:89: RSTSRC = 0x02 | 0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:96: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:97: PFE0CN = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:98: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:119: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:120: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:121: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:122: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:123: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:124: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:129: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:130: XBR0 = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)
	mov	_XBR0,#0x01
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:131: XBR1 = 0X00;
	mov	_XBR1,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:132: XBR2 = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:138: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:139: TH1 = 0x100 - ((SYSCLK / BAUDRATE) / (2L * 12L));
	mov	_TH1,#0xE6
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:140: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:141: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:142: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:143: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:144: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:147: TMR2CN0 = 0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:148: CKCON0 |= 0b_0001_0000; // Timer 2 uses the system clock
	orl	_CKCON0,#0x10
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:149: TMR2RL = (0x10000L - (SYSCLK / 10000L)); // Initialize reload value
	mov	_TMR2RL,#0xE0
	mov	(_TMR2RL >> 8),#0xE3
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:150: TMR2 = 0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:151: ET2 = 1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:152: TR2 = 1;         // Start Timer2 (TMR2CN is bit addressable)
	setb	_TR2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:169: EA = 1; // Enable interrupts
	setb	_EA
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:172: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 r3 
;i                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:174: void Timer3us(unsigned int us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:179: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:181: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:182: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:184: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:185: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r4,#0x00
	mov	r5,#0x00
L003004?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L003007?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:187: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L003001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L003001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:188: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:185: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r4
	cjne	r4,#0x00,L003004?
	inc	r5
	sjmp	L003004?
L003007?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:190: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:192: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:196: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L004005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L004009?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:197: for (k=0; k<4; k++) Timer3us(250);
	mov	r6,#0x00
L004001?:
	cjne	r6,#0x04,L004018?
L004018?:
	jnc	L004007?
	mov	dptr,#0x00FA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Timer3us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r6
	sjmp	L004001?
L004007?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:196: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L004005?
	inc	r5
	sjmp	L004005?
L004009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:200: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_ADC0MX,dpl
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:203: ADBUSY = 1;       // Dummy conversion first to select new pin
	setb	_ADBUSY
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:204: while (ADBUSY); // Wait for dummy conversion to finish
L005001?:
	jb	_ADBUSY,L005001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:205: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:206: while (ADBUSY); // Wait for conversion to complete
L005004?:
	jb	_ADBUSY,L005004?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:207: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:211: void Timer2_ISR(void) interrupt 5
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	push	acc
	push	ar2
	push	ar3
	push	psw
	mov	psw,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:213: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:215: pwm_count++;
	inc	_pwm_count
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:216: if (pwm_count>100)
	mov	a,_pwm_count
	add	a,#0xff - 0x64
	jnc	L006002?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:217: pwm_count = 0;
	mov	_pwm_count,#0x00
L006002?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:220: motorR1 = pwm_count>pwmSig1 ? 0 : 1;  //rightforward
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_pwmSig1
	subb	a,r2
	mov	a,(_pwmSig1 + 1)
	subb	a,r3
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_4,c
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:221: motorR2 = pwm_count>pwmSig2 ? 0 : 1;  //rightbackward
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_pwmSig2
	subb	a,r2
	mov	a,(_pwmSig2 + 1)
	subb	a,r3
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_5,c
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:223: motorL1 = pwm_count>pwmSig3 ? 0 : 1;  //leftforward
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_pwmSig3
	subb	a,r2
	mov	a,(_pwmSig3 + 1)
	subb	a,r3
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_2,c
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:224: motorL2 = pwm_count>pwmSig4 ? 0 : 1;  //leftbackward
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_pwmSig4
	subb	a,r2
	mov	a,(_pwmSig4 + 1)
	subb	a,r3
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_3,c
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:226: OUT0=pwm_count>80?0:1;
	mov	a,_pwm_count
	add	a,#0xff - 0x50
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_0,c
	pop	psw
	pop	ar3
	pop	ar2
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:230: void InitADC(void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:232: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:233: ADC0CN1 = 0b_10_000_000; //14-bit,  Right justified no shifting applied, perform and Accumulate 1 conversion.
	mov	_ADC0CN1,#0x80
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:234: ADC0CF0 = 0b_11111_0_00; // SYSCLK/32
	mov	_ADC0CF0,#0xF8
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:235: ADC0CF1 = 0b_0_0_011110; // Same as default for now
	mov	_ADC0CF1,#0x1E
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:236: ADC0CN0 = 0b_0_0_0_0_0_00_0; // Same as default for now
	mov	_ADC0CN0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:237: ADC0CF2 = 0b_0_01_11111; // GND pin, Vref=VDD
	mov	_ADC0CF2,#0x3F
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:238: ADC0CN2 = 0b_0_000_0000;  // Same as default for now. ADC0 conversion initiated on write of 1 to ADBUSY.
	mov	_ADC0CN2,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:239: ADEN = 1; // Enable ADC
	setb	_ADEN
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIMER0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:241: void TIMER0_Init(void)
;	-----------------------------------------
;	 function TIMER0_Init
;	-----------------------------------------
_TIMER0_Init:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:243: TMOD &= 0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	anl	_TMOD,#0xF0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:244: TMOD |= 0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	orl	_TMOD,#0x01
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:245: TR0 = 0; // Stop Timer/Counter 0
	clr	_TR0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:250: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:252: return ((ADC_at_Pin(pin)*VDD) / 0b_0011_1111_1111_1111);
	lcall	_ADC_at_Pin
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x6C8B
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xFC
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pinno                     Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:254: void InitPinADC(unsigned char portno, unsigned char pinno)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:258: mask = 1 << pinno;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L010013?
L010011?:
	add	a,acc
L010013?:
	djnz	b,L010011?
	mov	r3,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:260: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:261: switch (portno)
	cjne	r2,#0x00,L010014?
	sjmp	L010001?
L010014?:
	cjne	r2,#0x01,L010015?
	sjmp	L010002?
L010015?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:263: case 0:
	cjne	r2,#0x02,L010005?
	sjmp	L010003?
L010001?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:264: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P0MDIN,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:265: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:266: break;
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:267: case 1:
	sjmp	L010005?
L010002?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:268: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P1MDIN,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:269: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:270: break;
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:271: case 2:
	sjmp	L010005?
L010003?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:272: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P2MDIN,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:273: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:277: }
L010005?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:278: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PWMforward'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:287: void PWMforward(void) {
;	-----------------------------------------
;	 function PWMforward
;	-----------------------------------------
_PWMforward:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:288: pwmSig1 = 99;
	mov	_pwmSig1,#0x63
	clr	a
	mov	(_pwmSig1 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:289: pwmSig2 = 0;
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:291: pwmSig3 = 0;
	clr	a
	mov	_pwmSig2,a
	mov	(_pwmSig2 + 1),a
	mov	_pwmSig3,a
	mov	(_pwmSig3 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:292: pwmSig4 = 99;
	mov	_pwmSig4,#0x63
	clr	a
	mov	(_pwmSig4 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:293: printf("Forward\n\r");
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PWMbackward'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:296: void PWMbackward(void) {
;	-----------------------------------------
;	 function PWMbackward
;	-----------------------------------------
_PWMbackward:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:297: pwmSig1 = 0;
	clr	a
	mov	_pwmSig1,a
	mov	(_pwmSig1 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:298: pwmSig2 = 99;
	mov	_pwmSig2,#0x63
	clr	a
	mov	(_pwmSig2 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:300: pwmSig3 = 99;
	mov	_pwmSig3,#0x63
	clr	a
	mov	(_pwmSig3 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:301: pwmSig4 = 0;
	clr	a
	mov	_pwmSig4,a
	mov	(_pwmSig4 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:302: printf("Backward\n\r");
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PWMLeft'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:305: void PWMLeft(void) {
;	-----------------------------------------
;	 function PWMLeft
;	-----------------------------------------
_PWMLeft:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:306: pwmSig1 = 0;
	clr	a
	mov	_pwmSig1,a
	mov	(_pwmSig1 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:307: pwmSig2 = 99;
	mov	_pwmSig2,#0x63
	clr	a
	mov	(_pwmSig2 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:308: pwmSig3 = 0;
	clr	a
	mov	_pwmSig3,a
	mov	(_pwmSig3 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:309: pwmSig4 = 99;
	mov	_pwmSig4,#0x63
	clr	a
	mov	(_pwmSig4 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:310: printf("Left\n\r");
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PWMRight'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:313: void PWMRight(void) {
;	-----------------------------------------
;	 function PWMRight
;	-----------------------------------------
_PWMRight:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:314: pwmSig1 = 99;
	mov	_pwmSig1,#0x63
	clr	a
	mov	(_pwmSig1 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:315: pwmSig2 = 0;
	clr	a
	mov	_pwmSig2,a
	mov	(_pwmSig2 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:317: pwmSig3 = 99;
	mov	_pwmSig3,#0x63
	clr	a
	mov	(_pwmSig3 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:318: pwmSig4 = 0;
	clr	a
	mov	_pwmSig4,a
	mov	(_pwmSig4 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:319: printf("Right\n\r");
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PWMStop'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:322: void PWMStop(void) {
;	-----------------------------------------
;	 function PWMStop
;	-----------------------------------------
_PWMStop:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:323: pwmSig1 = 0;
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:324: pwmSig2 = 0;
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:326: pwmSig3 = 0;
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:327: pwmSig4 = 0;
	clr	a
	mov	_pwmSig1,a
	mov	(_pwmSig1 + 1),a
	mov	_pwmSig2,a
	mov	(_pwmSig2 + 1),a
	mov	_pwmSig3,a
	mov	(_pwmSig3 + 1),a
	mov	_pwmSig4,a
	mov	(_pwmSig4 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:328: printf("Stop\n\r");
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'checkTime'
;------------------------------------------------------------
;time                      Allocated to registers r2 r3 r4 r5 
;overflow_count            Allocated with name '_checkTime_overflow_count_1_73'
;sloc0                     Allocated with name '_checkTime_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:334: float checkTime (void) {
;	-----------------------------------------
;	 function checkTime
;	-----------------------------------------
_checkTime:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:338: TL0=0; 
	mov	_TL0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:339: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:340: TF0=0;
	clr	_TF0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:342: TR0=0;
	clr	_TR0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:347: printf("Waiting for the signal to be 1\n\r");
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:348: printf("Volt at ADC: %f\n\r", Volts_at_Pin(QFP32_MUX_P1_6));
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:349: while(Volts_at_Pin(QFP32_MUX_P1_6) < thresholdVolt);
L016001?:
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	mov	a,#0x4C
	push	acc
	mov	a,#0x3D
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L016001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:350: while(Volts_at_Pin(QFP32_MUX_P1_6) >= thresholdVolt); //wait for the signal to be 0
L016004?:
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	mov	a,#0x4C
	push	acc
	mov	a,#0x3D
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L016004?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:351: printf("Signal is 0\n\r");
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:352: printf("Volt at ADC: %f\n\r", Volts_at_Pin(QFP32_MUX_P1_6));
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:353: printf("Start Timer\n\r");
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:354: TR0=1; // Start the timer
	setb	_TR0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:356: while (Volts_at_Pin(QFP32_MUX_P1_6) < thresholdVolt) {	// wait for signal to be 1
	clr	a
	mov	_checkTime_overflow_count_1_73,a
	mov	(_checkTime_overflow_count_1_73 + 1),a
L016009?:
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	mov	a,#0x4C
	push	acc
	mov	a,#0x3D
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jz	L016011?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:357: printf("Volt at ADC: %f\n\r", Volts_at_Pin(QFP32_MUX_P1_6));
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:358: if(TF0==1) { // Did the 16-bit timer overflow			{
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:359: TF0=0;
	jbc	_TF0,L016035?
	sjmp	L016009?
L016035?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:360: overflow_count++;
	inc	_checkTime_overflow_count_1_73
	clr	a
	cjne	a,_checkTime_overflow_count_1_73,L016009?
	inc	(_checkTime_overflow_count_1_73 + 1)
	sjmp	L016009?
L016011?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:369: if ((overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK)*1000 < 10) {
	mov	dpl,_checkTime_overflow_count_1_73
	mov	dph,(_checkTime_overflow_count_1_73 + 1)
	lcall	___sint2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	_checkTime_sloc0_1_0,dpl
	mov	(_checkTime_sloc0_1_0 + 1),dph
	mov	(_checkTime_sloc0_1_0 + 2),b
	mov	(_checkTime_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	mov	dpl,_checkTime_sloc0_1_0
	mov	dph,(_checkTime_sloc0_1_0 + 1)
	mov	b,(_checkTime_sloc0_1_0 + 2)
	mov	a,(_checkTime_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	_checkTime_sloc0_1_0,dpl
	mov	(_checkTime_sloc0_1_0 + 1),dph
	mov	(_checkTime_sloc0_1_0 + 2),b
	mov	(_checkTime_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r2,_TL0
	mov	r3,#0x00
	mov	dpl,r2
	mov	dph,r3
	lcall	___sint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	mov	dpl,_checkTime_sloc0_1_0
	mov	dph,(_checkTime_sloc0_1_0 + 1)
	mov	b,(_checkTime_sloc0_1_0 + 2)
	mov	a,(_checkTime_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	mov	dptr,#0xC33E
	mov	b,#0x2E
	mov	a,#0x39
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x20
	push	acc
	mov	a,#0x41
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r0
	mov	a,r1
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	mov	a,r2
	jnz	L016037?
	ljmp	L016018?
L016037?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:370: while (Volts_at_Pin(QFP32_MUX_P1_6) < thresholdVolt) {	// wait for signal to be 1
L016014?:
	mov	dpl,#0x0C
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r2,b
	mov	r3,a
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	mov	a,#0x4C
	push	acc
	mov	a,#0x3D
	push	acc
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	mov	a,r3
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	mov	a,r2
	jz	L016018?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:371: printf("Volt at ADC: %f\n\r", Volts_at_Pin(QFP32_MUX_P1_6));
	mov	dpl,#0x0C
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:372: if(TF0==1) { // Did the 16-bit timer overflow			{
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:373: TF0=0;
	jbc	_TF0,L016039?
	ljmp	L016014?
L016039?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:374: overflow_count++;
	inc	_checkTime_overflow_count_1_73
	clr	a
	cjne	a,_checkTime_overflow_count_1_73,L016040?
	inc	(_checkTime_overflow_count_1_73 + 1)
L016040?:
	ljmp	L016014?
L016018?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:385: TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	clr	_TR0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:386: printf("Stop Timer\n\r");
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,#__str_9
	push	acc
	mov	a,#(__str_9 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:387: time=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___uchar2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xF4FC
	mov	b,#0x32
	mov	a,#0x34
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:388: return time*1000; //return period of high pulse in seconds		
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'voltsAtPeak'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:395: float voltsAtPeak(void) {
;	-----------------------------------------
;	 function voltsAtPeak
;	-----------------------------------------
_voltsAtPeak:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:396: while(ADC_at_Pin(QFP32_MUX_P1_6)==0); //input pin waiting to be  
L017001?:
	mov	dpl,#0x0C
	lcall	_ADC_at_Pin
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jz	L017001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:397: while(ADC_at_Pin(QFP32_MUX_P1_6)==0); //this waiting for the pin to be high/ 1 
L017004?:
	mov	dpl,#0x0C
	lcall	_ADC_at_Pin
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jz	L017004?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:398: Timer3us((PERIOD*1.0E6)/4.0); //PERIOD IS DEFINED
	mov	dptr,#0x0000
	lcall	_Timer3us
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:399: return(Volts_at_Pin(QFP32_MUX_P1_6));
	mov	dpl,#0x0C
	ljmp	_Volts_at_Pin
;------------------------------------------------------------
;Allocation info for local variables in function 'waitquarterperiod'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:412: void waitquarterperiod(void){
;	-----------------------------------------
;	 function waitquarterperiod
;	-----------------------------------------
_waitquarterperiod:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:413: waitms(constant_delay_time);
	mov	dptr,#0x000A
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'detectobstacle'
;------------------------------------------------------------
;threshold                 Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:417: void detectobstacle(float threshold){
;	-----------------------------------------
;	 function detectobstacle
;	-----------------------------------------
_detectobstacle:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:428: if(threshold <= 0.6 ){
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	mov	a,#0x19
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L019002?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:430: printf("Turn right \r\n");
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:431: PWMRight();
	lcall	_PWMRight
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:432: waitms(500); //Make waits longer
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:433: waitms(500); 
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:434: waitms(300); 
	mov	dptr,#0x012C
	lcall	_waitms
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:436: PWMStop();
	lcall	_PWMStop
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:437: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:438: waitms(250);
	mov	dptr,#0x00FA
	ljmp	_waitms
L019002?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:443: printf("Go Straight \r\n");
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:445: PWMforward();
	ljmp	_PWMforward
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;checkcommand              Allocated to registers 
;i                         Allocated to registers 
;sig1                      Allocated to registers 
;sig2                      Allocated to registers 
;peak                      Allocated to registers 
;voltspeak                 Allocated to registers 
;periodpwm                 Allocated to registers 
;time                      Allocated to registers 
;pasttime                  Allocated to registers 
;period                    Allocated to registers r2 r3 r4 r5 
;overflow_count            Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:453: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:466: TL0=0; 
	mov	_TL0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:467: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:468: TF0=0;
	clr	_TF0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:469: TIMER0_Init();
	lcall	_TIMER0_Init
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:471: InitPinADC(1, 6); // Configure P2.5 as analog input
	mov	_InitPinADC_PARM_2,#0x06
	mov	dpl,#0x01
	lcall	_InitPinADC
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:473: InitADC();
	lcall	_InitADC
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:474: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_12
	push	acc
	mov	a,#(__str_12 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:476: "Check pins P2.2 and P2.1 with the oscilloscope.\r\n");
	mov	a,#__str_13
	push	acc
	mov	a,#(__str_13 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:478: printf("\n\r");
	mov	a,#__str_14
	push	acc
	mov	a,#(__str_14 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:481: while (1)
L020013?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:512: TL0=0; 
	mov	_TL0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:513: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:514: TF0=0;
	clr	_TF0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:516: while(P2_1!=0); // Wait for the signal to be zero
L020001?:
	jb	_P2_1,L020001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:517: while(P2_1!=1); // Wait for the signal to be one
L020004?:
	jnb	_P2_1,L020004?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:518: TR0=1; // Start the timer
	setb	_TR0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:519: while(P2_1!=0) // Wait for the signal to be zero
	mov	r2,#0x00
	mov	r3,#0x00
L020009?:
	jnb	_P2_1,L020011?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:521: if(TF0==1) // Did the 16-bit timer overflow?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:523: TF0=0;
	jbc	_TF0,L020028?
	sjmp	L020009?
L020028?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:524: overflow_count++;
	inc	r2
	cjne	r2,#0x00,L020009?
	inc	r3
	sjmp	L020009?
L020011?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:535: TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	clr	_TR0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:536: period=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
	mov	dpl,r2
	mov	dph,r3
	lcall	___sint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___uchar2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xF4FC
	mov	b,#0x32
	mov	a,#0x34
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:538: printf( "\rT=%f ms   \n ", period*1000.0);
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_15
	push	acc
	mov	a,#(__str_15 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:539: waitms(50);
	mov	dptr,#0x0032
	lcall	_waitms
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:540: detectobstacle(period*1000.0);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	_detectobstacle
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\robotwithsonar3\Sam_Test.c:549: waitms(50);	
	mov	dptr,#0x0032
	lcall	_waitms
	ljmp	L020013?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'Forward'
	db 0x0A
	db 0x0D
	db 0x00
__str_1:
	db 'Backward'
	db 0x0A
	db 0x0D
	db 0x00
__str_2:
	db 'Left'
	db 0x0A
	db 0x0D
	db 0x00
__str_3:
	db 'Right'
	db 0x0A
	db 0x0D
	db 0x00
__str_4:
	db 'Stop'
	db 0x0A
	db 0x0D
	db 0x00
__str_5:
	db 'Waiting for the signal to be 1'
	db 0x0A
	db 0x0D
	db 0x00
__str_6:
	db 'Volt at ADC: %f'
	db 0x0A
	db 0x0D
	db 0x00
__str_7:
	db 'Signal is 0'
	db 0x0A
	db 0x0D
	db 0x00
__str_8:
	db 'Start Timer'
	db 0x0A
	db 0x0D
	db 0x00
__str_9:
	db 'Stop Timer'
	db 0x0A
	db 0x0D
	db 0x00
__str_10:
	db 'Turn right '
	db 0x0D
	db 0x0A
	db 0x00
__str_11:
	db 'Go Straight '
	db 0x0D
	db 0x0A
	db 0x00
__str_12:
	db 0x1B
	db '[2J'
	db 0x00
__str_13:
	db 'Square wave generator for the EFM8LB1.'
	db 0x0D
	db 0x0A
	db 'Check pins P2.2 and '
	db 'P2.1 with the oscilloscope.'
	db 0x0D
	db 0x0A
	db 0x00
__str_14:
	db 0x0A
	db 0x0D
	db 0x00
__str_15:
	db 0x0D
	db 'T=%f ms   '
	db 0x0A
	db ' '
	db 0x00

	CSEG

end
