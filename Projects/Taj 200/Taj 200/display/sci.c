#include "sci.h"

/*
	_Pa_RS232_TDO, _Pin_RS232_TDO
	_Pa_RS232_RDI, _Pin_RS232_RDI
	SCISR     					SCI Status Register
	SCIDR     					SCI Data Register
								During an SCI transmission, data shifts out least
								significant bit first on the TDO pin.
	SCIBRR    					SCI Baud Rate Register
	SCICR1    					SCI Control Register 1
	SCICR2    					SCI Control Register 2
	SCIERPR   					SCI Receive Prescaler
	SCIETPR   					SCI Transmit Prescaler */

#define SCI_START_BIT 	0x00  	/* 	The TDO pin is in low state during the start bit. */
#define SCI_STOP_BIT  	0x01	/* 	The TDO pin is in high state during the stop bit. */
#define SCI_FRAME_IDLE	0xFF	/* 	An Idle character is interpreted as an entire frame
									of “1”s followed by the start bit of the next frame
									which contains data. */
#define SCI_FRAME_FRAME	0x00	/*	A Break character is interpreted on receiving “0”s
									for some multiple of the frame period. At the end of
									the last break frame the transmitter inserts an extra
								“1” bit to acknowledge the start bit. */


//SCISR BITS DEFINITIONS  
#define SCI_SR_TDRE    	7       /* Transmit data register empty */
#define SCI_SR_TC      	6       /* Transmission complete */
#define SCI_SR_RDRF    	5       /* Received data ready flag */
#define SCI_SR_IDLE    	4       /* Idle line detect */
#define SCI_SR_OR      	3       /* Overrun error */
#define SCI_SR_NF      	2       /* Noise flag */
#define SCI_SR_FE      	1       /* Framing error. */
#define SCI_SR_PE      	0       /* Parity error */


/******************************************************************************
BIT DEFINITIONS
******************************************************************************/
/**************************Status Register bits*******************************/
#define SCI_TDRE   0x80
#define SCI_TC     0x40
#define SCI_RDRF   0x20
#define SCI_IDLE   0x10
#define SCI_ORE    0x08
#define SCI_NE     0x04
#define SCI_FE     0x02
#define SCI_PE     0x01

/*********************Control Register bits**********************************/
#define SCI_TX_9TH   0x40
#define SCI_RX_9TH   0x80 

/*********************Boud Rate Register*************************************/
#define SCI_PR 0x3F
#define SCI_TR 0xC7
#define SCI_RR 0xF8

unsigned char Pr_Value[4] = { 1, 3, 4,13 }; /*Declaration of Global Variables*/

