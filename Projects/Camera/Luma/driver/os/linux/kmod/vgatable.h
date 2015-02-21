/*
 * VGA card recognition table for MATRIX Vision drivers
 *
 *   Changes:
 *   Copyright (c) 2000-2002 Matrix Vision GmbH (info@matrix-vision.de)
 *
 *   This table is based directly on:
 *    ** bttv - Bt848 frame grabber driver **
 *
 *   Copyright (C) 1996,97,98 Ralph  Metzler (rjkm@thp.uni-koeln.de)
 *                          & Marcus Metzler (mocm@thp.uni-koeln.de)
 *   (c) 1999,2000 Gerd Knorr <kraxel@goldbach.in-berlin.de>
 *
 *
 *	If your graphic card is not recognised automatically please enter
 *  the details in the table below and test it.
 *
 *  See also /usr/src/linux/include/linux/pci.h
 *   or /usr/src/linux/include/linux/pci_ids.h (newer 2.4.x kernels)
 *
 *  If it worked please inform MATRIX Vision so that we can include
 *  a new table in future versions (linux@matrix-vision.de). Thanks.
 *
 *  Hint: use "lspci -v" to examine the VGA card's details. The class id
 *  will be 0x0300 followed by the vendor id and the device id.
 *  If the output shows 2 memory addresses then the first is
 *  PCI_BASE_ADDDRESS_0, the second PCI_BASE_ADDRESS_1. Enter the one that
 *  works for you in a new line in the table below.
 *
 *
 $Id: vgatable.h,v 1.8 2002/06/19 11:53:36 hg Exp $
 *
 */
/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

//============== display / VGA =========================================================

struct vidbases
{
	unsigned short vendor, device;
	char *name;
	uint badr;
};

#ifndef PCI_DEVICE_ID_SI_6326
 /* not defined until kernel 2.4.x */
 #define PCI_DEVICE_ID_SI_6326				0x6326
#endif

#ifndef PCI_DEVICE_ID_CT_69000
 #define PCI_DEVICE_ID_CT_69000				0x00c0
#endif

#ifndef PCI_DEVICE_ID_MATROX_G400
 #define PCI_DEVICE_ID_MATROX_G400			0x0525
#endif

#ifndef PCI_DEVICE_ID_ATI_215_LM
 #define PCI_DEVICE_ID_ATI_215_LM			0x4c4D
#endif

#ifndef PCI_DEVICE_ID_ATI_215XL
 #define PCI_DEVICE_ID_ATI_215XL			0x4752
#endif

#ifndef PCI_DEVICE_ID_ATI_215_LI
 #define PCI_DEVICE_ID_ATI_215_LI			0x4c49
#endif

#ifndef PCI_DEVICE_ID_NVIDIA_GEFORCE_SDR
 #define PCI_DEVICE_ID_NVIDIA_GEFORCE_SDR	0x0100
#endif

#ifndef PCI_DEVICE_ID_NVIDIA_GEFORCE2_MX2
 #define PCI_DEVICE_ID_NVIDIA_GEFORCE2_MX2	0x0111
#endif

#ifndef PCI_DEVICE_ID_NVIDIA_TNT2
 #define PCI_DEVICE_ID_NVIDIA_TNT2			0x0028
#endif

#ifndef PCI_DEVICE_ID_NVIDIA_VTNT2
 #define PCI_DEVICE_ID_NVIDIA_VTNT2			0x002C
#endif


/*
  The following graphic cards will be automatically recognised by MATRIX Vision kernel modules.
  A device id of '0' means all devices from the given vendor.
*/
static struct vidbases vbs[] =
{
	{PCI_VENDOR_ID_ALLIANCE, PCI_DEVICE_ID_ALLIANCE_AT3D, "Alliance AT3D", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_215CT222, "ATI MACH64 CT", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_210888GX, "ATI MACH64 Winturbo", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_215GT, "ATI MACH64 GT", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_215_LM, "ATI MVCam3/Rage LM", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_215XL, "ATI Rage XL", PCI_BASE_ADDRESS_0}, // Accent
	{PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_215_LI, "ATI Rage LI", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_CIRRUS, 0, "Cirrus Logic", PCI_BASE_ADDRESS_0},
    {PCI_VENDOR_ID_CT, PCI_DEVICE_ID_CT_69000, "C&T F69000", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_DEC, PCI_DEVICE_ID_DEC_TGA, "DEC DC21030", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_MATROX, PCI_DEVICE_ID_MATROX_MIL, "Matrox Millennium", PCI_BASE_ADDRESS_1},
	{PCI_VENDOR_ID_MATROX, PCI_DEVICE_ID_MATROX_MIL_2, "Matrox Millennium II", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_MATROX, PCI_DEVICE_ID_MATROX_MIL_2_AGP, "Matrox Millennium II AGP", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_MATROX, PCI_DEVICE_ID_MATROX_MYS, "Matrox Mystique", PCI_BASE_ADDRESS_1},
	{PCI_VENDOR_ID_MATROX, PCI_DEVICE_ID_MATROX_G200_AGP, "Matrox G200 AGP", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_MATROX, PCI_DEVICE_ID_MATROX_G400, "Matrox G4xx", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_N9, PCI_DEVICE_ID_N9_I128, "Number Nine Imagine 128", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_N9, PCI_DEVICE_ID_N9_I128_2, "Number Nine Imagine 128 Series 2", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_S3, 0, "S3", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_TSENG, 0, "TSENG", PCI_BASE_ADDRESS_0},
	{PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_GEFORCE_SDR, "Geforce SDR", PCI_BASE_ADDRESS_1},
	{PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_GEFORCE2_MX2, "Geforce MX2", PCI_BASE_ADDRESS_1},
	{PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_TNT2, "NVidia TNT2", PCI_BASE_ADDRESS_1},
	{PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_VTNT2, "NVidia Vanta/TNT2", PCI_BASE_ADDRESS_1},
	{PCI_VENDOR_ID_NVIDIA_SGS,	PCI_DEVICE_ID_NVIDIA_SGS_RIVA128, "Riva128", PCI_BASE_ADDRESS_1},
	{PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_6326, "Silicon Integrated Systems (SiS) 86C326", PCI_BASE_ADDRESS_0}, // HG
	{PCI_VENDOR_ID_INTEL, 0x1132, "Intel 82815 AGP", PCI_BASE_ADDRESS_0}, // Medusa
};
