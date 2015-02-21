/*	IO DEFINITIONS FOR ST72521 */
#ifndef IOST72521_H 
	#define  IOST72521_H

/*	PORTS section */
volatile char PADR      @0x00;	/* Port A Data Register */
volatile char PADDR     @0x01;	/* Port A Data Direction */
volatile char PAOR      @0x02;	/* Port A Option register */
volatile char PBDR      @0x03;	/* Port B Data Register */
volatile char PBDDR     @0x04;	/* Port B Data Direction */
volatile char PBOR      @0x05;	/* Port B Option Register */
volatile char PCDR      @0x06;	/* Port C Data Register */
volatile char PCDDR     @0x07;	/* Port C Data Direction */
volatile char PCOR      @0x08;	/* Port C Option Register */
volatile char PDDR      @0x09;	/* Port D Data Register */
volatile char PDDDR     @0x0a;	/* Port D Data Direction */
volatile char PDOR      @0x0b;	/* Port D Option Register */
volatile char PEDR      @0x0c;	/* Port E Data Register */
volatile char PEDDR     @0x0d;	/* Port E Data Direction */
volatile char PEOR      @0x0e;	/* Port E Option Register */
volatile char PFDR      @0x0f;	/* Port F Data Register */
volatile char PFDDR     @0x10;	/* Port F Data Direction */
volatile char PFOR      @0x11;	/* Port F Option Register */
volatile char PGDR      @0x12;	/* Port G Data Register */
volatile char PGDDR     @0x13;	/* Port G Data Direction */
volatile char PGOR      @0x14;	/* Port G Option Register */
volatile char PHDR      @0x15;	/* Port H Data Register */
volatile char PHDDR     @0x16;	/* Port H Data Direction */
volatile char PHOR      @0x17;	/* Port H Option Register */

/*	I2C section */
volatile char I2CCR     @0x18;	/* I2C Control Register */
volatile char I2CSR1    @0x19;	/* I2C Status Register 1 */
volatile char I2CSR2    @0x1A;	/* I2C Status Register 2 */
volatile char I2CCCR    @0x1b;	/* I2C Clock Control Register */
volatile char I2COAR1   @0x1c;	/* I2C Own Address Register 1 */
volatile char I2COAR2   @0x1d;	/* I2C Own Address Register 2 */
volatile char I2CDR     @0x1e;	/* I2C Data Register */

/*	SPI section */
volatile char SPIDR     @0x21;	/* SPI Data Register */
volatile char SPICR     @0x22;	/* SPI Control Register */
volatile char SPISR     @0x23;	/* SPI Status Register */
volatile char SPICSR	@0x23;	/* SPI Status Register			*/ 

/*	ITC section */
volatile char ISPR0     @0x24;	/* Interrupt Software Priority Reg 0 */
volatile char ISPR1     @0x25;	/* Interrupt Software Priority Reg 1 */
volatile char ISPR2     @0x26;	/* Interrupt Software Priority Reg 2 */
volatile char ISPR3     @0x27;	/* Interrupt Software Priority Reg 3 */
volatile char EICR      @0x28;	/* External Interrupt Control Reg */

/*	System section */
volatile char FSCR      @0x29;	/* Flash Control/Status Register */
volatile char WDGCR     @0x2a;	/* Watchdog Control Register */     
volatile char SICSR     @0x2b;	/* System Integrity Control/Status */ 


/*	MCC section */
volatile char MCCSR     @0x2c;	/* Main Clock Controller Register */ 
volatile char MCCBCR    @0x2d;	/* Beep Control Register */ 

/*	TIMER A section */
volatile char TACR2     @0x31;	/* Control Register 2 */
volatile char TACR1     @0x32;	/* Control Register 1 */
volatile char TASR      @0x33;	/* Status Register */
volatile int  TAIC1R    @0x34;	/* Input Capture 1 Register */
volatile char TAIC1HR   @0x34;	/* Input Capture 1 High */
volatile char TAIC1LR   @0x35;	/* Input Capture 1 Low */
volatile int  TAOC1R    @0x36;	/* Output Compare 1 Register */
volatile char TAOC1HR   @0x36;	/* Output Compare 1 High */
volatile char TAOC1LR   @0x37;	/* Output Compare 1 Low */
volatile int  TACR      @0x38;	/* Counter Register */
volatile char TACHR     @0x38;	/* Counter High */
volatile char TACLR     @0x39;	/* Counter Low */
volatile int  TAACR     @0x3a;	/* Alternate Counter Register */
volatile char TAACHR    @0x3a;	/* Alternate Counter High */
volatile char TAACLR    @0x3b;	/* Alternate Counter Low */
volatile int  TAIC2R    @0x3c;	/* Input Capture 2 Register */
volatile char TAIC2HR   @0x3c;	/* Input Capture 2 High */
volatile char TAIC2LR   @0x3d;	/* Input Capture 2 Low */
volatile int  TAOC2R    @0x3e;	/* Output Compare 2 Register */
volatile char TAOC2HR   @0x3e;	/* Output Compare 2 High */
volatile char TAOC2LR   @0x3f;	/* Output Compare 2 Low */

