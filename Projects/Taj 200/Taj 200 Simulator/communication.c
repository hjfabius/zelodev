//#include "ST7lib_config.h"                               /*Configuration File*/ 
#include "common.h"                               /*Configuration File*/ 

/*****************************************************************************/
char sendIntNumber(unsigned int intNumber)
{
	char strMessage[3];
	char i = 0x00;
	char j = 0x00;
	unsigned int intTimeOut = 0x0000;
	char blnInput = 0x00;
	
	unsigned int arintTimeouts[8];


	strMessage[0] = 'I';
	strMessage[1] = intNumber%256;  intNumber/=256;
	strMessage[2] = intNumber;
	
	j=0x00;
	do
	{
		for(i=0; i<8;i++)
		{
			intTimeOut = 40000;
			do
			{
				blnInput = _btst(PBDR, 1)/2;
				intTimeOut--;
			}while((blnInput==(i%2)) && (intTimeOut>0));
			
			if(intTimeOut==0)
			{
				//return (unsigned int)0;
				return (char) 0;
			}
			
	
			if(_btst(strMessage[j], i))
			{
				_bres(PADR, 1);
			}
			else
			{
				_bset(PADR, 1);
			}
			arintTimeouts[i] = intTimeOut;
		}

		j++;
	}while	(j<3);
	
	return (char) 1;
	//return (unsigned int)1;
}


/*****************************************************************************/
/*void sendMessage(char * strMessage, char intMessageLength)
{
	//Out 1 = PA1
	//In  2 = PB1
	char i;
	char j;
	char blnInput;
	
	j=0x00;
	do
	{
		for(i=0; i<8;i++)
		{
			do
			{
				blnInput = _btst(PBDR, 1)/2;
			}while(blnInput==(i%2));
	
			if(_btst(strMessage[j], i))
			{
				_bres(PADR, 1);
			}
			else
			{
				_bset(PADR, 1);
			}
		}

		j++;
	}while	(
				((intMessageLength==ST7_MESSAGE_LENGHT) && (strMessage[j]!='\0') && (j<intMessageLength)) ||
				((intMessageLength!=ST7_MESSAGE_LENGHT) && (j<intMessageLength)) 
			);
}
*/
