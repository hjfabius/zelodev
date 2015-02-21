/*------------------------------------------------------------------------
 Neuricam SpA   - Trento - Italy
 http://www.neuricam.com
 email:  techsupport@neuricam.com , info@neuricam.com
--------------------------------------------------------------------------
 Filename: pccam_viewer.c
--------------------------------------------------------------------------
 Project:       <PCCam SDK>
 Author(s):     <Roberto Doriguzzi>
 First release: <July 2004>
 Description:   <Neuricam PCCam image viewer>
--------------------------------------------------------------------------
 Compile with:
 gcc -O2 -Wall `pkg-config --cflags --libs gtk+-2.0 gthread-2.0` pccam_viewer.c -o pccam_viewer
------------------------------------------------------------------------*/


#include <string.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <gtk/gtk.h>
#include <gdk/gdk.h>
#include <linux/videodev.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/time.h>
#include "pccamfg_v4l.h"

#define NX 640
#define NY 480

int pccam;
struct video_picture vid_pict;
struct video_window vid_win;
unsigned char Frame[NX*NY];
unsigned long chromakey;
GdkWindow *mainwin;
GtkWidget *playbutton;
GtkWidget *stopbutton;
GtkWidget *quitbutton;
GtkWidget *gainbar;

unsigned short RGB32toRGB16(unsigned long src);
/*****************************************************************/
static void play(GtkWidget *button)
{
  int x,y;
  int arg;

  vid_pict.depth = 16;
  vid_pict.palette = VIDEO_PALETTE_RGB565;
  ioctl(pccam,VIDIOCSPICT,&vid_pict); //setting picture prop

  gdk_window_get_position(mainwin,&x,&y);
  vid_win.x = x;
  vid_win.y = y;
  vid_win.width = NX;
  vid_win.height = NY;
  vid_win.chromakey = chromakey;
  ioctl(pccam,VIDIOCSWIN,&vid_win);
  
  arg = 1;
  ioctl(pccam,VIDIOCCAPTURE,&arg);   //starting capture
}
/*****************************************************************/
void change_gain(GtkRange *range,gpointer user_data)
{
  unsigned short level;

  level = (int) gtk_range_get_value((GtkRange *)gainbar);
  ioctl(pccam,VIDIOCSINT,&level);
  
  ioctl(pccam,VIDIOCGINT,&level);
  printf("Integration Time: %d\n",level);
}

/*****************************************************************/
static void stop(GtkWidget *button)
{
  int arg = 0;
  ioctl(pccam,VIDIOCCAPTURE,&arg);
  gtk_widget_set_sensitive(GTK_WIDGET(playbutton), 1);
}