/*********************Boud Rate Register*************************************/
void SCI_Compute_Baudrate(WORD BaudRate_Tx, WORD BaudRate_Rx)
{
    BYTE  Presc_Value,TPR1, TPR2, RPR1, RPR2,i;
    WORD  Tx_Value, Rx_Value,temp1;
    WORD TR1, TR2, RR1, RR2,Presc_Fact,j,count; 
    LWORD temp; 
           
    TPR1 = 0;
    TPR2 = 0;
    RPR1 = 0;
    RPR2 = 0; 
    temp = 0; 
    
    temp = Fcpu/BaudRate_Tx;                       
    for (temp1 = 0,count = 1;temp1 < 1;count++)    
    {    
        Presc_Fact = ((WORD)(temp/16)) ;
        for (i = 0; i != 4; i++)
        {
            for (j = 1; j <= 128; j = j*2)
            {
                if ( ((Pr_Value[i]*j) == Presc_Fact) && (TPR1 == 0) )
                {
                    TPR1 = Pr_Value[i];     /*Prescalar value for Transmitter*/
                    TR1  = j;                      /*Transmitter rate divisor*/
                    temp1++;
                }
                else if ((Pr_Value[i]*j) == Presc_Fact)
                {
                    TPR2 = Pr_Value[i]; 
                                    /*Another Prescalar value for Transmitter*/
                    TR2 = j;               /*Another Transmitter rate divisor*/
                    temp1++;
                }
            }
        }   
        if(count%2 == 0)      /*Changes the temp value if no prescalar factor
                                                                     is found*/
        {         
            temp = temp + count;                           
        }
        else
        {         
            temp = temp - count;
        }    
    }               
    temp = Fcpu/BaudRate_Rx; 
    for (temp1 = 0,count = 1;temp1 < 1;count++)
    {   
        Presc_Fact = (WORD)(temp/16); 
        for (i = 0; i != 4; i++)
        {
            for (j = 1; j <= 128; j = j*2)
            {
                if (((Pr_Value[i]*j) == Presc_Fact) && (RPR1 == 0))
                {
                    RPR1 = Pr_Value[i];        /*Prescalar value for Receiver*/
                    RR1    = j;                       /*Receiver rate divisor*/
                    temp1++;
                }
                else if ((Pr_Value[i]*j) == Presc_Fact)
                {
                    RPR2 = Pr_Value[i];
                                       /*Another Prescalar value for Receiver*/
                    RR2    = j;                /*Another Receiver rate divisor*/
                    temp1++;
                }
            }
        }
        if(count%2 == 0)
                     /*Changes the temp value if no prescalar factor is found*/                                                        
        {     
            temp = temp + count;
        }
        else
        {     
            temp = temp - count;
        }
    } 
                /*Searches common Prescalar factor for transmitter & receiver*/
    if (TPR1 == RPR1)    
    {
        Presc_Value = TPR1;
        Tx_Value    = TR1;
        Rx_Value    = RR1;
    }
    else if ( TPR1 == RPR2)
    {
        Presc_Value = TPR1;
        Tx_Value    = TR1;
        Rx_Value    = RR2;
    }
    else if ( TPR2 == RPR1)
    {
        Presc_Value = TPR2;
        Tx_Value    = TR2;
        Rx_Value    = RR1;
    }
    else if ( TPR2 == RPR2)
    {
        Presc_Value = TPR2;
        Tx_Value    = TR2;
        Rx_Value    = RR2;
    }   
    else                    /*If no common prescalar division factor is found*/
    {
        for (temp1=0,count=1;temp1<1;count++)
        {
            for (j=1; j<=128; j= j*2)
            {
                if ( (TPR1*j) == Presc_Fact)
                {
                    Presc_Value = TPR1; 
                    Tx_Value = TR1; 
                    Rx_Value = j;
                    temp1++; 
                }
            }
            if(count%2 == 0)
            {     
                Presc_Fact = Presc_Fact+count;
            }
            else
            {     
                Presc_Fact = Presc_Fact-count;
            }
        }
    }    
    if (Presc_Value == 1)
    {
        Presc_Value = 0;
    }
    else if (Presc_Value == 3)
    {
        Presc_Value = 1;
    }
    else if (Presc_Value == 4)
    {
        Presc_Value = 2;
    }
    else 
    {
        Presc_Value = 3;
    }
    for (i=0,j=1; j<=128; j=j*2)
    {
        if ( j == Tx_Value )
        {
            Tx_Value = i;
        }
        i++;
    }
    for (i=0,j=1; j<=128; j=j*2)
    {
    if ( j == Rx_Value )
        {    
            Rx_Value = i;
        }
        i++;
    }  
    Presc_Value <<= 6 ;
    SCIBRR &= SCI_PR ;  
    SCIBRR |= Presc_Value ;                             /*Loads the prescalar*/

    Tx_Value <<= 3 ;                     /*Loads the transmitter rate divisor*/
    SCIBRR &= SCI_TR ;
    SCIBRR |= (BYTE)Tx_Value ;

    SCIBRR &= SCI_RR ;                      /*Loads the receiver rate divisor*/
    SCIBRR |= (BYTE)Rx_Value ;
}

