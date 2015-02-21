/*------------------------------------------------------------------------
  Neuricam SpA   - Trento - Italy
  http://www.neuricam.com
  email:  techsupport@neuricam.com , info@neuricam.com
--------------------------------------------------------------------------
  Filename: acq_example.c
--------------------------------------------------------------------------
  Project:       <PCCam SDK>
  Author(s):     <Roberto Doriguzzi>
  First release: <May 2004>
  Description:   <simple acquisition program + jpeg compression>
--------------------------------------------------------------------------
  <gcc options>
   gcc -O2 -Wall -mmmx acq_example.c -o acq_example -ljpeg
-------------------------------------------------------------------------*/


#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <jpeglib.h>
#include <sys/time.h>
#include <sys/ioctl.h>
#include <linux/videodev.h>

#define NX 640
#define NY 480

/*******************************************************************/
int jpeg_compress_to_file(char *src, char *file, int width, int height, int depth, int quality);
void usage(int argc);

/*******************************************************************/
int main(int argc,char** argv)
{
	int pccam,i;
	unsigned char *image;
	int image_size;
	struct video_picture vid_pict;
	struct video_window vid_win;
	int compression_factor;
	int image_depth=8;
	char * filename;

	if(argc != 4) usage(argc);
	
	image_depth = atoi(argv[1]);
	compression_factor = atoi(argv[2]);
	filename = argv[3];
	
	switch(image_depth)
	{
	  case 7:
		  image_size = NX*NY;
		  image = (unsigned char *) malloc(image_size);
	  	  break;
	  case 8:
		  image_size = NX*NY;
		  image = (unsigned char *) malloc(image_size);
		  break;
	  case 10:
		  image_size = 2*NX*NY;
		  image = (unsigned char *) malloc(image_size);
		  break;
 	  case 12:
		  image_size = 2*NX*NY;
                  image = (unsigned char *) malloc(image_size);
                  break;
	  case 24:
		  image_size = 3*NX*NY;
                  image = (unsigned char *) malloc(image_size);
                  break;
	  default:
		  printf("Bad image depth!\n");
		  exit(0);
	}
	

	/*      opening the device      */
	
	pccam = 0;
	pccam = open("/dev/video",O_RDWR);

	/*  setting picture properties  */

	vid_pict.depth = image_depth;
	vid_pict.brightness = 0x3F;	
	ioctl(pccam,VIDIOCSPICT,&vid_pict);

	/*     setting picture size     */

	vid_win.width  = NX;
	vid_win.height = NY;
	ioctl(pccam,VIDIOCSWIN,&vid_win);

	/*      acquiring the image     */

   	lseek(pccam,0,SEEK_SET);
        read(pccam,image,image_size);	
        
	/* converting images before passing them to the compressor */
	
	unsigned short *ptr;
	unsigned char shift;
	if(image_depth == 10 || image_depth == 12)
	{
	  ptr = (unsigned short *) image;
	  shift = image_depth - 8;
	
	  for(i=0;i<NX*NY;i++)
	    image[i] = (ptr[i] >> shift);
	}
	
	/*   compressing and saving the image   */

        jpeg_compress_to_file(image, filename,NX,NY,image_depth,compression_factor);

	/*  	 closing the device     */
	
	close(pccam);
	free(image);

	return 0;
}

/*******************************************************************/

int jpeg_compress_to_file(char *src, char *file, int width, int height,int depth, int quality)
{
  FILE *outfile;
  struct jpeg_compress_struct cinfo;
  struct jpeg_error_mgr jerr;
  JSAMPROW row_pointer;
  int rowstride;

  if ((outfile = fopen(file, "wb"))==NULL) {
    fprintf(stderr, "can't open %s\n", file);
    return -1;
  }

  memset (&cinfo,0,sizeof(cinfo));
  cinfo.err = jpeg_std_error(&jerr);
  jpeg_create_compress(&cinfo);
 

  cinfo.image_width = width;
  cinfo.image_height = height;

  if(depth == 24)
  {
    cinfo.input_components = 3;
    cinfo.in_color_space = JCS_RGB;
  }
  else
  {
    cinfo.input_components = 1;                                                     cinfo.in_color_space = JCS_GRAYSCALE;
  }

  jpeg_stdio_dest(&cinfo, outfile);
  jpeg_set_defaults(&cinfo);
  jpeg_set_quality (&cinfo, quality, TRUE);
  jpeg_start_compress(&cinfo, TRUE);

  rowstride = cinfo.input_components*width;
  while (cinfo.next_scanline < cinfo.image_height) {
    row_pointer = &src[cinfo.next_scanline*rowstride];
    jpeg_write_scanlines(&cinfo, &row_pointer, 1);
  }
  jpeg_finish_compress(&cinfo);

  jpeg_destroy_compress(&cinfo);
  return 0;
}
/*******************************************************************/
void usage(int argc)
{
  if(argc < 4) fprintf(stderr,"Too few arguments\n");
  if(argc > 4) fprintf(stderr,"Too many arguments\n");
  fprintf(stderr,"Usage: acq_class <image_depth> <compression_factor> <filename> \n\n");
  exit(1);

}
