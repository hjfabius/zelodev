/*------------------------------------------------------------------------
  Neuricam SpA   - Trento - Italy
  http://www.neuricam.com
  email:  techsupport@neuricam.com , info@neuricam.com
--------------------------------------------------------------------------
  Filename: imgserver.c
--------------------------------------------------------------------------
  Project:       <PCCam SDK>
  Author(s):     <Roberto Doriguzzi>
  First release: <Jan 2005>
  Description:   <socket image server>
--------------------------------------------------------------------------
  <gcc options>
   gcc -O2 -Wall -mmmx imgserver.c -o imgserver -lpthread
-------------------------------------------------------------------------*/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <string.h>
#include <netdb.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <pthread.h>
#include <linux/videodev.h>
#include "pccamfg_v4l.h"

#define NX 640
#define NY 480
#define NN (NX*NY)
#define MAX_CONN 1
#define MAX_STR_LENGTH 256

#define PORT 5351

unsigned char *RGB[3];
unsigned char Frame8[NN];
unsigned char Frame16[2*NN];
unsigned char Frame24[3*NN];
unsigned char *Frame;
int pccam;
int imagesize;
struct video_picture vid_pict;
struct video_window vid_win;

struct sockaddr_in myaddr;    		//server address
struct sockaddr_in myaddr_data;    	//server address
struct sockaddr_in remoteaddr;		//client address
struct sockaddr_in remoteaddr_data;	//client address
int fdmax;        			//maximum file descriptor number
int listener;     			//new accepted socket descriptor
int datagram;
pthread_t ploop;

FILE *out;
struct timeval *start,*stop;
void *Tzp;

/*************************************************************************/
/*************************************************************************/
void *ping_loop();
int Communication(int fd,char *buffer);
int Send(int fd,void *buf,int len);
int Recv(int fd,void *buf,int len);
int SendString(int fd,char *buf);
int RecvString(int fd,char *buf,int maxlen);
int Connect(int *sockfd,char * addr);
void Disconnect(int *sockfd);

/*************************************************************************/
/*************************************************************************/

int main(void)
{
    fd_set master;   			//master file descriptor list
    fd_set read_fds; 			//temp file descriptor list
    int newfd;
    char buf[MAX_STR_LENGTH];
    char addresses[MAX_CONN][16];	//address list
    int nbytes;
    int yes=1;
    int addrlen;
    int i;


    FD_ZERO(&master);
    FD_ZERO(&read_fds);
    
    start = (struct timeval*) malloc(sizeof(struct timeval));
    stop  = (struct timeval*) malloc(sizeof(struct timeval));

    
    if ((listener = socket(AF_INET, SOCK_STREAM, 0)) == -1)
    {
        perror("socket");
        exit(1);
    }


    if (setsockopt(listener, SOL_SOCKET, SO_REUSEADDR, &yes,sizeof(int)) == -1) 
    {
        perror("setsockopt");
        exit(1);
    }

    
    myaddr.sin_family = AF_INET;
    myaddr.sin_addr.s_addr = INADDR_ANY;
    myaddr.sin_port = htons(PORT);
    memset(&(myaddr.sin_zero), '\0', 8);
    if (bind(listener, (struct sockaddr *)&myaddr, sizeof(myaddr)) == -1)
    {
        perror("bind");
        exit(1);
    }


    if (listen(listener, MAX_CONN) == -1)
    {
        perror("listen");
        exit(1);
    }

    FD_SET(listener, &master);
    fdmax = listener;
    
    // -----------  datagram socket  --------------------------
    
    if ((datagram = socket(AF_INET, SOCK_DGRAM, 0)) == -1)
    {
        perror("socket");
        exit(1);
    }
    
    myaddr_data.sin_family = AF_INET;
    myaddr_data.sin_addr.s_addr = INADDR_ANY;
    myaddr_data.sin_port = htons(PORT);
    memset(&(myaddr_data.sin_zero), '\0', 8);
    if (bind(datagram, (struct sockaddr *)&myaddr_data, sizeof(myaddr_data)) == -1)
    {
        perror("bind");
        exit(1);
    }
    pthread_create (&ploop, NULL, ping_loop, NULL);
    
    // ---------------------------------------------------------

    for(;;)
    {          
        read_fds = master;
        if (select(fdmax+1, &read_fds, NULL, NULL,NULL) == -1)
	{
            perror("select");
            exit(1);
        }

        for(i = 0; i <= fdmax; i++)
	{
            if (FD_ISSET(i, &read_fds))
	    {
                if (i == listener)		//new connection
		{
                    addrlen = sizeof(remoteaddr);
                    if ((newfd = accept(listener, (struct sockaddr *)&remoteaddr,&addrlen)) == -1)
		    {
                        perror("accept");
                    }
		    else
		    {
                        FD_SET(newfd, &master); // add to master set
                        if (newfd > fdmax)
			{
                            fdmax = newfd;
                        }
			strcpy(addresses[newfd],inet_ntoa(remoteaddr.sin_addr));
                        printf("selectserver: new connection from %s on "
                            "socket %d\n", addresses[newfd], newfd);
			    
			pccam = 0;
    			pccam = open("/dev/video",O_RDWR);
    			vid_pict.depth = 7;
    			vid_pict.brightness = 0x30;
    			ioctl(pccam,VIDIOCSPICT,&vid_pict);
    			Frame = Frame8;
    
    			vid_win.width = NX;
    			vid_win.height = NY;
    			ioctl(pccam,VIDIOCSWIN,&vid_win);
    			imagesize = NN;
                    }
                }
		else
		{

                    if((nbytes = RecvString(i, buf,sizeof(buf))) <= 0)
		    {

                        if (nbytes == 0)
			{

                            printf("imgserver: host %s has closed the connection\n", addresses[i]);
                        } else
			{
			    printf("imgserver: host %s has closed the connection\n", addresses[i]);
                            perror("recv");
                        }
			close(pccam);
                        close(i);
                        FD_CLR(i, &master);
                    } else
		    {		
	                if(Communication(i,buf) < 0)
			   printf("imgserver: unknown command!\n");
                    }

                }
            }
        }
    }
    pthread_cancel(ploop);
    
    free(start);
    free(stop);
    return 0;
}
/*****************************************************************/
void *ping_loop()
{
  int addr_len;
  char buf[MAX_STR_LENGTH];
  while(1)
  {
     addr_len = sizeof(struct sockaddr);
     recvfrom(datagram,buf,MAX_STR_LENGTH-1,0,(struct sockaddr *)&remoteaddr_data, &addr_len);
     sendto(datagram,"Cam\0",4,0,(struct sockaddr*)&remoteaddr_data,addr_len);     
  }

}


