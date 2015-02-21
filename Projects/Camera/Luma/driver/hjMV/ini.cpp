/*
** This	.ini management	code is	placed into	the	Public Domain
** by Carey	Bloodworth on May 26, 1998.
*/
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include <ctype.h>
#include <limits.h>
#include <time.h>
#include <stdarg.h>

#include "ini.h"

/*
** Expect the following	two	macros to be defined:

** The standard	C macro	FILENAME_MAX might only	be large enough	for
** just	the	filename, and not any path.<disgust>  I	need to	allow
** enough for paths, too.
#define	MAX_FILENAME 128
#define	LINE_INPUT_MAX 256
*/
#define	MAX_FILENAME 128
#define	LINE_INPUT_MAX 5000


/*
** Strip leading and trailing spaces.
*/
void	StripSpaces(char *string)
{
	char *trailing;
	while ((*string) &&	((*string==' ')	|| (*string=='\t')))
	{
		memmove(string,string+1,strlen(string));
	}

	trailing = string + strlen(string);
    
	while ((*string) &&	((*trailing==' ') || (*trailing=='\t')))
	{
		*trailing--	= '\0';
	}
}

static void StripLF(char *Str)
{
	if (Str==NULL) 
	{
		return;
	}

	while (Str[0])
	{
		int x;
		x=strlen(Str)-1;
		if (Str[x]=='\n') 
			Str[x]='\0';
		else if	(Str[x]=='\r') 
			Str[x]='\0';
		else 
			return;
	}
}


/*
** Read	a line of input, removing '\n'.	 With error	checking.
*/
static bool ReadLine(FILE *fp, char	*line)
{
	char *cp;
	
	memset(line,'\0',LINE_INPUT_MAX);
    cp=fgets(line,LINE_INPUT_MAX-2,fp);

	if (cp==NULL)	   
	{
		*line='\0';
		return false;
	}
	
	if (feof(fp)!=0)   
	{
		*line='\0';
		return false;
	}

	if (ferror(fp)!=0) 
	{
		*line='\0';
		return false;
	}

	StripLF(line);

	return true;
}



// Compare strings,	ignoring case.
static int StrEqIC(char *s1,char *s2)
{
	if ((s1==NULL) || (s2==NULL)) 
		return false;

	while (tolower(*s1)==tolower(*s2))
	{
		if	(*s1=='\0')	
			return true;

		s1++;
		s2++;
	} 
	
	return false;
}


/*
** Combine two strings.	 Str1 points to	the	heap.  If Str1 is a	NULL
** then	that means an error	previously occured and to return NULL.
*/
static char	* StrAdd(char	*str1,char *str2)
{
	char *ptr;
	
	if (str1==NULL)	
		return NULL;

	ptr=(char*)realloc(str1,strlen(str1)+strlen(str2)+1);

	if (ptr==NULL) 
	{
		free(str1);
		return NULL;
	}

	strcat(ptr,str2);

	return ptr;
}


/*
** This	routine	divides	the	line into two parts.  The variable,	and
** the 'string'.  If the line is a comment,	the	'data' variable	will
** contain the line	and	'var' will be empty.
*/
static void ParseLine(char *line,char *var,	char *data)
{
	char *str;
	StripSpaces(line);
	*data='\0';
	*var='\0';

	if ((line[0]==';') || (line[0]=='%') ||	(line[0]=='#'))
	{
		strcpy(data,line);
		return;
	}
	strcpy(var,line);

	str=strpbrk(var," =\t");
	if (str!=NULL)
	{
		strcpy(data,str);
		*str='\0';

		if ((*data==' ') ||	(*data=='\t')) 
			StripSpaces(data);

		if (*data=='=')	
		{
			*data=' ';
			StripSpaces(data);
		}
	}
}


/*
** Just	return whether a file exists or	not.
*/
int hjFileExists(char	*FileName)
{
	FILE *f;

	f=fopen(FileName,"rb");
	if (f==NULL) 
		return	false;

	fclose(f);
	return true;
}