/*****************************************************************************/
void SCI_Init(void)
{
	BYTE byTemp;
	
	byTemp = SCISR; //Touch registers to remove pending interrupt
	byTemp = SCIDR; //Touch registers to remove pending interrupt	
	
	//CONTROL REGISTER 1 (SCICR1)
		/* Bit 7 = R8 Receive data bit 8.
			This bit is used to store the 9th bit of the received word when M=1. */
		/* Bit 6 = T8 Transmit data bit 8. This bit is used to store the 9th bit. */
		/* Bit 5 = SCID Disabled for low power consumption
			0: SCI enabled
			1: SCI prescaler and outputs disabled */
			
		/* Bit 4 = M Word length.
			0: 1 Start bit, 8 Data bits, 1 Stop bit
			1: 1 Start bit, 9 Data bits, 1 Stop bit */
		/* Bit 3 = WAKE Wake-Up method.
			This bit determines the SCI Wake-Up method.
			0: Idle Line
			1: Address Mark*/
		/* Bit 2 = PCE Parity control enable.
			This bit selects the hardware parity control 
			(generation and detection). 
			0: Parity control disabled
			1: Parity control enabled */
		/* Bit 1 = PS Parity selection.
			0: Even parity
			1: Odd parity */
		/* Bit 0 = PIE Parity interrupt enable.
			This bit enables the interrupt capability of the hardware
			parity control when a parity error is detected
			0: Parity error interrupt disabled
			1: Parity error interrupt enabled. */
	SCICR1 = 0b00000000;
	
	//CONTROL REGISTER 2 (SCICR2)
		/* Bit 7 = TIE Transmitter interrupt enable.
			0: Interrupt is inhibited
			1: An SCI interrupt is generated whenever
			   TDRE=1 in the SCISR register */
		/* Bit 6 = TCIE Transmission complete interrupt enable
			0: Interrupt is inhibited
			1: An SCI interrupt is generated whenever TC=1 in
			   the SCISR register */
		/* Bit 5 = RIE Receiver interrupt enable.
			0: Interrupt is inhibited
			1: An SCI interrupt is generated whenever OR=1
			   or RDRF=1 in the SCISR register */
		/* Bit 4 = ILIE Idle line interrupt enable.
			0: Interrupt is inhibited
			1: An SCI interrupt is generated whenever IDLE=1
			   in the SCISR register. */
		/* Bit 3 = TE Transmitter enable.
			This bit enables the transmitter. 
			0: Transmitter is disabled
			1: Transmitter is enabled */
		/* Bit 2 = RE Receiver enable.
			This bit enables the receiver. 			
			0: Receiver is disabled
			1: Receiver is enabled and begins searching for 
			   a start bit */
		/* Bit 1 = RWU Receiver wake-up.
			This bit determines if the SCI is in mute mode or not. 
			0: Receiver in Active mode
			1: Receiver in Mute mode */
		/* Bit 0 = SBK Send break.
			This bit set is used to send break characters.
			0: No break character is transmitted
			1: Break characters are transmitted */
	SCICR2 = 0b00011100;

	// BAUD RATE REGISTER (SCIBRR)
		/* Bits 7:6= SCP[1:0] First SCI Prescaler */
		/* Bits 5:3 = SCT[2:0] SCI Transmitter rate divisor */
		/* Bits 2:0 = SCR[2:0] SCI Receiver rate divisor. */
	SCIBRR = 0b00010010; //PR=1 TR=RR=4 ETPR=ERPR=10 fcpu=3.1 --> 4800 bps
		
	// EXTENDED RECEIVE PRESCALER DIVISION REGISTER (SCIERPR)
		/* Bits 7:0 = ERPR[7:0] 8-bit Extended Receive Prescaler Register 
			The extended Baud Rate Generator is activated
			when a value different from 00h is stored in this register.*/
			
	SCIERPR = 0x0A;
			
	// EXTENDED TRANSMIT PRESCALER DIVISION REGISTER (SCIETPR)
		/* Bits 7:0 = ETPR[7:0] 8-bit Extended Transmit	Prescaler Register.
			The extended Baud Rate Generator is activated when a value different 
			from 00h is stored in this register. Therefore the clock frequency 
			issued from the 16 divider (see Figure 62) is divided by the binary 
			factor set in the SCIETPR register */
	SCIETPR = 0x0A;
	
	//SCI_Compute_Baudrate(9600, 9600);
	
/*	
	SCIBRR = 0b11001001;
	SCIERPR = 0x00;
	SCIETPR = 0x00;	
	

	SCIBRR = 0x00;
	SCIERPR = 52;
	SCIETPR = 52;	
*/
}

/*****************************************************************************/
void SCI_SendByte ( BYTE a_byData)
{
	BYTE byTemp;
	byTemp = SCISR; // Reset TDRE bit
	SCIDR = a_byData;
	
	while (!_btst(SCISR, SCI_SR_TDRE))
	{
		Nop();			
	}
}


/******************************************************************************/
void SCI_SendString (STRING a_strData)
{
	BYTE byTemp;
	byTemp = SCISR; // Reset TDRE bit

	while((*a_strData) != 0x00)
	{
		SCIDR = (BYTE) (*a_strData);
		a_strData++; //Next char
		while (!_btst(SCISR, SCI_SR_TDRE))
		{
			Nop();			
		}
	}	
}

/*****************************************************************************/
@interrupt
void SCI_DataReceived(void)
{
	BYTE byTemp;
	//byTemp = SCISR; // Reset TDRE bit
	//_bset(_Pa_Led_D4, _Pin_Led_D4);	
	
	//FIFO_PutByte(SCIDR);	
	//Echo effect
	//SCI_SendByte(SCI_ReceiveByte());
	
	
	byTemp = SCISR;
	
    if(byTemp & SCI_ORE)      	/*If Interrupt is generated due to overrun error*/
    {
        byTemp = SCIDR;    
		_bres(_Pa_Led_D4, _Pin_Led_D4);
    } 
    else if (byTemp & SCI_RDRF)	/*If Interrupt is generated due to received data flag*/
    {
		if(byTemp & SCI_NE) // Noise
		{
			byTemp = SCIDR;    
			_bset(_Pa_Led_D3, _Pin_Led_D3);
		}
		else if(byTemp & SCI_FE) // Framing Error
		{
			byTemp = SCIDR;    
			_bset(_Pa_Led_D1, _Pin_Led_D1);
		}
		else if(byTemp & SCI_PE) // Parity Error
		{
			byTemp = SCIDR;    
			_switch(_Pa_Led_D4, _Pin_Led_D4);
		}
		else
		{
			FIFO_PutByte(SCIDR);	
		}
	}	
	else
	{
		_switch(_Pa_Led_D1, _Pin_Led_D1);		
	}
}