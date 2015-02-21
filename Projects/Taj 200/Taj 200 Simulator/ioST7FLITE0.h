/*	IO DEFINITIONS FOR ST7FLITE0
 */

/*	PORTS section
 */
@tiny volatile	char PADR		@0x00;		/* Port A Data Register 	*/
@tiny volatile	char PADDR		@0x01;		/* Port A Data Direction 	*/
@tiny volatile	char PAOR		@0x02;		/* Port A Option register 	*/
@tiny volatile	char PBDR		@0x03;		/* Port B Data Register 	*/
@tiny volatile	char PBDDR		@0x04;		/* Port B Data Direction 	*/
@tiny volatile	char PBOR		@0x05;		/* Port B Option Register 	*/   

/*	LITE TIMER
 */
@tiny volatile	char LTCSR		@0x0B;		/* Lite Timer Control/Status Register */   
@tiny volatile	char LTICR		@0x0C;		/* Lite Timer Input Capture Register  */   

/*	Auto-Reload TIMER
 */
@tiny volatile	char ATCSR		@0x0D;		/* Timer Control/Status Register  	*/   
@tiny volatile 	int  CNTR       @0x0E;		/* Counter Register */
@tiny volatile	char CNTRH		@0x0E;		/* Counter Register High  		*/   
@tiny volatile	char CNTRL		@0x0F;		/* Counter Register low  		*/   
@tiny volatile 	int  ATR       	@0x10;		/* Auto Reload Register */
@tiny volatile	char ATRH		@0x10;		/* Auto-Reload Register High  		*/   
@tiny volatile	char ATRL		@0x11;		/* Auto-Reload Register low  		*/   
@tiny volatile	char PWMCR		@0x12;		/* PWM Output Control Register  	*/   
@tiny volatile	char PWM0CSR	@0x13;		/* PWM 0 Control/Status Register  	*/   

@tiny volatile  int  DCR0       @0x17;		/* PWM 0 Duty Cycle Register */
@tiny volatile	char DCR0H		@0x17;		/* PWM 0 Duty Cycle Register High  	*/   
@tiny volatile	char DCR0L		@0x18;		/* PWM 0 Duty Cycle Register Low  	*/   

/*	FLASH/EEPROM
 */
@tiny volatile	char FCSR		@0x2F;		/* Flash Control/Status Register  	*/   
@tiny volatile	char EECSR		@0x30;		/* Data EEPROM Control/Status Register	*/   
 
/*	SPI
 */
@tiny volatile	char SPIDR		@0x31;		/* SPI Data Register  			*/   
@tiny volatile	char SPICR		@0x32;		/* SPI Control Register			*/   
@tiny volatile	char SPISR		@0x33;		/* SPI Status Register			*/   

/*	ADC
 */
@tiny volatile	char ADCCSR		@0x34;		/* A/D Control Status Register  	*/   
@tiny volatile	char ADCDR		@0x35;		/* A/D Data Register			*/   
@tiny volatile	char ADCCAMP		@0x36;		/* A/D Amplifier Control Register	*/   
  
/* MISCELLANEOUS
 */
@tiny volatile	char EICR		@0x37;		/* External Interrupt Control Register 	*/   
@tiny volatile	char MCCSR		@0x38;		/* Main Clock Control/Status Register	*/   
@tiny volatile	char RCCR		@0x39;		/* RC Oscillator Control Register  	*/   
@tiny volatile	char SICSR		@0x3A;		/* System Integrity Control/Status Register*/   