/*	TIMER B section */
volatile char TBCR2     @0x41;	/* Control Register 2 */
volatile char TBCR1     @0x42;	/* Control Register 1 */
volatile char TBSR      @0x43;	/* Status Register */
volatile int  TBIC1R    @0x44;	/* Input Capture 1 Register */
volatile char TBIC1HR   @0x44;	/* Input Capture 1 High */
volatile char TBIC1LR   @0x45;	/* Input Capture 1 Low */
volatile int  TBOC1R    @0x46;	/* Output Compare 1 Register */
volatile char TBOC1HR   @0x46;	/* Output Compare 1 High */
volatile char TBOC1LR   @0x47;	/* Output Compare 1 Low */
volatile int  TBCR      @0x48;	/* Counter Register */
volatile char TBCHR     @0x48;	/* Counter High */
volatile char TBCLR     @0x49;	/* Counter Low */
volatile int  TBACR     @0x4a;	/* Alternate Counter Register */
volatile char TBACHR    @0x4a;	/* Alternate Counter High */
volatile char TBACLR    @0x4b;	/* Alternate Counter Low */
volatile int  TBIC2R    @0x4c;	/* Input Capture 2 Register */
volatile char TBIC2HR   @0x4c;	/* Input Capture 2 High */
volatile char TBIC2LR   @0x4d;	/* Input Capture 2 Low */
volatile int  TBOC2R    @0x4e;	/* Output Compare 2 Register */
volatile char TBOC2HR   @0x4e;	/* Output Compare 2 High */
volatile char TBOC2LR   @0x4f;	/* Output Compare 2 Low */

/*	SCI section */
volatile char SCISR     @0x50;	/* SCI Status Register */
volatile char SCIDR     @0x51;	/* SCI Data Register */
volatile char SCIBRR    @0x52;	/* SCI Baud Rate Register */
volatile char SCICR1    @0x53;	/* SCI Control Register 1 */
volatile char SCICR2    @0x54;	/* SCI Control Register 2 */
volatile char SCIERPR   @0x55;	/* SCI Receive Prescaler */
volatile char SCIETPR   @0x57;	/* SCI Transmit Prescaler */  

/*	CAN section */
volatile char CANISR    @0x5a;	/* CAN Interrupt Status Register */
volatile char CANICR    @0x5b;	/* CAN Interrupt Control Register */
volatile char CANICSR   @0x5c;	/* CAN Control/Status Register */
volatile char CANIBRPR  @0x5d;	/* CAN Baud Rate Prescaler Register */
volatile char CANIBTR   @0x5e;	/* CAN Bit timing Register */
volatile char CANIPSR   @0x5f;	/* CAN Page Selection Register */

/*	ADC section */
volatile char ADCCSR    @0x70;	/* ADC Data Register */
volatile char ADCDRH    @0x71;	/* ADC Control/Status Register High */  
volatile char ADCDRL    @0x72;	/* ADC Control/Status Register Low */

/*	PWM section */
volatile char PWMDCR3   @0x73;	/* PWM Duty Cycle Register 3 */
volatile char PWMDCR2   @0x74;	/* PWM Duty Cycle Register 2 */
volatile char PWMDCR1   @0x75;	/* PWM Duty Cycle Register 1 */
volatile char PWMDCR0   @0x76;	/* PWM Duty Cycle Register 0 */
volatile char PWMCR     @0x77;	/* PWM Control Register */
volatile char ARTCSR    @0x78;	/* ART Control/Status Register */
volatile char ARTCAR    @0x79;	/* ART Counter Access Register */
volatile char ARTARR    @0x7a;	/* ART Auto Reload Register */
volatile char ARTICCSR  @0x7b;	/* ART Input Capture Control/Status */
volatile char ARTICR1   @0x7c;	/* ART Input Capture Register 1 */
volatile char ARTICR2   @0x7d;	/* ART Input Capture Register 2 */


#endif
