;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Wed Apr 04 10:27:10 2018
;--------------------------------------------------------
$name idkwhatsgoingon___WithBluetooth
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
	public _arrayEqual_PARM_3
	public _arrayEqual_PARM_2
	public _InitPinADC_PARM_2
	public _main
	public _bluetoothMaze
	public _forward1
	public _checkLeft
	public _checkRight
	public _puts1
	public _getchar1
	public _putchar1
	public _laserPattern
	public _detectobstacle
	public _checkMode
	public _recieveData
	public _waitquarterperiod
	public _getDigitalSignal
	public _voltsAtPeak
	public _checkCommands
	public _arrayEqual
	public _periodcalc
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
	public _UART1_Init
	public __c51_external_startup
	public _bluetoothMaze_PARM_2
	public _x
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
_x:
	ds 2
_bluetoothMaze_PARM_2:
	ds 2
_bluetoothMaze_xcoord_1_119:
	ds 2
_bluetoothMaze_x_1_120:
	ds 2
_bluetoothMaze_y_1_120:
	ds 2
_bluetoothMaze_threshold_1_120:
	ds 4
_main_pir_voltage_1_135:
	ds 4
_main_xcoord_1_135:
	ds 1
_main_ycoord_1_135:
	ds 1
_main_temp_1_135:
	ds 4
_main_getCoord_1_135:
	ds 2
_main_sloc0_1_0:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
_InitPinADC_PARM_2:
	ds 1
	rseg	R_OSEG
_arrayEqual_PARM_2:
	ds 2
_arrayEqual_PARM_3:
	ds 3