/*****************************************************************************************/

int  Communication(int fd,char *buffer)
{
  char mystr[MAX_STR_LENGTH];
  unsigned char pic_depth;
  unsigned char pic_brightness;
  unsigned char pic_width;
  unsigned char pic_height;

    
    if(strncasecmp(buffer,"pic",3)==0)
    {     
      Recv(fd,(unsigned char *)&pic_depth,sizeof(pic_depth));
      Recv(fd,(unsigned char *)&pic_brightness,sizeof(pic_brightness));
      vid_pict.depth = pic_depth;
      vid_pict.brightness = pic_brightness;
      
      switch(pic_depth)
      {
        case 7: Frame = Frame8; imagesize = NN; break;
	case 8: Frame = Frame8; imagesize = NN; break;
	case 16: Frame = Frame16; imagesize = 2*NN; break;
	default: Frame = Frame8; imagesize = NN;
      }
      ioctl(pccam,VIDIOCSPICT,&vid_pict);     
      return 0;
    }
    if(strncasecmp(buffer,"win",3)==0)
    {     
      Recv(fd,(unsigned char *)&pic_width,sizeof(pic_width));
      Recv(fd,(unsigned char *)&pic_height,sizeof(pic_height));
      vid_win.width = pic_width;
      vid_win.height = pic_height;
      ioctl(pccam,VIDIOCSWIN,&vid_win);
      return 0;
    }
    
    if(strcmp(buffer,"disconnect")==0)
    {          
      strcpy(mystr,"disconnect\0");
      send(fd,mystr, strlen(mystr)+1, 0);
      return 0;
    }
  
    if(strncasecmp(buffer,"img",3)==0)
    {    
      lseek(pccam,0,SEEK_SET);
      read(pccam,Frame,imagesize); 
      Send(fd,Frame,imagesize);
      return 0;
    }
   return -1;  
}
/***********************************************************************/
/*************                                           ***************/
/*************            ADDITIONAL FUNCTIONS           ***************/
/*************                                           ***************/
/***********************************************************************/

int Send(int fd,void *buf,int len)
{
  int sum = 0;
  int bytes = 0;;
  
  while(sum < len)
  {
    bytes = send(fd,buf,len, 0);
    if(bytes > 0) sum += bytes;
    else return bytes;
  }
  return bytes;
}
/***********************************************************************/
int Recv(int fd,void *buf,int len)
{
  int sum = 0;
  int bytes = 0;;
  
  while(sum < len)
  {
    bytes = recv(fd,buf,len, 0);
    if(bytes > 0) sum += bytes;
    else return bytes;
  }
  return bytes;

}
/***********************************************************************/
int RecvString(int fd,char *buf,int maxlen)
{
  int sum = 0;
  int bytes = 0;
  int counter;
  char a;

  strcpy(buf,"\0");
  counter = 0;
  a = '1';
  while(a && sum < maxlen)
  {
    bytes = recv(fd,&a,1, 0);
    if(bytes > 0)
    {
      buf[counter] = a;
      counter++;
      sum += bytes;
    }
    else return bytes;
  }
  return sum;

}

/***********************************************************************/
int SendString(int fd,char *buf)
{
  int bytes;
  int i;

  i = 0;
  while(buf[i++] && i < MAX_STR_LENGTH);

  bytes = send(fd,buf,i, 0);

  return bytes;

}

/**************************************************************************/
int Connect(int *sockfd,char *addr)
{
  struct hostent *he;
  struct sockaddr_in their_addr; 

    if ((he=gethostbyname(addr)) == NULL)
    {  
        perror("gethostbyname");
        return -1;
    }

    if ((*sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
    {
        perror("socket");
        return -1;
    }

    their_addr.sin_family = AF_INET;    
    their_addr.sin_port = htons(PORT);  
    their_addr.sin_addr = *((struct in_addr *)he->h_addr);
    memset(&(their_addr.sin_zero), '\0', 8); 

    if (connect(*sockfd, (struct sockaddr *)&their_addr, sizeof(struct sockaddr)) == -1)
    {
        perror("connect");
        return -1;
    }
    
  return 0;
}

/**************************************************************************/
void Disconnect(int *sockfd)
{
  printf("Shutdown the connection\n");
  close(*sockfd);
}
/**************************************************************************/


