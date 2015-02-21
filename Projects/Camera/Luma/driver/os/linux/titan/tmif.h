
/* 
   tmif.h - TriMedia interface definitions

   Copyright (C) 98 Werner Armingeon ( warmingeon@matrix-vision.de )

 */

#ifndef _TMIF_H_
#define _TMIF_H_

#define  DPB_MAGICSIZE 64
#define  DPB_MAGIC     "TM-Soft:cjp:da:fd:gfp:lcf:rj:troy:wcs:yc:zcw\0"

typedef struct
{
	char magic[DPB_MAGICSIZE];	/* starts at 64 byte boundary */
	int flipped;				/* has wrap-around occured?   */
	char *unused1;
	unsigned int buffer_size;	/* length of trace buffer     */
	unsigned int tail;			/* position in trace buffer   */
	unsigned int buffer;		/* address of trace buffer    */
}
TTmDebugBuffer;

#define HOST_IRQ_NUM	28

#define MSG_QUEUE_REG	INTVEC26
#define MSG_BUFFER_REG	INTVEC27

#define MSG_BUFFER_SIZE    4096

typedef struct
{
	char buffer[MSG_BUFFER_SIZE];
} TMessageBuffer;


#define MSG_QUEUE_SIZE     4096

typedef enum { qfRpcReturn=0x0001, qfJobEnd=0x0002 } TQueueFlag ;

typedef struct
{
	long 	flag ;
	long	result ;
	union {	long	msgnumber;	// qfRpcReturn
			TSlot 	*slot ;		// qfJobEnd
			long    id ;		// unspecified type / cast
		  } id ;
	long	par ;
} TQueueEntry ;
			
typedef struct
{
    long    items ;
    long    head ;  		// TM write pointer
    long    tail ;  		// host read pointer
	long	reserved ;		// aligns data to 4*4
	TQueueEntry	data[0] ;	// place holder for real queue data
} TMessageQueue;

//---- tmmesg ---------------------------------------------------------

#define DUMMY_DATA_SIZE 4
#define DEFAULT_MESG_BUF_SIZE   512
#define TMM_DATA_ALIGNMENT	4

struct STmMessage
{
	unsigned mesg_length;
	unsigned buffer_size;
	unsigned number;
	int result;
	unsigned char data[DUMMY_DATA_SIZE];	// base for buffer data
};

//---- mvtmtypes  ---------------------------------------------------------

typedef struct SMvTitan   TMvTitan ;
typedef struct STmMessage TTmMessage ;

typedef int TDevice	;

#endif // _TMIF_H_

