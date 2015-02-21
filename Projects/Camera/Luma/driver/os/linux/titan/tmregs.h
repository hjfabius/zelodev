#ifndef _tmregs_h
#define _tmregs_h

#define ZEROES(i)		(~0<<(i))
#define ONES(i)			(~ZEROES(i))
#define FIELD(pos,n)	(ONES((pos)+(n))&ZEROES(pos))

#define REG_SPEC_POS	 0
#define REG_SPEC_BITS	24
#define REG_SPACE_POS	24
#define REG_SPACE_BITS	 4
#define REG_MODE_POS	28
#define REG_MODE_BITS	 4

#define _getfld(x,f)	(((x)>>REG_##f##_POS)&ONES(REG_##f##_BITS))
#define _makfld(x,f)	(((x)&ONES(REG_##f##_BITS))<<REG_##f##_POS)

#define _makmode(m)		_makfld(m,MODE)
#define _getmode(x)		_getfld(x,MODE)
#define _makspace(s)	_makfld(s,SPACE)
#define _getspace(x)	_getfld(x,SPACE)
#define _makspec(s)		_makfld(s,SPEC)
#define _getspec(x)		_getfld(x,SPEC)

#define modeNONE		BIT(0)
#define modeREAD		BIT(0)
#define modeWRITE		BIT(1)
#define modeRW			(modeREAD|modeWRITE)

#define _rREAD			_makmode(modeREAD)
#define _rWRITE			_makmode(modeWRITE)
#define _rRW			_makmode(modeREAD|modeWRITE)

#define spacePCI		1		// system spaces
#define spaceIO			2
#define spaceMMIO		8		// trimedia spaces
#define spaceDRAM		9

#define _makreg(mod,spa,spe)	(_makfld(mode##mod,MODE)|_makfld(space##spa,SPACE)|(spe))
#define _makregf(mod,spa,spe)	(_makfld(mod,MODE)|_makfld(spa,SPACE)|(spe))

#define _modeis(s,m)				((_getmode(s)&mode##m)!=0)
#define _mmio(mod,ofs)				(_makreg(mod,MMIO,ofs))
#define _pci(mod,siz,bus,devfun,reg)	\
				(_makreg(mod,PCI,((siz)<<20)|((bus)<<16)|((devfun)<<8)|(reg)))
#define _size(x)					(((x)>>20)&0x0f)
#define _bus(x)						(((x)>>16)&0x0f)
#define _devfun(x)					(((x)>>8)&0xff)
#define _index(x)					((x)&0xff)

#define _busMAX		0x0f
#define _devfunMAX	0xff

typedef struct
{
	unsigned long reg;
	unsigned long val;
}
TRegStruct;

#endif /* _tmregs_h */