/*
** Create a	unique temporary filename in the current working
directory.
**
** TempFileName	must point to a	char space of at least FILENAME_MAX+1
chars.
**
** We also make	sure we	can	actually open the file,	in addition
** to it being a unique, unused	filename.
**
** We have to create our own temporary filename, because the library
** version only	has	to be able to do a few,	which may not be enough,
** since we	totally	rewrite	the	file for every update.
*/
int CreateTempFileName(char	*TempFileName)
{
	int x;
	FILE *TempFile=NULL;
	int	tries=0;

	strcpy(TempFileName,"tempfile.tmp");

	do 
	{
		srand((unsigned	int)time(NULL)+tries);

		for	(x=4;x<8;x++)
			TempFileName[x]=(char)('0'+(rand() % 10));

		if (!hjFileExists(TempFileName))
            TempFile=fopen(TempFileName,"w");

		tries++;
	} while	((TempFile==NULL) && (tries<100));

	if (TempFile==NULL)	
		return false;

	fclose(TempFile);
    return true;
}


/*
**	This will update a variable	in a specific section in your .ini file.
**	It will	do so safely by	copying	it to a	new	file, and when finished,
**	will delete	the	old	one	and	rename the new one to the correct name.
**	If any fatal error occurs, it will return a	false to indicate failure
**	and	true to	indicate success.  I generally don't care why it failed,
**	just knowing that it failed	is usually enough.
*/
static int UpdateCfgStr(char *FileName,char *SectionName,char *VarWanted, char *NewData)
{
	FILE *CfgFile,*NewCfgFile;
	char SectionWanted[LINE_INPUT_MAX];
	char line[LINE_INPUT_MAX];
	char var[LINE_INPUT_MAX];
	char data[LINE_INPUT_MAX];
	char TempFileName[MAX_FILENAME+1];
	int	Status=true;
	int	Updated=false;
	int	InSection=false;
	int	BlankLines=0;

	if (!CreateTempFileName(TempFileName))
	{
		//DumpDebug("Unable to create	a temporary	filename to	update
		//	%s\n",FileName);
		return false;
	}

	NewCfgFile=fopen(TempFileName,"w");
	if (NewCfgFile==NULL)
	{
		//DumpDebug("Unable to open a	temporary file to update
		//	%s\n",TempFileName);
			return false;
	}

	sprintf(SectionWanted,"[%s]",SectionName);

	CfgFile=fopen(FileName,"r");
	if (CfgFile)
	{
		while (ReadLine(CfgFile,line))
		{
			if (StrEqIC(line,SectionWanted)) InSection=true;
			else if	(InSection && (line[0]=='['))
			{/*	leaving	our	section	*/
				InSection=false;
				if (!Updated) /* Variable wasn't found,	we have	to add it
							  */
				{
					fprintf(NewCfgFile,"%s = %s\n",VarWanted,NewData);
					while (BlankLines)
					{fprintf(NewCfgFile,"\n");BlankLines--;}
					Updated=true;
				}
			}
			if (line[0]=='\0') BlankLines++;
			else
			{
				while (BlankLines) {fprintf(NewCfgFile,"\n");BlankLines--;}
				ParseLine(line,var,data);
				if (InSection && StrEqIC(var,VarWanted)	&& !Updated)
				{
					fprintf(NewCfgFile,"%s = %s\n",var,NewData);
					Updated=true;
				}
				else fprintf(NewCfgFile,"%s\n",line);
			}
		}
	}

	/*
	** Our section may not have	even been there	(or	there wasn't already
	** a config	file) in which case	we have	to add both	the	variable and
	** the section itself.
	*/
	if (!Updated)
	{  /* We may have hit EOF while	still in our section. */
		/* If so, we don't need	to add the section header. */
		if (!InSection)
		{
			if (BlankLines!=0) fprintf(NewCfgFile,"\n");
			fprintf(NewCfgFile,"%s\n",SectionWanted);
		}
		fprintf(NewCfgFile,"%s = %s\n",VarWanted,NewData);
	}

	fprintf(NewCfgFile,"\n");

	if (CfgFile	&& ferror(CfgFile))	   
		Status=false;

	if (ferror(NewCfgFile))	
		Status=false;

	if (CfgFile) 
		fclose(CfgFile);

	fclose(NewCfgFile);

	if (!Status) 
		remove(TempFileName);
	else
	{/*if (remove(FileName)) return	false;*/
		remove(FileName);
		if (rename(TempFileName,FileName)) 
			return false;
	}

	return Status;
}


