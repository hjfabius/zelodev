#ifndef __MAIN_H__
	#define __MAIN_H__
	
	#include "common.h"


/*	Idea portante
	T2 è un timer che opera a Fosc/2 = 20 MHz. (si puo' pensare di lasciare sul circuito l'ingresso per un oscillatore che generi una frequenza piu' alta)
	Un encoder a due canali da 1024 impulsi puo' generare X4 fronti (2048 salita + 2048 discesa) per ciclo.
	QEI1 conta questi fronti (reset su channel 0)
	QEI2 genera un interrupt ad ogni fronte
	L'interrupt QEI2 genera 
		il capture del valore di T2
		il capture del valore di QEI1
		il confronto con i valori correnti e i valori precedenti
		il reset di T2

	S1 e' il primo segnale 
		se in marca-cilindro lo genero io (inizio gate)
		se in marca-marca e' il colore di riferimento

	S2 e' il segnale del secondo impulso
		se in marca-cilindro e' il segnale della marca
		se in marca-cilindro e' il segnale del colore da mantenere a registro

	IC1 cattura il fronte di saluta di S1
	IC2 cattura il fronte di discesa di S1
	IC3 cattura il fronte di salita di S2
	IC4 cattura il fronte di discesa di S2

	???? forse
	In casi di marca-cilindro, per generare S1 occorre un output compare attaccato a QEI1 e un altro attaccato a T2
	

*/


	
	/*-----------------------------------------------------------------------------
	   Declaration of global variables and global message buffers used in main.c
	-----------------------------------------------------------------------------*/
	

volatile WORD m_woCurrentQEIPulseLength;
volatile WORD m_arwoQEIPulseLengthStart[SIGNAL_COUNT];
volatile WORD m_arwoQEIPulseLengthEnd[SIGNAL_COUNT];
volatile WORD m_arwoSignalStart[2][SIGNAL_COUNT];
volatile WORD m_arwoSignalEnd[2][SIGNAL_COUNT];
volatile WORD m_arwoGateStart[1][SIGNAL_COUNT];
volatile WORD m_arwoGateEnd[1][SIGNAL_COUNT];
volatile WORD m_arwoSignalPhaseStart[SIGNAL_PHASE_COUNT] = {-1, -1, -1, -1, -1, -1, -1, -1};
volatile WORD m_arwoSignalPhaseEnd[SIGNAL_PHASE_COUNT]= {-1, -1, -1, -1, -1, -1, -1, -1};

	   double m_ardblSignalStart[SIGNAL_COUNT];			//4X Signal Start based on encoder position (with decimals coming from timers)
	   double m_ardblSignalEnd[SIGNAL_COUNT];			//4X Signal End based on encoder position  (with decimals coming from timers)
	   double m_ardblSignalMiddle[SIGNAL_COUNT];		//Signal Middle Point (Start+End/2)
	   double m_ardblDistanceLong[SIGNAL_COUNT-1];
	   double m_ardblDistanceTran[SIGNAL_COUNT-1];
	   double m_ardblReferenceLong[SIGNAL_COUNT-1];
	   double m_ardblErrorLong[SIGNAL_COUNT-1];
	   double m_ardblErrorTran[SIGNAL_COUNT-1];
volatile BYTE m_ucSteps;
volatile BYTE m_ucEncoderArea;
		 BYTE m_ucSignalPhasePointer = 0x00;
 		 BYTE m_arycSignalPositionInMarks[SIGNAL_COUNT];

volatile WORD m_woEncoderPosition;
volatile BYTE m_byS1;
		 
	
	
#endif