/*****************************************************************/
static void quit(GtkWidget *button)
{
  int arg = 0;
  ioctl(pccam,VIDIOCCAPTURE,&arg);
  close(pccam);

  gtk_main_quit();
}
/*****************************************************************/
gboolean
window_event(GtkWidget *widget, GdkEvent *event,gpointer user_data)
{
  int x,y;

  if(event->type == 13)
  {	  
         gdk_window_get_position(mainwin,&x,&y);
         vid_win.x = x;
         vid_win.y = y;
         vid_win.width = NX;
         vid_win.height = NY;
         vid_win.chromakey = chromakey;
         ioctl(pccam,VIDIOCSWIN,&vid_win);  //setting window prop
  }
  
  //printf("event type: %d \n",event->type);
  return FALSE;
}
/*****************************************************************/
int main(int argc, char **argv)
{
  int x,y;
  unsigned short key16;
  GdkImage *mainimg;
  GdkVisual *mainvis;
  GtkWidget *window;
  GtkWidget *vbox;
  GtkWidget *hbox;
  GtkWidget *hbox1,*hbox2;
  GtkWidget *tv;
  GtkWidget *imagepanel;
  GtkWidget *label;
  GtkWidget *vseparator;
  
  /* initalizing thread stuff */
  g_thread_init(NULL);
  gdk_threads_init();

  gtk_init(&argc, &argv);

  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title(GTK_WINDOW(window), "NeuriCam - PCCam Viewer");
  g_signal_connect (window, "event",G_CALLBACK (window_event),NULL);
  g_signal_connect(window, "delete_event",G_CALLBACK(gtk_main_quit), NULL);

  tv = gtk_text_view_new();
  gtk_text_view_set_cursor_visible(GTK_TEXT_VIEW(tv), FALSE);

  vbox = gtk_vbox_new(FALSE, 2);
  gtk_container_add(GTK_CONTAINER(window), vbox);
  
  imagepanel = gtk_image_new();
  gtk_widget_show (imagepanel);
  gtk_box_pack_start (GTK_BOX (vbox), imagepanel, TRUE, TRUE, 0);
  gtk_widget_set_size_request (imagepanel, 640, 480);
  
  hbox = gtk_hbox_new(FALSE, 0);
  gtk_box_pack_start(GTK_BOX(vbox), hbox, FALSE,FALSE, 2);
  
  hbox1 = gtk_hbox_new(FALSE, 0);
  gtk_box_pack_start(GTK_BOX(hbox), hbox1, FALSE,FALSE, 2);
  
  vseparator = gtk_vseparator_new ();
  gtk_box_pack_start (GTK_BOX (hbox), vseparator, FALSE,FALSE, 10);
  gtk_widget_show (vseparator);
  
  hbox2 = gtk_hbox_new(FALSE, 0);
  gtk_box_pack_start(GTK_BOX(hbox), hbox2, FALSE,FALSE, 2);

  playbutton = gtk_button_new_with_label("Play");
  gtk_box_pack_start(GTK_BOX(hbox1), playbutton, FALSE,FALSE, 2);
  g_signal_connect(G_OBJECT(playbutton), "clicked", G_CALLBACK(play),NULL);
  gtk_widget_set_size_request (playbutton, 80, 30);
  
  stopbutton = gtk_button_new_from_stock ("gtk-stop");
  gtk_box_pack_start(GTK_BOX(hbox1), stopbutton, FALSE,FALSE, 2);
  g_signal_connect(G_OBJECT(stopbutton), "clicked", G_CALLBACK(stop),NULL);
  gtk_widget_set_size_request (stopbutton, 80, 30);

  quitbutton = gtk_button_new_from_stock(GTK_STOCK_QUIT);
  gtk_box_pack_start(GTK_BOX(hbox1), quitbutton, FALSE,FALSE, 2);
  g_signal_connect(G_OBJECT(quitbutton), "clicked", G_CALLBACK(quit), NULL);
  gtk_widget_set_size_request (quitbutton, 80, 30);

  label = gtk_label_new("Brightness");
  gtk_widget_show (label);
  gtk_box_pack_start (GTK_BOX (hbox2), label, FALSE, FALSE, 30);
  
  gainbar = gtk_hscrollbar_new (GTK_ADJUSTMENT (gtk_adjustment_new (31, 1, 503, 1, 0, 0)));
  gtk_widget_show (gainbar);
  gtk_box_pack_start (GTK_BOX (hbox2), gainbar, FALSE, FALSE, 0);
  g_signal_connect(G_OBJECT(gainbar), "value_changed", G_CALLBACK(change_gain),NULL);
  gtk_widget_set_size_request (gainbar, 200, -1);
  
  gtk_widget_show_all(window);

  /* guarding gtk_main with gdk_threads* pair */
  pccam = 0;
  pccam = open("/dev/video",O_RDWR);

  mainwin = gtk_widget_get_parent_window(imagepanel);
  mainvis = gdk_visual_get_system();
  mainimg = gdk_image_new(GDK_IMAGE_NORMAL,mainvis,NX,NY);
  chromakey = 0x00f000f0;
  key16 = RGB32toRGB16(chromakey);
  for(x=0;x<NX;x++)for(y=0;y<NY;y++)
    gdk_image_put_pixel(mainimg,x,y,key16);

  gtk_image_set_from_image(imagepanel,mainimg,NULL);

  vid_pict.depth = 16;
  vid_pict.brightness = 0x30;
  vid_pict.palette = VIDEO_PALETTE_RGB565;
  ioctl(pccam,VIDIOCSPICT,&vid_pict);

  ioctl(pccam,VIDIOCGPICT,&vid_pict);
  gtk_range_set_value((GtkRange *)gainbar,vid_pict.brightness);
  
  gdk_threads_enter();
  gtk_main();
  gdk_threads_leave();

  close(pccam);
  return 0;
}
/*****************************************************************/
unsigned short RGB32toRGB16(unsigned long src)
{
  unsigned long r,g,b;
  unsigned short dest = 0;

  r = (src & 0x00f80000) >> 8;
  g = (src & 0x0000f800) >> 5;
  b = (src & 0x000000f8) >> 3;

  dest |= (unsigned short)r;
  dest |= (unsigned short)g;
  dest |= (unsigned short)b;
  return dest;
}

/*****************************************************************/