/*
** Find	a VarName within SectionName in	file FileName.
** Return true on success, else	false
*/
static int FindCfgLine(char *FileName,char	*SectionName, char *VarName, char *Data)
{
	FILE *CfgFile;
	char line[LINE_INPUT_MAX];
	char SectionWanted[LINE_INPUT_MAX];
	char var[LINE_INPUT_MAX];
	int	InSection=false;

	CfgFile=fopen(FileName,"r");
	if (CfgFile==NULL)
	{
//		DumpDebug("File	%s not found.\n",FileName);
		return false;
	}

	sprintf(SectionWanted,"[%s]",SectionName);

	while (ReadLine(CfgFile,line))
	{
		if (StrEqIC(line,SectionWanted))		
			InSection=true;
		else if	(InSection && (line[0]=='[')) 
			InSection=false;

		if (InSection)
		{
			ParseLine(line,var,Data);
			if (StrEqIC(VarName,var))
			{
				fclose(CfgFile);
				return true;
			}
		}
	}

	fclose(CfgFile);
	*Data='\0';
	return false;
}


/*
** Reads item(s) from a	.ini / .cfg	file.
** Returns 0 on	failure, else the number of	items read.
** If the items	read don't match the items wanted (MAxItems), then
** something may be	wrong and the variable may be only partially
** initialized.
*/
unsigned int hjReadCfgItem(char *FileName,char	*SectionName, char *VarName,
			void *DataPtr, enum	CfgVarTypes	DataType,
			unsigned int MaxItems)
{
	unsigned int ItemsRead=0;
	char Str[LINE_INPUT_MAX];
	char *Token;

	if (MaxItems==0) 
		return	0;	/* Got to have something to	read */

	if (!FindCfgLine(FileName, SectionName,	VarName, Str))
	{
		//DumpDebug("File=%s Sect=%s Var=%s Data=	**NOT FOUND**\n",
		//	FileName,SectionName,VarName);
		return 0;
	}

	/*
	** Found the line we wanted, now convert the string	to
	** the data	format we want.
	*/
	if (DataType==Cfg_String)
	{
		if (MaxItems==0) 
			return	0;

		if (strlen(Str)	>= MaxItems) 
			Str[MaxItems-1]='\0';

		strcpy((char*)DataPtr,Str);
		//DumpDebug("File=%s Sect=%s Var=%s Data=%s\n",
		//	FileName,SectionName,VarName,DataPtr);
		return MaxItems;
	}

	Token=strtok(Str," ,\t");

	while (	(ItemsRead < MaxItems) && (Token !=	NULL))
	{
		char *EndChar;
		//DumpDebug("Token=%s\n",Token);
		switch (DataType)
		{
			case Cfg_Integer:
				{long int x;
				x=strtol(Token,&EndChar,10);
				if (tolower(*EndChar)=='k')	x*=1024;
				if (tolower(*EndChar)=='m')	x*=1048576;
				if (tolower(*EndChar)=='g')	x*=(1024*1048576);
				if (x <	INT_MIN) x=INT_MIN;
				if (x >	INT_MAX) x=INT_MAX;
				*((int*)DataPtr)=(int)x;
				//DumpDebug("File=%s Sect=%s Var=%s Data=%d\n",
				//	FileName,SectionName,VarName,*((int*)DataPtr));
				DataPtr=((char*)DataPtr)+sizeof(int);
				break;
				}
			case Cfg_UInteger:
				{unsigned long int x;
				x=strtoul(Token,&EndChar,10);
				if (tolower(*EndChar)=='k')	x*=1024;
				if (tolower(*EndChar)=='m')	x*=1048576;
				if (tolower(*EndChar)=='g')	x*=(1024*1048576);
				if (x >	INT_MAX) x=INT_MAX;
				*((unsigned	int*)DataPtr)=(unsigned	int)x;
				//DumpDebug("File=%s Sect=%s Var=%s Data=%u\n",
				//	FileName,SectionName,VarName,*((unsigned
				//	int*)DataPtr));
				DataPtr=((char*)DataPtr)+sizeof(unsigned int);
				break;
				}
			case Cfg_SInteger:
				{long int x;
				x=strtol(Token,&EndChar,10);
				if (tolower(*EndChar)=='k')	x*=1024;
				if (tolower(*EndChar)=='m')	x*=1048576;
				if (tolower(*EndChar)=='g')	x*=(1024*1048576);
				if (x <	SHRT_MIN) x=SHRT_MIN;
				if (x >	SHRT_MAX) x=SHRT_MAX;
				*((short int*)DataPtr)=(short int)x;
				//DumpDebug("File=%s Sect=%s Var=%s Data=%hd\n",
				//	FileName,SectionName,VarName,*((short
				//	int*)DataPtr));
				DataPtr=((char*)DataPtr)+sizeof(short int);
				break;
				}
			case Cfg_USInteger:
				{unsigned long int x;
				x=strtoul(Token,NULL,10);
				if (tolower(*EndChar)=='k')	x*=1024;
				if (tolower(*EndChar)=='m')	x*=1048576;
				if (tolower(*EndChar)=='g')	x*=(1024*1048576);
				if (x >	USHRT_MAX) x=USHRT_MAX;
				*((unsigned	short int*)DataPtr)=(unsigned short	int)x;
				//DumpDebug("File=%s Sect=%s Var=%s Data=%hu\n",
				//	FileName,SectionName,VarName,*((unsigned short
				//	int*)DataPtr));
				DataPtr=((char*)DataPtr)+sizeof(unsigned short int);
				break;
				}
			case Cfg_LInteger:
				{long int x;
				x=strtol(Token,&EndChar,10);
				if (tolower(*EndChar)=='k')	x*=1024;
				if (tolower(*EndChar)=='m')	x*=1048576;
				if (tolower(*EndChar)=='g')	x*=(1024*1048576);
				*((long	int*)DataPtr)=x;
				//DumpDebug("File=%s Sect=%s Var=%s Data=%ld\n",
				//	FileName,SectionName,VarName,*((long
				//	int*)DataPtr));
				DataPtr=((char*)DataPtr)+sizeof(long int);
				break;
				}
			case Cfg_ULInteger:
				{unsigned long int x;
				x=strtoul(Token,&EndChar,10);
				if (tolower(*EndChar)=='k')	x*=1024;
				if (tolower(*EndChar)=='m')	x*=1048576;
				if (tolower(*EndChar)=='g')	x*=(1024*1048576);
				*((unsigned	long int*)DataPtr)=x;
				//DumpDebug("File=%s Sect=%s Var=%s Data=%lu\n",
				//	FileName,SectionName,VarName,*((unsigned long
				//	int*)DataPtr));
				DataPtr=((char*)DataPtr)+sizeof(unsigned long int);
				break;
				}
			case Cfg_Boolean:
				*((int*)DataPtr)=false;
				if ((tolower(*Token)=='y') || (tolower(*Token)=='t'))
					*((int*)DataPtr)=true;
				//DumpDebug("File=%s Sect=%s Var=%s Data=%c\n",
				//	FileName,SectionName,VarName,*((int*)DataPtr)?'T':'F');
				DataPtr=((char*)DataPtr)+sizeof(int);
				break;
			case Cfg_Bytes:
				*((unsigned	char*)DataPtr)=(unsigned char)atoi(Token);
				//DumpDebug("File=%s Sect=%s Var=%s Data=%d\n",
				//	FileName,SectionName,VarName,*((unsigned
				//	char*)DataPtr));
				DataPtr=((char*)DataPtr)+sizeof(unsigned char);
				break;
			default: return	0;
		}
		ItemsRead++;
		Token=strtok(NULL,"	,\t");
	}
	
	return ItemsRead;
}


