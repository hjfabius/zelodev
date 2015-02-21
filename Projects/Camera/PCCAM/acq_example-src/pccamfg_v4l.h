/*------------------------------------------------------------------------
 Neuricam SpA   - Trento - Italy
 http://www.neuricam.com
 email:  techsupport@neuricam.com , info@neuricam.com
--------------------------------------------------------------------------
 Filename: pccamfg_v4l.h
--------------------------------------------------------------------------
 Project:       <PCCam SDK>
 Author(s):     <Roberto Doriguzzi>
 First release: <February 2004>
 Description:   <pccam acquisition driver for Linux OS>
-------------------------------------------------------------------------*/

struct pccam_i2c {
	int adapter_nr;
	int slave_addr;
	int reg_addr;
	int reg_value;
};

#define VIDIOCGI2C	_IOW('v',50, struct pccam_i2c)
#define VIDIOCSI2C	_IOW('v',51, struct pccam_i2c)
#define VIDIOCGIO	_IOW('v',52, unsigned char)
#define VIDIOCSIO	_IOW('v',53, unsigned char)
#define VIDIOCGINT	_IOW('v',54, unsigned short)
#define VIDIOCSINT	_IOW('v',55, unsigned short)
#define VIDIOCSIMAGE	_IOW('v',56, unsigned char)
#define VIDIOCSTRIGGER	_IOW('v',57, unsigned char)