_arrayEqual_arr1_1_80:
	ds 3
	rseg	R_OSEG
	rseg	R_OSEG
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:62: volatile unsigned char pwm_count = 0; // used in the timer 2 ISR
	mov	_pwm_count,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:63: volatile unsigned char pwm_count1 = 0; // this will be usec in the timer 3 ISR
	mov	_pwm_count1,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:64: volatile unsigned char pwm_count2 = 0; // this will be used in the timer 4 ISR
	mov	_pwm_count2,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:65: volatile unsigned char pwm_count3 = 0; //
	mov	_pwm_count3,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:80: volatile int flag = 0;
	clr	a
	mov	_flag,a
	mov	(_flag + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:81: volatile int claw_flag = 0;
	clr	a
	mov	_claw_flag,a
	mov	(_claw_flag + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:82: int stop[]={0,0,0,0};
	mov	_stop,#0x00
	mov	(_stop + 1),#0x00
	mov	(_stop + 0x0002),#0x00
	mov	((_stop + 0x0002) + 1),#0x00
	mov	(_stop + 0x0004),#0x00
	mov	((_stop + 0x0004) + 1),#0x00
	mov	(_stop + 0x0006),#0x00
	mov	((_stop + 0x0006) + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:83: int forward[]={1,1,1,1};
	mov	_forward,#0x01
	mov	(_forward + 1),#0x00
	mov	(_forward + 0x0002),#0x01
	mov	((_forward + 0x0002) + 1),#0x00
	mov	(_forward + 0x0004),#0x01
	mov	((_forward + 0x0004) + 1),#0x00
	mov	(_forward + 0x0006),#0x01
	mov	((_forward + 0x0006) + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:84: int backward[]={1,0,1,1};
	mov	_backward,#0x01
	mov	(_backward + 1),#0x00
	mov	(_backward + 0x0002),#0x00
	mov	((_backward + 0x0002) + 1),#0x00
	mov	(_backward + 0x0004),#0x01
	mov	((_backward + 0x0004) + 1),#0x00
	mov	(_backward + 0x0006),#0x01
	mov	((_backward + 0x0006) + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:85: int left[]={1,0,0,1};
	mov	_left,#0x01
	mov	(_left + 1),#0x00
	mov	(_left + 0x0002),#0x00
	mov	((_left + 0x0002) + 1),#0x00
	mov	(_left + 0x0004),#0x00
	mov	((_left + 0x0004) + 1),#0x00
	mov	(_left + 0x0006),#0x01
	mov	((_left + 0x0006) + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:86: int right[]={1,0,0,0};
	mov	_right,#0x01
	mov	(_right + 1),#0x00
	mov	(_right + 0x0002),#0x00
	mov	((_right + 0x0002) + 1),#0x00
	mov	(_right + 0x0004),#0x00
	mov	((_right + 0x0004) + 1),#0x00
	mov	(_right + 0x0006),#0x00
	mov	((_right + 0x0006) + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:88: int command[4] = {0,0,0,0};
	mov	_command,#0x00
	mov	(_command + 1),#0x00
	mov	(_command + 0x0002),#0x00
	mov	((_command + 0x0002) + 1),#0x00
	mov	(_command + 0x0004),#0x00
	mov	((_command + 0x0004) + 1),#0x00
	mov	(_command + 0x0006),#0x00
	mov	((_command + 0x0006) + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:90: volatile unsigned int x = 2;
	mov	_x,#0x02
	clr	a
	mov	(_x + 1),a
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:92: char _c51_external_startup(void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:95: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:96: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:97: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:99: VDM0CN = 0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:100: RSTSRC = 0x02 | 0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:107: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:108: PFE0CN = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:109: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:130: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:131: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:132: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:133: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:134: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:135: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:140: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:141: XBR0 = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)
	mov	_XBR0,#0x01
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:142: XBR1 = 0X00;
	mov	_XBR1,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:143: XBR2 = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:149: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:150: TH1 = 0x100 - ((SYSCLK / BAUDRATE) / (2L * 12L));
	mov	_TH1,#0xE6
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:151: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:152: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:153: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:154: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:155: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:158: TMR2CN0 = 0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:159: CKCON0 |= 0b_0001_0000; // Timer 2 uses the system clock
	orl	_CKCON0,#0x10
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:160: TMR2RL = (0x10000L - (SYSCLK / 10000L)); // Initialize reload value
	mov	_TMR2RL,#0xE0
	mov	(_TMR2RL >> 8),#0xE3
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:161: TMR2 = 0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:162: ET2 = 1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:163: TR2 = 1;         // Start Timer2 (TMR2CN is bit addressable)
	setb	_TR2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:181: EA = 1; // Enable interrupts
	setb	_EA
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:184: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART1_Init'
;------------------------------------------------------------
;baudrate                  Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:187: void UART1_Init (unsigned long baudrate)
;	-----------------------------------------
;	 function UART1_Init
;	-----------------------------------------
_UART1_Init:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:189: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:190: SMOD1 = 0x0C; // no parity, 8 data bits, 1 stop bit
	mov	_SMOD1,#0x0C
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:191: SCON1 = 0x10;
	mov	_SCON1,#0x10
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:192: SBCON1 =0x00;   // disable baud rate generator
	mov	_SBCON1,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:193: SBRL1 = 0x10000L-((SYSCLK/baudrate)/(12L*2L));
	mov	__divulong_PARM_2,r2
	mov	(__divulong_PARM_2 + 1),r3
	mov	(__divulong_PARM_2 + 2),r4
	mov	(__divulong_PARM_2 + 3),r5
	mov	dptr,#0xA200
	mov	b,#0x4A
	mov	a,#0x04
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	__divulong_PARM_2,#0x18
	clr	a
	mov	(__divulong_PARM_2 + 1),a
	mov	(__divulong_PARM_2 + 2),a
	mov	(__divulong_PARM_2 + 3),a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	clr	c
	subb	a,r2
	mov	r2,a
	clr	a
	subb	a,r3
	mov	r3,a
	mov	a,#0x01
	subb	a,r4
	clr	a
	subb	a,r5
	mov	_SBRL1,r2
	mov	(_SBRL1 >> 8),r3
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:194: TI1 = 1; // indicate ready for TX
	setb	_TI1
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:195: SBCON1 |= 0x40;   // enable baud rate generator
	orl	_SBCON1,#0x40
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:196: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 r3 
;i                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:200: void Timer3us(unsigned int us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:205: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:207: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:208: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:210: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:211: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r4,#0x00
	mov	r5,#0x00
L004004?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L004007?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:213: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L004001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L004001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:214: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:211: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r4
	cjne	r4,#0x00,L004004?
	inc	r5
	sjmp	L004004?
L004007?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:216: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:218: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:222: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L005005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L005009?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:223: for (k=0; k<4; k++) Timer3us(250);
	mov	r6,#0x00
L005001?:
	cjne	r6,#0x04,L005018?
L005018?:
	jnc	L005007?
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
	sjmp	L005001?
L005007?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:222: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L005005?
	inc	r5
	sjmp	L005005?
L005009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:227: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_ADC0MX,dpl
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:230: ADBUSY = 1;       // Dummy conversion first to select new pin
	setb	_ADBUSY
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:231: while (ADBUSY); // Wait for dummy conversion to finish
L006001?:
	jb	_ADBUSY,L006001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:232: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:233: while (ADBUSY); // Wait for conversion to complete
L006004?:
	jb	_ADBUSY,L006004?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:234: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:238: void Timer2_ISR(void) interrupt 5
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	push	acc
	push	ar2
	push	ar3
	push	psw
	mov	psw,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:240: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:242: pwm_count++;
	inc	_pwm_count
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:243: if (pwm_count>100)
	mov	a,_pwm_count
	add	a,#0xff - 0x64
	jnc	L007002?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:244: pwm_count = 0;
	mov	_pwm_count,#0x00
L007002?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:247: motorR1 = pwm_count>pwmSig1 ? 0 : 1;
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:248: motorR2 = pwm_count>pwmSig2 ? 0 : 1;
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:250: motorL1 = pwm_count>pwmSig3 ? 0 : 1;
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:251: motorL2 = pwm_count>pwmSig4 ? 0 : 1;
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:253: OUT0=pwm_count>80?0:1;
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:283: void InitADC(void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:285: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:286: ADC0CN1 = 0b_10_000_000; //14-bit,  Right justified no shifting applied, perform and Accumulate 1 conversion.
	mov	_ADC0CN1,#0x80
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:287: ADC0CF0 = 0b_11111_0_00; // SYSCLK/32
	mov	_ADC0CF0,#0xF8
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:288: ADC0CF1 = 0b_0_0_011110; // Same as default for now
	mov	_ADC0CF1,#0x1E
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:289: ADC0CN0 = 0b_0_0_0_0_0_00_0; // Same as default for now
	mov	_ADC0CN0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:290: ADC0CF2 = 0b_0_01_11111; // GND pin, Vref=VDD
	mov	_ADC0CF2,#0x3F
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:291: ADC0CN2 = 0b_0_000_0000;  // Same as default for now. ADC0 conversion initiated on write of 1 to ADBUSY.
	mov	_ADC0CN2,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:292: ADEN = 1; // Enable ADC
	setb	_ADEN
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIMER0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:294: void TIMER0_Init(void)
;	-----------------------------------------
;	 function TIMER0_Init
;	-----------------------------------------
_TIMER0_Init:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:296: TMOD &= 0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	anl	_TMOD,#0xF0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:297: TMOD |= 0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	orl	_TMOD,#0x01
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:298: TR0 = 0; // Stop Timer/Counter 0
	clr	_TR0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:303: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:305: return ((ADC_at_Pin(pin)*VDD) / 0b_0011_1111_1111_1111);
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:307: void InitPinADC(unsigned char portno, unsigned char pinno)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:311: mask = 1 << pinno;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L011013?
L011011?:
	add	a,acc
L011013?:
	djnz	b,L011011?
	mov	r3,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:313: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:314: switch (portno)
	cjne	r2,#0x00,L011014?
	sjmp	L011001?
L011014?:
	cjne	r2,#0x01,L011015?
	sjmp	L011002?
L011015?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:316: case 0:
	cjne	r2,#0x02,L011005?
	sjmp	L011003?
L011001?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:317: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P0MDIN,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:318: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:319: break;
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:320: case 1:
	sjmp	L011005?
L011002?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:321: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P1MDIN,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:322: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:323: break;
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:324: case 2:
	sjmp	L011005?
L011003?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:325: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P2MDIN,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:326: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:330: }
L011005?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:331: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PWMforward'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:340: void PWMforward(void) {
;	-----------------------------------------
;	 function PWMforward
;	-----------------------------------------
_PWMforward:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:341: pwmSig1 = 99;
	mov	_pwmSig1,#0x63
	clr	a
	mov	(_pwmSig1 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:342: pwmSig2 = 0;
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:344: pwmSig3 = 0;
	clr	a
	mov	_pwmSig2,a
	mov	(_pwmSig2 + 1),a
	mov	_pwmSig3,a
	mov	(_pwmSig3 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:345: pwmSig4 =99;
	mov	_pwmSig4,#0x63
	clr	a
	mov	(_pwmSig4 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:347: LEDRED = 1;
	setb	_P0_7
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:348: LEDGREEN = 1;
	setb	_P0_6
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:349: LEDWHITE = 1;
	setb	_P1_0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:350: SPEAKER = 0;
	clr	_P2_5
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:351: printf("Forward\n\r");
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:354: void PWMbackward(void) {
;	-----------------------------------------
;	 function PWMbackward
;	-----------------------------------------
_PWMbackward:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:355: pwmSig1 = 0;
	clr	a
	mov	_pwmSig1,a
	mov	(_pwmSig1 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:356: pwmSig2 = 99;
	mov	_pwmSig2,#0x63
	clr	a
	mov	(_pwmSig2 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:358: pwmSig3 = 99;
	mov	_pwmSig3,#0x63
	clr	a
	mov	(_pwmSig3 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:359: pwmSig4 = 0;
	clr	a
	mov	_pwmSig4,a
	mov	(_pwmSig4 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:361: LEDRED = 1;
	setb	_P0_7
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:362: LEDGREEN = 1;
	setb	_P0_6
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:363: LEDWHITE = 0;
	clr	_P1_0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:364: SPEAKER = 1;
	setb	_P2_5
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:365: printf("Backward\n\r");
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:368: void PWMLeft(void) {
;	-----------------------------------------
;	 function PWMLeft
;	-----------------------------------------
_PWMLeft:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:369: pwmSig1 = 0;
	clr	a
	mov	_pwmSig1,a
	mov	(_pwmSig1 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:370: pwmSig2 = 99;
	mov	_pwmSig2,#0x63
	clr	a
	mov	(_pwmSig2 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:372: pwmSig3 = 0;
	clr	a
	mov	_pwmSig3,a
	mov	(_pwmSig3 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:373: pwmSig4 = 99;
	mov	_pwmSig4,#0x63
	clr	a
	mov	(_pwmSig4 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:375: LEDRED = 1;
	setb	_P0_7
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:376: LEDGREEN = 0;
	clr	_P0_6
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:377: LEDWHITE = 1;
	setb	_P1_0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:378: SPEAKER = 0;
	clr	_P2_5
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:380: printf("Left\n\r");
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:383: void PWMRight(void) {
;	-----------------------------------------
;	 function PWMRight
;	-----------------------------------------
_PWMRight:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:384: pwmSig1 = 99;
	mov	_pwmSig1,#0x63
	clr	a
	mov	(_pwmSig1 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:385: pwmSig2 = 0;
	clr	a
	mov	_pwmSig2,a
	mov	(_pwmSig2 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:387: pwmSig3 = 99;
	mov	_pwmSig3,#0x63
	clr	a
	mov	(_pwmSig3 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:388: pwmSig4 = 0;
	clr	a
	mov	_pwmSig4,a
	mov	(_pwmSig4 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:390: LEDRED = 1;
	setb	_P0_7
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:391: LEDGREEN = 0;
	clr	_P0_6
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:392: LEDWHITE = 1;
	setb	_P1_0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:393: SPEAKER = 0;	
	clr	_P2_5
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:395: printf("Right\n\r");
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:398: void PWMStop(void) {
;	-----------------------------------------
;	 function PWMStop
;	-----------------------------------------
_PWMStop:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:399: pwmSig1 = 0;
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:400: pwmSig2 = 0;
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:402: pwmSig3 = 0;
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:403: pwmSig4 = 0;
	clr	a
	mov	_pwmSig1,a
	mov	(_pwmSig1 + 1),a
	mov	_pwmSig2,a
	mov	(_pwmSig2 + 1),a
	mov	_pwmSig3,a
	mov	(_pwmSig3 + 1),a
	mov	_pwmSig4,a
	mov	(_pwmSig4 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:405: LEDRED = 0;
	clr	_P0_7
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:406: LEDGREEN = 1;
	setb	_P0_6
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:407: LEDWHITE = 1;
	setb	_P1_0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:408: SPEAKER = 0;
	clr	_P2_5
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:410: printf("Stop\n\r");
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
;Allocation info for local variables in function 'periodcalc'
;------------------------------------------------------------
;period1                   Allocated to registers r2 r3 r4 r5 
;overflow_count            Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:413: float periodcalc(void) {
;	-----------------------------------------
;	 function periodcalc
;	-----------------------------------------
_periodcalc:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:417: TL0=0; 
	mov	_TL0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:418: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:419: TF0=0;
	clr	_TF0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:421: TR0=0;
	clr	_TR0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:423: while(P1_6!=0); // Wait for the signal to be zero
L017001?:
	jb	_P1_6,L017001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:424: while(P1_6!=1); // Wait for the signal to be one
L017004?:
	jnb	_P1_6,L017004?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:425: TR0=1; // Start the timer
	setb	_TR0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:426: while(P1_6!=0) // Wait for the signal to be zero
	mov	r2,#0x00
	mov	r3,#0x00
L017009?:
	jnb	_P1_6,L017026?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:428: if(TF0==1) // Did the 16-bit timer overflow?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:430: TF0=0;
	jbc	_TF0,L017033?
	sjmp	L017009?
L017033?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:431: overflow_count++;
	inc	r2
	cjne	r2,#0x00,L017009?
	inc	r3
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:435: while(P1_6!=1) // Wait for the signal to be zero
	sjmp	L017009?
L017026?:
L017014?:
	jb	_P1_6,L017016?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:437: if(TF0==1) // Did the 16-bit timer overflow?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:439: TF0=0;
	jbc	_TF0,L017035?
	sjmp	L017014?
L017035?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:440: overflow_count++;
	inc	r2
	cjne	r2,#0x00,L017014?
	inc	r3
	sjmp	L017014?
L017016?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:445: TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	clr	_TR0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:446: period1=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:447: printf("%f\n\r", period1);
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:448: return period1*1000; //return period of high pulse in seconds
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
;Allocation info for local variables in function 'arrayEqual'
;------------------------------------------------------------
;size                      Allocated with name '_arrayEqual_PARM_2'
;arr2                      Allocated with name '_arrayEqual_PARM_3'
;arr1                      Allocated with name '_arrayEqual_arr1_1_80'
;i                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:453: int arrayEqual (int arr1[], int size, int arr2[]){
;	-----------------------------------------
;	 function arrayEqual
;	-----------------------------------------
_arrayEqual:
	mov	_arrayEqual_arr1_1_80,dpl
	mov	(_arrayEqual_arr1_1_80 + 1),dph
	mov	(_arrayEqual_arr1_1_80 + 2),b
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:455: for(i=0; i<size; i++){
	mov	r5,#0x00
	mov	r6,#0x00
L018003?:
	clr	c
	mov	a,r5
	subb	a,_arrayEqual_PARM_2
	mov	a,r6
	xrl	a,#0x80
	mov	b,(_arrayEqual_PARM_2 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L018006?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:456: if(arr1[i]!=arr2[i])
	mov	ar7,r5
	mov	a,r6
	xch	a,r7
	add	a,acc
	xch	a,r7
	rlc	a
	mov	r0,a
	mov	a,r7
	add	a,_arrayEqual_arr1_1_80
	mov	r1,a
	mov	a,r0
	addc	a,(_arrayEqual_arr1_1_80 + 1)
	mov	r2,a
	mov	r3,(_arrayEqual_arr1_1_80 + 2)
	mov	dpl,r1
	mov	dph,r2
	mov	b,r3
	lcall	__gptrget
	mov	r1,a
	inc	dptr
	lcall	__gptrget
	mov	r2,a
	mov	a,r7
	add	a,_arrayEqual_PARM_3
	mov	r7,a
	mov	a,r0
	addc	a,(_arrayEqual_PARM_3 + 1)
	mov	r0,a
	mov	r3,(_arrayEqual_PARM_3 + 2)
	mov	dpl,r7
	mov	dph,r0
	mov	b,r3
	lcall	__gptrget
	mov	r7,a
	inc	dptr
	lcall	__gptrget
	mov	r0,a
	mov	a,r1
	cjne	a,ar7,L018013?
	mov	a,r2
	cjne	a,ar0,L018013?
	sjmp	L018005?
L018013?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:457: return 0; 
	mov	dptr,#0x0000
	ret
L018005?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:455: for(i=0; i<size; i++){
	inc	r5
	cjne	r5,#0x00,L018003?
	inc	r6
	sjmp	L018003?
L018006?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:459: return 1; 
	mov	dptr,#0x0001
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'checkCommands'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:465: void checkCommands (void){
;	-----------------------------------------
;	 function checkCommands
;	-----------------------------------------
_checkCommands:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:466: if(arrayEqual(command, 4, stop)) PWMStop();
	mov	_arrayEqual_PARM_3,#_stop
	mov	(_arrayEqual_PARM_3 + 1),#0x00
	mov	(_arrayEqual_PARM_3 + 2),#0x40
	mov	_arrayEqual_PARM_2,#0x04
	clr	a
	mov	(_arrayEqual_PARM_2 + 1),a
	mov	dptr,#_command
	mov	b,#0x40
	lcall	_arrayEqual
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jz	L019014?
	lcall	_PWMStop
	ljmp	L019015?
L019014?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:467: else if (arrayEqual(command,4,forward)) PWMforward(); 
	mov	_arrayEqual_PARM_3,#_forward
	mov	(_arrayEqual_PARM_3 + 1),#0x00
	mov	(_arrayEqual_PARM_3 + 2),#0x40
	mov	_arrayEqual_PARM_2,#0x04
	clr	a
	mov	(_arrayEqual_PARM_2 + 1),a
	mov	dptr,#_command
	mov	b,#0x40
	lcall	_arrayEqual
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jz	L019011?
	lcall	_PWMforward
	ljmp	L019015?
L019011?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:468: else if (arrayEqual(command,4,backward)) PWMbackward(); 
	mov	_arrayEqual_PARM_3,#_backward
	mov	(_arrayEqual_PARM_3 + 1),#0x00
	mov	(_arrayEqual_PARM_3 + 2),#0x40
	mov	_arrayEqual_PARM_2,#0x04
	clr	a
	mov	(_arrayEqual_PARM_2 + 1),a
	mov	dptr,#_command
	mov	b,#0x40
	lcall	_arrayEqual
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jz	L019008?
	lcall	_PWMbackward
	sjmp	L019015?
L019008?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:469: else if (arrayEqual(command,4, left)) PWMLeft(); 
	mov	_arrayEqual_PARM_3,#_left
	mov	(_arrayEqual_PARM_3 + 1),#0x00
	mov	(_arrayEqual_PARM_3 + 2),#0x40
	mov	_arrayEqual_PARM_2,#0x04
	clr	a
	mov	(_arrayEqual_PARM_2 + 1),a
	mov	dptr,#_command
	mov	b,#0x40
	lcall	_arrayEqual
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jz	L019005?
	lcall	_PWMLeft
	sjmp	L019015?
L019005?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:470: else if (arrayEqual(command,4, right)) PWMRight(); 
	mov	_arrayEqual_PARM_3,#_right
	mov	(_arrayEqual_PARM_3 + 1),#0x00
	mov	(_arrayEqual_PARM_3 + 2),#0x40
	mov	_arrayEqual_PARM_2,#0x04
	clr	a
	mov	(_arrayEqual_PARM_2 + 1),a
	mov	dptr,#_command
	mov	b,#0x40
	lcall	_arrayEqual
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jz	L019002?
	lcall	_PWMRight
	sjmp	L019015?
L019002?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:471: else PWMStop(); //defaults to a halt (redundant)
	lcall	_PWMStop
L019015?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:472: waitms(350);
	mov	dptr,#0x015E
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'voltsAtPeak'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:478: float voltsAtPeak(void) {
;	-----------------------------------------
;	 function voltsAtPeak
;	-----------------------------------------
_voltsAtPeak:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:480: while(ADC_at_Pin(QFP32_MUX_P1_6)==0); //this waiting for the pin to be high/ 1 
L020001?:
	mov	dpl,#0x0C
	lcall	_ADC_at_Pin
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jz	L020001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:481: Timer3us((PERIOD*1.0E6)/4.0); //PERIOD IS DEFINED
	mov	dptr,#0x0000
	lcall	_Timer3us
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:482: return(Volts_at_Pin(QFP32_MUX_P1_6));
	mov	dpl,#0x0C
	ljmp	_Volts_at_Pin
;------------------------------------------------------------
;Allocation info for local variables in function 'getDigitalSignal'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:495: int getDigitalSignal (void){
;	-----------------------------------------
;	 function getDigitalSignal
;	-----------------------------------------
_getDigitalSignal:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:497: if (Volts_at_Pin(QFP32_MUX_P2_3)>=thresholdVolt) //not too low to be a noise/ a valid signal for high, 1
	mov	dpl,#0x10
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
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
	jnz	L021002?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:499: printf("\nread 1:  at pin 2.3: %f\r", Volts_at_Pin(QFP32_MUX_P2_3));
	mov	dpl,#0x10
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:500: return 1;
	mov	dptr,#0x0001
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:504: return 0; 
	ret
L021002?:
	mov	dptr,#0x0000
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitquarterperiod'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:511: void waitquarterperiod(void){
;	-----------------------------------------
;	 function waitquarterperiod
;	-----------------------------------------
_waitquarterperiod:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:512: waitms(constant_delay_time);
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'recieveData'
;------------------------------------------------------------
;checkcomm                 Allocated to registers 
;i                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:518: void recieveData (){
;	-----------------------------------------
;	 function recieveData
;	-----------------------------------------
_recieveData:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:522: while(getDigitalSignal()==0); 	//wait for the signal to be 1 
L023001?:
	lcall	_getDigitalSignal
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jz	L023001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:526: waitms(175);	//wait 
	mov	dptr,#0x00AF
	lcall	_waitms
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:527: command[0] = 1;
	mov	_command,#0x01
	mov	(_command + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:529: for( i=1; i<4; i++){
	mov	r2,#0x01
	mov	r3,#0x00
L023004?:
	clr	c
	mov	a,r2
	subb	a,#0x04
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L023007?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:530: waitms(358); //wait for a period
	mov	dptr,#0x0166
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:531: command[i]=getDigitalSignal();	
	mov	ar4,r2
	mov	a,r3
	xch	a,r4
	add	a,acc
	xch	a,r4
	rlc	a
	mov	a,r4
	add	a,#_command
	mov	r0,a
	push	ar2
	push	ar3
	push	ar0
	lcall	_getDigitalSignal
	mov	a,dpl
	mov	b,dph
	pop	ar0
	pop	ar3
	pop	ar2
	mov	@r0,a
	inc	r0
	mov	@r0,b
	dec	r0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:529: for( i=1; i<4; i++){
	inc	r2
	cjne	r2,#0x00,L023004?
	inc	r3
	sjmp	L023004?
L023007?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:534: checkCommands();				//does activity depending on the command given 
	ljmp	_checkCommands
;------------------------------------------------------------
;Allocation info for local variables in function 'checkMode'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:543: int checkMode(){
;	-----------------------------------------
;	 function checkMode
;	-----------------------------------------
_checkMode:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:544: if(!BUTTON1 || x == 0){
	jnb	_P3_1,L024001?
	mov	a,_x
	orl	a,(_x + 1)
	jnz	L024033?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:545: while(!BUTTON1);
L024001?:
	jnb	_P3_1,L024001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:546: x= 0;
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:547: return 0;
	clr	a
	mov	_x,a
	mov	(_x + 1),a
	mov	dpl,a
	mov	dph,a
	ret
L024033?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:549: else if(!BUTTON2 || x == 1){
	jnb	_P3_3,L024004?
	mov	a,#0x01
	cjne	a,_x,L024057?
	clr	a
	cjne	a,(_x + 1),L024057?
	sjmp	L024058?
L024057?:
	sjmp	L024029?
L024058?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:550: while(!BUTTON2);
L024004?:
	jnb	_P3_3,L024004?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:551: x = 1;
	mov	_x,#0x01
	clr	a
	mov	(_x + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:552: return 1;
	mov	dptr,#0x0001
	ret
L024029?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:554: else if(!BUTTON3 || x == 3){
	jnb	_P3_7,L024007?
	mov	a,#0x03
	cjne	a,_x,L024061?
	clr	a
	cjne	a,(_x + 1),L024061?
	sjmp	L024062?
L024061?:
	sjmp	L024025?
L024062?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:555: while(!BUTTON3);
L024007?:
	jnb	_P3_7,L024007?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:556: x = 3;
	mov	_x,#0x03
	clr	a
	mov	(_x + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:557: return 3;
	mov	dptr,#0x0003
	ret
L024025?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:559: else if(!BUTTON4 || x == 4){
	jnb	_P0_5,L024010?
	mov	a,#0x04
	cjne	a,_x,L024065?
	clr	a
	cjne	a,(_x + 1),L024065?
	sjmp	L024066?
L024065?:
	sjmp	L024021?
L024066?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:560: while(!BUTTON4);
L024010?:
	jnb	_P0_5,L024010?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:561: x = 4;
	mov	_x,#0x04
	clr	a
	mov	(_x + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:562: return 4;
	mov	dptr,#0x0004
	ret
L024021?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:564: else if(!BUTTON5 || x == 5){
	jnb	_P0_3,L024013?
	mov	a,#0x05
	cjne	a,_x,L024069?
	clr	a
	cjne	a,(_x + 1),L024069?
	sjmp	L024070?
L024069?:
	sjmp	L024017?
L024070?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:565: while(!BUTTON5);
L024013?:
	jnb	_P0_3,L024013?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:566: x = 5;
	mov	_x,#0x05
	clr	a
	mov	(_x + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:567: return 5;
	mov	dptr,#0x0005
	ret
L024017?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:570: x = 2;
	mov	_x,#0x02
	clr	a
	mov	(_x + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:571: return 2;
	mov	dptr,#0x0002
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'detectobstacle'
;------------------------------------------------------------
;threshold                 Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:576: void detectobstacle(float threshold){
;	-----------------------------------------
;	 function detectobstacle
;	-----------------------------------------
_detectobstacle:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:587: if(threshold <= 0.6 ){
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
	jnz	L025002?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:589: printf("Turn right \r\n");
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:590: PWMRight();
	lcall	_PWMRight
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:591: waitms(500); //Make waits longer
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:592: waitms(500); 
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:593: waitms(300); 
	mov	dptr,#0x012C
	lcall	_waitms
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:595: PWMStop();
	lcall	_PWMStop
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:596: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:597: waitms(250);
	mov	dptr,#0x00FA
	ljmp	_waitms
L025002?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:602: printf("Go Straight \r\n");
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:604: PWMforward();
	ljmp	_PWMforward
;------------------------------------------------------------
;Allocation info for local variables in function 'laserPattern'
;------------------------------------------------------------
;rate                      Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:611: void laserPattern(float rate){
;	-----------------------------------------
;	 function laserPattern
;	-----------------------------------------
_laserPattern:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:612: LASER = 0;
	clr	_P3_0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:613: if(rate<0.8)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	mov	a,#0x4C
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jz	L026010?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:614: waitms(200);
	mov	dptr,#0x00C8
	lcall	_waitms
	ljmp	L026011?
L026010?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:615: else if(rate>=0.8 && rate<2.0)
	mov	a,r6
	jnz	L026006?
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jz	L026006?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:616: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
	sjmp	L026011?
L026006?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:617: else if(rate>=2.0 && rate<2.8)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jnz	L026002?
	mov	a,#0x33
	push	acc
	push	acc
	push	acc
	mov	a,#0x40
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
	jz	L026002?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:618: waitms(800);
	mov	dptr,#0x0320
	lcall	_waitms
	sjmp	L026011?
L026002?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:620: waitms(1000);
	mov	dptr,#0x03E8
	lcall	_waitms
L026011?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:621: LASER = 1;
	setb	_P3_0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putchar1'
;------------------------------------------------------------
;c                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:625: void putchar1 (char c) 
;	-----------------------------------------
;	 function putchar1
;	-----------------------------------------
_putchar1:
	mov	r2,dpl
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:627: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:628: if (c == '\n') 
	cjne	r2,#0x0A,L027006?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:630: while (!TI1);
L027001?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:631: TI1=0;
	jbc	_TI1,L027017?
	sjmp	L027001?
L027017?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:632: SBUF1 = '\r';
	mov	_SBUF1,#0x0D
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:634: while (!TI1);
L027006?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:635: TI1=0;
	jbc	_TI1,L027018?
	sjmp	L027006?
L027018?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:636: SBUF1 = c;
	mov	_SBUF1,r2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:637: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar1'
;------------------------------------------------------------
;c                         Allocated to registers 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:640: char getchar1 (void)
;	-----------------------------------------
;	 function getchar1
;	-----------------------------------------
_getchar1:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:643: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:644: while (!RI1);
L028001?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:645: RI1=0;
	jbc	_RI1,L028008?
	sjmp	L028001?
L028008?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:647: SCON1&=0b_0011_1111;
	anl	_SCON1,#0x3F
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:648: c = SBUF1;
	mov	dpl,_SBUF1
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:649: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:650: return (c);
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'puts1'
;------------------------------------------------------------
;buff                      Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:653: void puts1(char * buff)
;	-----------------------------------------
;	 function puts1
;	-----------------------------------------
_puts1:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:656: for(j=0; buff[j]!=0; j++) 
	mov	r5,#0x00
	mov	r6,#0x00
L029001?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	r7,a
	jz	L029005?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:657: putchar1(buff[j]);
	mov	dpl,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_putchar1
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:656: for(j=0; buff[j]!=0; j++) 
	inc	r5
	cjne	r5,#0x00,L029001?
	inc	r6
	sjmp	L029001?
L029005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'checkRight'
;------------------------------------------------------------
;threshold                 Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:661: int checkRight(float threshold){
;	-----------------------------------------
;	 function checkRight
;	-----------------------------------------
_checkRight:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:662: PWMRight();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_PWMRight
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:663: if(threshold <= 0.6)
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
	jnz	L030002?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:664: return 0;
	mov	dptr,#0x0000
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:666: return 1;
	ret
L030002?:
	mov	dptr,#0x0001
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'checkLeft'
;------------------------------------------------------------
;threshold                 Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:669: int checkLeft(float threshold){
;	-----------------------------------------
;	 function checkLeft
;	-----------------------------------------
_checkLeft:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:670: PWMLeft();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_PWMLeft
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:671: if(threshold <= 0.6)
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
	jnz	L031002?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:672: return 0;
	mov	dptr,#0x0000
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:674: return 1;
	ret
L031002?:
	mov	dptr,#0x0001
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'forward1'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:677: void forward1(){
;	-----------------------------------------
;	 function forward1
;	-----------------------------------------
_forward1:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:678: PWMforward();
	lcall	_PWMforward
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:679: waitms(1100);
	mov	dptr,#0x044C
	lcall	_waitms
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:680: PWMStop();
	ljmp	_PWMStop
;------------------------------------------------------------
;Allocation info for local variables in function 'bluetoothMaze'
;------------------------------------------------------------
;ycoord                    Allocated with name '_bluetoothMaze_PARM_2'
;xcoord                    Allocated with name '_bluetoothMaze_xcoord_1_119'
;x                         Allocated with name '_bluetoothMaze_x_1_120'
;y                         Allocated with name '_bluetoothMaze_y_1_120'
;threshold                 Allocated with name '_bluetoothMaze_threshold_1_120'
;period                    Allocated to registers r2 r3 r4 r5 
;overflow_count            Allocated to registers r0 r1 
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:683: void bluetoothMaze(int xcoord, int ycoord){
;	-----------------------------------------
;	 function bluetoothMaze
;	-----------------------------------------
_bluetoothMaze:
	mov	_bluetoothMaze_xcoord_1_119,dpl
	mov	(_bluetoothMaze_xcoord_1_119 + 1),dph
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:684: int x = 0;
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:685: int y = 0;
	clr	a
	mov	_bluetoothMaze_x_1_120,a
	mov	(_bluetoothMaze_x_1_120 + 1),a
	mov	_bluetoothMaze_y_1_120,a
	mov	(_bluetoothMaze_y_1_120 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:690: while(x<=5 && x>=0 && y<=5 && y>=0){
L033041?:
	clr	c
	mov	a,#0x05
	subb	a,_bluetoothMaze_x_1_120
	clr	a
	xrl	a,#0x80
	mov	b,(_bluetoothMaze_x_1_120 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L033073?
	ret
L033073?:
	mov	a,(_bluetoothMaze_x_1_120 + 1)
	jnb	acc.7,L033074?
	ret
L033074?:
	clr	c
	mov	a,#0x05
	subb	a,_bluetoothMaze_y_1_120
	clr	a
	xrl	a,#0x80
	mov	b,(_bluetoothMaze_y_1_120 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L033075?
	ret
L033075?:
	mov	a,(_bluetoothMaze_y_1_120 + 1)
	jnb	acc.7,L033076?
	ret
L033076?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:692: TL0=0; 
	mov	_TL0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:693: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:694: TF0=0;
	clr	_TF0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:696: while(P2_1!=0); // Wait for the signal to be zero
L033001?:
	jb	_P2_1,L033001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:697: while(P2_1!=1); // Wait for the signal to be one
L033004?:
	jnb	_P2_1,L033004?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:698: TR0=1; // Start the timer
	setb	_TR0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:699: while(P2_1!=0) // Wait for the signal to be zero
	mov	r0,#0x00
	mov	r1,#0x00
L033009?:
	jnb	_P2_1,L033011?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:701: if(TF0==1) // Did the 16-bit timer overflow?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:703: TF0=0;
	jbc	_TF0,L033080?
	sjmp	L033009?
L033080?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:704: overflow_count++;
	inc	r0
	cjne	r0,#0x00,L033009?
	inc	r1
	sjmp	L033009?
L033011?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:715: TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	clr	_TR0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:716: period=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
	mov	dpl,r0
	mov	dph,r1
	lcall	___sint2fs
	mov	r0,dpl
	mov	r1,dph
	mov	r2,b
	mov	r3,a
	push	ar0
	push	ar1
	push	ar2
	push	ar3
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	lcall	___uchar2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
	pop	ar0
	pop	ar3
	pop	ar2
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r0
	mov	a,r1
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:717: threshold = period*1000;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	_bluetoothMaze_threshold_1_120,dpl
	mov	(_bluetoothMaze_threshold_1_120 + 1),dph
	mov	(_bluetoothMaze_threshold_1_120 + 2),b
	mov	(_bluetoothMaze_threshold_1_120 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:720: while(y != ycoord){
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	mov	a,#0x19
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_bluetoothMaze_threshold_1_120
	mov	dph,(_bluetoothMaze_threshold_1_120 + 1)
	mov	b,(_bluetoothMaze_threshold_1_120 + 2)
	mov	a,(_bluetoothMaze_threshold_1_120 + 3)
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r7,_bluetoothMaze_y_1_120
	mov	r0,(_bluetoothMaze_y_1_120 + 1)
L033020?:
	mov	a,r7
	cjne	a,_bluetoothMaze_PARM_2,L033081?
	mov	a,r0
	cjne	a,(_bluetoothMaze_PARM_2 + 1),L033081?
	ljmp	L033071?
L033081?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:721: if(threshold <= 0.6){
	mov	a,r6
	jnz	L033018?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:722: if(checkRight(threshold) == 1){
	mov	dpl,_bluetoothMaze_threshold_1_120
	mov	dph,(_bluetoothMaze_threshold_1_120 + 1)
	mov	b,(_bluetoothMaze_threshold_1_120 + 2)
	mov	a,(_bluetoothMaze_threshold_1_120 + 3)
	push	ar6
	push	ar7
	push	ar0
	lcall	_checkRight
	mov	r1,dpl
	mov	r2,dph
	pop	ar0
	pop	ar7
	pop	ar6
	cjne	r1,#0x01,L033015?
	cjne	r2,#0x00,L033015?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:723: forward1();
	push	ar6
	push	ar7
	push	ar0
	lcall	_forward1
	pop	ar0
	pop	ar7
	pop	ar6
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:724: x++;
	inc	_bluetoothMaze_x_1_120
	clr	a
	cjne	a,_bluetoothMaze_x_1_120,L033020?
	inc	(_bluetoothMaze_x_1_120 + 1)
	sjmp	L033020?
L033015?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:726: else if (checkLeft(threshold) == 1){
	mov	dpl,_bluetoothMaze_threshold_1_120
	mov	dph,(_bluetoothMaze_threshold_1_120 + 1)
	mov	b,(_bluetoothMaze_threshold_1_120 + 2)
	mov	a,(_bluetoothMaze_threshold_1_120 + 3)
	push	ar6
	push	ar7
	push	ar0
	lcall	_checkLeft
	mov	r2,dpl
	mov	r3,dph
	pop	ar0
	pop	ar7
	pop	ar6
	cjne	r2,#0x01,L033020?
	cjne	r3,#0x00,L033020?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:727: forward1();
	push	ar6
	push	ar7
	push	ar0
	lcall	_forward1
	pop	ar0
	pop	ar7
	pop	ar6
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:728: x--;
	dec	_bluetoothMaze_x_1_120
	mov	a,#0xff
	cjne	a,_bluetoothMaze_x_1_120,L033088?
	dec	(_bluetoothMaze_x_1_120 + 1)
L033088?:
	ljmp	L033020?
L033018?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:732: forward1();
	push	ar6
	push	ar7
	push	ar0
	lcall	_forward1
	pop	ar0
	pop	ar7
	pop	ar6
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:733: y++;
	inc	r7
	cjne	r7,#0x00,L033089?
	inc	r0
L033089?:
	mov	_bluetoothMaze_y_1_120,r7
	mov	(_bluetoothMaze_y_1_120 + 1),r0
	ljmp	L033020?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:736: while(x != xcoord){
L033071?:
	mov	_bluetoothMaze_y_1_120,r7
	mov	(_bluetoothMaze_y_1_120 + 1),r0
	mov	r2,_bluetoothMaze_x_1_120
	mov	r3,(_bluetoothMaze_x_1_120 + 1)
L033031?:
	mov	a,r2
	cjne	a,_bluetoothMaze_xcoord_1_119,L033090?
	mov	a,r3
	cjne	a,(_bluetoothMaze_xcoord_1_119 + 1),L033090?
	mov	a,#0x01
	sjmp	L033091?
L033090?:
	clr	a
L033091?:
	mov	r4,a
	jz	L033092?
	ljmp	L033072?
L033092?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:737: if(threshold <= 0.6){ //threshold<=0.6
	mov	a,r6
	jz	L033093?
	ljmp	L033029?
L033093?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:738: if(checkLeft(threshold) == 1){
	mov	dpl,_bluetoothMaze_threshold_1_120
	mov	dph,(_bluetoothMaze_threshold_1_120 + 1)
	mov	b,(_bluetoothMaze_threshold_1_120 + 2)
	mov	a,(_bluetoothMaze_threshold_1_120 + 3)
	push	ar2
	push	ar3
	push	ar6
	lcall	_checkLeft
	mov	r5,dpl
	mov	r7,dph
	pop	ar6
	pop	ar3
	pop	ar2
	cjne	r5,#0x01,L033026?
	cjne	r7,#0x00,L033026?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:739: forward1();
	push	ar2
	push	ar3
	push	ar6
	lcall	_forward1
	pop	ar6
	pop	ar3
	pop	ar2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:740: y--;
	dec	_bluetoothMaze_y_1_120
	mov	a,#0xff
	cjne	a,_bluetoothMaze_y_1_120,L033096?
	dec	(_bluetoothMaze_y_1_120 + 1)
L033096?:
	sjmp	L033031?
L033026?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:742: else if (checkLeft(threshold) == 1){
	mov	dpl,_bluetoothMaze_threshold_1_120
	mov	dph,(_bluetoothMaze_threshold_1_120 + 1)
	mov	b,(_bluetoothMaze_threshold_1_120 + 2)
	mov	a,(_bluetoothMaze_threshold_1_120 + 3)
	push	ar2
	push	ar3
	push	ar6
	lcall	_checkLeft
	mov	r5,dpl
	mov	r7,dph
	pop	ar6
	pop	ar3
	pop	ar2
	cjne	r5,#0x01,L033097?
	cjne	r7,#0x00,L033097?
	sjmp	L033098?
L033097?:
	ljmp	L033031?
L033098?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:743: forward1();
	push	ar2
	push	ar3
	push	ar6
	lcall	_forward1
	pop	ar6
	pop	ar3
	pop	ar2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:744: y++;
	inc	_bluetoothMaze_y_1_120
	clr	a
	cjne	a,_bluetoothMaze_y_1_120,L033099?
	inc	(_bluetoothMaze_y_1_120 + 1)
L033099?:
	ljmp	L033031?
L033029?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:748: forward1();
	push	ar2
	push	ar3
	push	ar6
	lcall	_forward1
	pop	ar6
	pop	ar3
	pop	ar2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:749: x++;
	inc	r2
	cjne	r2,#0x00,L033100?
	inc	r3
L033100?:
	mov	_bluetoothMaze_x_1_120,r2
	mov	(_bluetoothMaze_x_1_120 + 1),r3
	ljmp	L033031?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:752: while(y == ycoord && x == xcoord);
L033072?:
	mov	_bluetoothMaze_x_1_120,r2
	mov	(_bluetoothMaze_x_1_120 + 1),r3
	mov	a,_bluetoothMaze_PARM_2
	cjne	a,_bluetoothMaze_y_1_120,L033101?
	mov	a,(_bluetoothMaze_PARM_2 + 1)
	cjne	a,(_bluetoothMaze_y_1_120 + 1),L033101?
	mov	a,#0x01
	sjmp	L033102?
L033101?:
	clr	a
L033102?:
	mov	r2,a
L033035?:
	mov	a,r2
	jnz	L033103?
	ljmp	L033041?
L033103?:
	mov	a,r4
	jnz	L033104?
	ljmp	L033041?
L033104?:
	sjmp	L033035?
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;checkcommand              Allocated to registers 
;i                         Allocated to registers r2 r3 
;sig1                      Allocated to registers 
;sig2                      Allocated to registers 
;peak                      Allocated to registers 
;voltspeak                 Allocated to registers 
;periodpwm                 Allocated to registers 
;period                    Allocated to registers r2 r3 r4 r5 
;overflow_count            Allocated to registers r3 r2 
;pir_voltage               Allocated with name '_main_pir_voltage_1_135'
;xcoord                    Allocated with name '_main_xcoord_1_135'
;ycoord                    Allocated with name '_main_ycoord_1_135'
;temp                      Allocated with name '_main_temp_1_135'
;count                     Allocated to registers r2 r3 
;getCoord                  Allocated with name '_main_getCoord_1_135'
;mode_toggle               Allocated to registers r6 r7 
;sloc0                     Allocated with name '_main_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:762: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:775: char xcoord = 'a';
	mov	_main_xcoord_1_135,#0x61
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:776: char ycoord = 'a';
	mov	_main_ycoord_1_135,#0x61
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:779: int getCoord = 0; //0 = no coord send; 1 = coord sent
	clr	a
	mov	_main_getCoord_1_135,a
	mov	(_main_getCoord_1_135 + 1),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:783: UART1_Init(9600);
	mov	dptr,#0x2580
	clr	a
	mov	b,a
	lcall	_UART1_Init
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:785: TL0=0;
	mov	_TL0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:786: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:787: TF0=0;	
	clr	_TF0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:788: TIMER0_Init();
	lcall	_TIMER0_Init
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:790: InitPinADC(1, 6); // Configure P2.5 as analog input
	mov	_InitPinADC_PARM_2,#0x06
	mov	dpl,#0x01
	lcall	_InitPinADC
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:791: InitPinADC(2, 3); //???	
	mov	_InitPinADC_PARM_2,#0x03
	mov	dpl,#0x02
	lcall	_InitPinADC
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:792: InitPinADC(2, 4); //PIR
	mov	_InitPinADC_PARM_2,#0x04
	mov	dpl,#0x02
	lcall	_InitPinADC
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:793: InitPinADC(2, 6); //Temp Sensor
	mov	_InitPinADC_PARM_2,#0x06
	mov	dpl,#0x02
	lcall	_InitPinADC
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:794: InitADC();
	lcall	_InitADC
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:796: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:798: "Check pins P2.2 and P2.1 with the oscilloscope.\r\n");
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:800: printf("\n\r");
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:802: PWMStop();
	lcall	_PWMStop
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:804: while (1)
L034059?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:806: mode_toggle = checkMode();
	lcall	_checkMode
	mov	r6,dpl
	mov	r7,dph
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:809: if(mode_toggle == 0){
	mov	a,r6
	orl	a,r7
	jz	L034099?
	ljmp	L034056?
L034099?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:810: printf("auto \r\n");
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:812: TL0=0; 
	mov	_TL0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:813: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:814: TF0=0;
	clr	_TF0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:816: while(P2_1!=0); // Wait for the signal to be zero
L034001?:
	jb	_P2_1,L034001?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:817: while(P2_1!=1); // Wait for the signal to be one
L034004?:
	jnb	_P2_1,L034004?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:818: TR0=1; // Start the timer
	setb	_TR0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:819: while(P2_1!=0) // Wait for the signal to be zero
	mov	r3,#0x00
	mov	r2,#0x00
L034009?:
	jnb	_P2_1,L034011?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:821: if(TF0==1) // Did the 16-bit timer overflow?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:823: TF0=0;
	jbc	_TF0,L034103?
	sjmp	L034009?
L034103?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:824: overflow_count++;
	inc	r3
	cjne	r3,#0x00,L034009?
	inc	r2
	sjmp	L034009?
L034011?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:835: TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	clr	_TR0
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:836: period=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
	mov	dpl,r3
	mov	dph,r2
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
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	lcall	___uchar2fs
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
	mov	a,#0x43
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
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
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
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:838: printf( "\rT=%f ms   \n ", period*1000.0);
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
	mov	a,#__str_13
	push	acc
	mov	a,#(__str_13 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:839: waitms(50);
	mov	dptr,#0x0032
	lcall	_waitms
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:840: detectobstacle(period*1000.0);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_detectobstacle
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:841: laserPattern(period*1000);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	_laserPattern
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:850: waitms(50);	
	mov	dptr,#0x0032
	lcall	_waitms
	ljmp	L034059?
L034056?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:854: else if(mode_toggle == 1){
	cjne	r6,#0x01,L034104?
	cjne	r7,#0x00,L034104?
	sjmp	L034105?
L034104?:
	ljmp	L034053?
L034105?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:855: recieveData();	//keep reading data continously 
	lcall	_recieveData
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:856: printf("Command: ");
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:857: for(i=0; i<4; i++)
	mov	r2,#0x00
	mov	r3,#0x00
L034061?:
	clr	c
	mov	a,r2
	subb	a,#0x04
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L034064?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:858: printf("%d\t", command[i]);
	mov	ar4,r2
	mov	a,r3
	xch	a,r4
	add	a,acc
	xch	a,r4
	rlc	a
	mov	a,r4
	add	a,#_command
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	dec	r0
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
	add	a,#0xfb
	mov	sp,a
	pop	ar3
	pop	ar2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:857: for(i=0; i<4; i++)
	inc	r2
	cjne	r2,#0x00,L034061?
	inc	r3
	sjmp	L034061?
L034064?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:859: printf("\n\r");
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
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:860: command[0] = 0;
	mov	_command,#0x00
	mov	(_command + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:861: command[1] = 0;
	mov	(_command + 0x0002),#0x00
	mov	((_command + 0x0002) + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:862: command[2] = 0;
	mov	(_command + 0x0004),#0x00
	mov	((_command + 0x0004) + 1),#0x00
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:863: command[3] = 0;
	mov	(_command + 0x0006),#0x00
	mov	((_command + 0x0006) + 1),#0x00
	ljmp	L034059?
L034053?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:867: else if( mode_toggle == 3){  //PIR
	cjne	r6,#0x03,L034108?
	cjne	r7,#0x00,L034108?
	sjmp	L034109?
L034108?:
	ljmp	L034050?
L034109?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:868: pir_voltage = Volts_at_Pin(QFP32_MUX_P2_4);
	mov	dpl,#0x11
	lcall	_Volts_at_Pin
	mov	_main_pir_voltage_1_135,dpl
	mov	(_main_pir_voltage_1_135 + 1),dph
	mov	(_main_pir_voltage_1_135 + 2),b
	mov	(_main_pir_voltage_1_135 + 3),a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:869: if(pir_voltage >= 3.0 && pir_voltage <= 3.4)
	clr	a
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	push	acc
	mov	dpl,_main_pir_voltage_1_135
	mov	dph,(_main_pir_voltage_1_135 + 1)
	mov	b,(_main_pir_voltage_1_135 + 2)
	mov	a,(_main_pir_voltage_1_135 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L034013?
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	mov	a,#0x59
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,_main_pir_voltage_1_135
	mov	dph,(_main_pir_voltage_1_135 + 1)
	mov	b,(_main_pir_voltage_1_135 + 2)
	mov	a,(_main_pir_voltage_1_135 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L034013?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:870: PWMStop();
	lcall	_PWMStop
	sjmp	L034014?
L034013?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:872: PWMforward();
	lcall	_PWMforward
L034014?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:873: waitms(100);
	mov	dptr,#0x0064
	lcall	_waitms
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:874: printf("pir_voltage: %f \r\n", pir_voltage);
	push	_main_pir_voltage_1_135
	push	(_main_pir_voltage_1_135 + 1)
	push	(_main_pir_voltage_1_135 + 2)
	push	(_main_pir_voltage_1_135 + 3)
	mov	a,#__str_16
	push	acc
	mov	a,#(__str_16 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	ljmp	L034059?
L034050?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:877: else if( mode_toggle == 4){   //Maze
	cjne	r6,#0x04,L034112?
	cjne	r7,#0x00,L034112?
	sjmp	L034113?
L034112?:
	ljmp	L034047?
L034113?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:878: while(getCoord == 0)
L034022?:
	mov	a,_main_getCoord_1_135
	orl	a,(_main_getCoord_1_135 + 1)
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:881: while(count<4){
	jnz	L034024?
	mov	r2,a
	mov	r3,a
L034016?:
	clr	c
	mov	a,r2
	subb	a,#0x04
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L034018?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:882: temp[count] = getchar1();
	mov	a,r2
	add	a,#_main_temp_1_135
	mov	r0,a
	push	ar2
	push	ar3
	push	ar0
	lcall	_getchar1
	mov	a,dpl
	pop	ar0
	pop	ar3
	pop	ar2
	mov	@r0,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:883: count++;
	inc	r2
	cjne	r2,#0x00,L034016?
	inc	r3
	sjmp	L034016?
L034018?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:886: xcoord = temp[0];
	mov	_main_xcoord_1_135,_main_temp_1_135
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:887: ycoord = temp[1];
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:888: printf("XCOORD: %c , YCOORD: %c \n", xcoord, ycoord);
	mov	a,(_main_temp_1_135 + 0x0001)
	mov	_main_ycoord_1_135,a
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	r2,a
	mov	a,_main_xcoord_1_135
	mov	r4,a
	rlc	a
	subb	a,acc
	mov	r5,a
	push	ar3
	push	ar2
	push	ar4
	push	ar5
	mov	a,#__str_17
	push	acc
	mov	a,#(__str_17 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:890: if(temp[2] == 'g' && temp[3] == 'o')
	mov	a,#0x67
	cjne	a,(_main_temp_1_135 + 0x0002),L034022?
	mov	a,#0x6F
	cjne	a,(_main_temp_1_135 + 0x0003),L034022?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:891: getCoord = 1;
	mov	_main_getCoord_1_135,#0x01
	clr	a
	mov	(_main_getCoord_1_135 + 1),a
	sjmp	L034022?
L034024?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:893: bluetoothMaze(xcoord, ycoord);
	mov	a,_main_xcoord_1_135
	mov	r2,a
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	a,_main_ycoord_1_135
	mov	_bluetoothMaze_PARM_2,a
	rlc	a
	subb	a,acc
	mov	(_bluetoothMaze_PARM_2 + 1),a
	mov	dpl,r2
	mov	dph,r3
	lcall	_bluetoothMaze
	ljmp	L034059?
L034047?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:895: else if(mode_toggle == 5){   //Voice control
	cjne	r6,#0x05,L034044?
	cjne	r7,#0x00,L034044?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:896: while(getCoord == 0) //Just reuse this stuff
L034028?:
	mov	a,_main_getCoord_1_135
	orl	a,(_main_getCoord_1_135 + 1)
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:899: while(count<4){
	jnz	L034030?
	mov	r2,a
	mov	r3,a
L034025?:
	clr	c
	mov	a,r2
	subb	a,#0x04
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L034028?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:900: temp[count] = getchar1();
	mov	a,r2
	add	a,#_main_temp_1_135
	mov	r0,a
	push	ar2
	push	ar3
	push	ar0
	lcall	_getchar1
	mov	a,dpl
	pop	ar0
	pop	ar3
	pop	ar2
	mov	@r0,a
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:901: count++;
	inc	r2
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:903: count =0;
	cjne	r2,#0x00,L034025?
	inc	r3
	sjmp	L034025?
L034030?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:905: if(temp[0] == 'f')
	mov	r2,_main_temp_1_135
	cjne	r2,#0x66,L034041?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:906: PWMforward();
	lcall	_PWMforward
	ljmp	L034059?
L034041?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:907: else if(temp[0] == 'b')
	cjne	r2,#0x62,L034038?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:908: PWMbackward();
	lcall	_PWMbackward
	ljmp	L034059?
L034038?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:909: else if(temp[0] == 'r')
	cjne	r2,#0x72,L034035?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:910: PWMRight();
	lcall	_PWMRight
	ljmp	L034059?
L034035?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:911: else if(temp[0] == 'l')
	cjne	r2,#0x6C,L034032?
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:912: PWMLeft();
	lcall	_PWMLeft
	ljmp	L034059?
L034032?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:914: PWMStop();
	lcall	_PWMStop
	ljmp	L034059?
L034044?:
;	C:\Users\Dalto\Documents\GitHub\ElecRobot\idkwhatsgoingon - WithBluetooth.c:917: printf("Do nothing\r\n");	
	mov	a,#__str_18
	push	acc
	mov	a,#(__str_18 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ljmp	L034059?
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
	db '%f'
	db 0x0A
	db 0x0D
	db 0x00
__str_6:
	db 0x0A
	db 'read 1:  at pin 2.3: %f'
	db 0x0D
	db 0x00
__str_7:
	db 'Turn right '
	db 0x0D
	db 0x0A
	db 0x00
__str_8:
	db 'Go Straight '
	db 0x0D
	db 0x0A
	db 0x00
__str_9:
	db 0x1B
	db '[2J'
	db 0x00
__str_10:
	db 'Square wave generator for the EFM8LB1.'
	db 0x0D
	db 0x0A
	db 'Check pins P2.2 and '
	db 'P2.1 with the oscilloscope.'
	db 0x0D
	db 0x0A
	db 0x00
__str_11:
	db 0x0A
	db 0x0D
	db 0x00
__str_12:
	db 'auto '
	db 0x0D
	db 0x0A
	db 0x00
__str_13:
	db 0x0D
	db 'T=%f ms   '
	db 0x0A
	db ' '
	db 0x00
__str_14:
	db 'Command: '
	db 0x00
__str_15:
	db '%d'
	db 0x09
	db 0x00
__str_16:
	db 'pir_voltage: %f '
	db 0x0D
	db 0x0A
	db 0x00
__str_17:
	db 'XCOORD: %c , YCOORD: %c '
	db 0x0A
	db 0x00
__str_18:
	db 'Do nothing'
	db 0x0D
	db 0x0A
	db 0x00

	CSEG

end