/*
** Update	an item	in a .ini /	.cfg file.
** Returns 0 on failure, else	the	number of items	written.
*/
unsigned int hjUpdateCfgItem(char *FileName,char *SectionName,char	*VarWanted,
			  void *DataPtr, enum CfgVarTypes DataType,	unsigned int HowMany)
{
	char *Str;

	if (HowMany==0)	return 0; /* Got to	have something to write. */
	Str=(char*)malloc(1);*Str='\0';

	if (DataType==Cfg_String)
	{
		Str=StrAdd(Str,(char*)DataPtr);
		/* Need	to do max len */
	}
	else
	{
		char TStr[45];
		unsigned int NumItems=HowMany;
		while (NumItems--)
		{
			TStr[0]='\0';
			switch (DataType)
			{
				case Cfg_Integer:
					sprintf(TStr,"%d",*((int*)DataPtr));
					DataPtr=((char*)DataPtr)+sizeof(int);
					break;
				case Cfg_UInteger:
					sprintf(TStr,"%u",*((unsigned int*)DataPtr));
					DataPtr=((char*)DataPtr)+sizeof(unsigned int);
					break;
				case Cfg_SInteger:
					sprintf(TStr,"%hd",*((short	int*)DataPtr));
					DataPtr=((char*)DataPtr)+sizeof(short int);
					DataPtr=((char*)DataPtr)+sizeof(int);
					break;
				case Cfg_USInteger:
					sprintf(TStr,"%hu",*((unsigned short int*)DataPtr));
					DataPtr=((char*)DataPtr)+sizeof(unsigned short int);
					break;
				case Cfg_LInteger:
					sprintf(TStr,"%ld",*((long int*)DataPtr));
					DataPtr=((char*)DataPtr)+sizeof(long int);
					break;
				case Cfg_ULInteger:
					sprintf(TStr,"%lu",*((unsigned long	int*)DataPtr));
					DataPtr=((char*)DataPtr)+sizeof(unsigned long int);
					break;
				case Cfg_Boolean:
					strcpy(TStr,"false");
					if (*((int*)DataPtr)) strcpy(TStr,"true");
					DataPtr=((char*)DataPtr)+sizeof(int);
					break;
				case Cfg_Bytes:
					sprintf(TStr,"%u",*((unsigned char*)DataPtr));
					DataPtr=((char*)DataPtr)+sizeof(unsigned char);
					break;
				default: free(Str);return 0;
			}
			Str=StrAdd(Str,TStr);
			if (NumItems) 
				Str=StrAdd(Str,",	");
		}
	}

	if (Str==NULL) 
		return 0;
	else
	{
		int x;
		x=UpdateCfgStr(FileName,SectionName,VarWanted,Str);
		free(Str);
		if (!x)	
			return 0;
		else 
			return	HowMany;
	}
}


int hjLoadConfigStruct(char *FileName, struct CfgNameStruct *mv)
{
	while (mv->Name)
	{
		unsigned int x;
		x= hjReadCfgItem(FileName,mv->Section, mv->Name, mv->DataPtr,mv->VarType,mv->Max);
		if ((x!=0) && (x!=mv->Max))
		{
			fprintf(stderr,"In file	'%s', section [%s] var:	'%s'",
				FileName,mv->Section,mv->Name);
			fprintf(stderr," should	have held %u items but there were only %u.\n",
				mv->Max,x);
			return false;
		}
		mv++;
	} 
	return true;
}
