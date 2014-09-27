#include  <afx.h> 	
#include <iostream>
#include <iomanip>
#include <stdio.h>
#include <fstream>
#include "fileinidll.h"
#include "DEMO.h"

#define FILENUMMAX           (1000)
#define MAX_FILEPATH         (1000)
#define STRCAT(a, b, c)      {strcpy(c,b); strcat(c, a); strcpy(a,c);}  //a =a+b;
#define NUM					 (5)//注意和算法里面的NUM 同步


static char DEMO_TITLE[MAX_FILEPATH];
static char VIDEO_SAVERESULT[MAX_FILEPATH];
static char g_name[MAX_FILEPATH];
static char g_fullname[MAX_FILEPATH];
static int  g_fileNUM = 0;
static char g_filePath[FILENUMMAX][MAX_FILEPATH];

static void write_data(int* data);
static int judgeBMPName(CString filename);
static void AddListData(CString folderpath);


static int judgeBMPName(CString filename)
{
	int ret;
	
	TCHAR IMAGEFILTER1[] =_T(".cpp");
	TCHAR IMAGEFILTER2[] =_T(".CPP");
	CString m1 = filename.Right(4);
	if ((m1.CompareNoCase(IMAGEFILTER1) == 0) || (m1.CompareNoCase(IMAGEFILTER2) == 0))
		ret = 1;
	else 
		ret = 0;
	
	return ret;
}


static void AddListData(CString folderpath)
{
	CString PathName = folderpath + "\\*.*";
	CFileFind Finder;
	CString loadimgPath;
	
	g_fileNUM = 0;
	BOOL bWorking = Finder.FindFile(PathName);
	while (bWorking)
	{
		bWorking = Finder.FindNextFile();
		if (Finder.IsDots())
			continue;
		
		if (Finder.IsDirectory())
			continue;
		
		loadimgPath = Finder.GetFileName();
		if(judgeBMPName(loadimgPath) && g_fileNUM < FILENUMMAX)
		{
			strcpy(&(g_filePath[g_fileNUM][0]), loadimgPath.GetBuffer(loadimgPath.GetLength())); 
			g_fileNUM++;
		}
		else
		{
			continue;
		}	
	}
	Finder.Close();
}

static void write_data(CString name,int* data)
{

	FILE *fout = fopen("..\\_bin\\data.dat","a+"); 
	int i=0;

	fprintf(fout,"%s\t",name);
	while(i<NUM)
	{
		fprintf(fout,"%d:%d\t",i,*(data+i));
		i++;
	}
	fprintf(fout,"\n");
	fclose(fout);
}
void main()
{
	char* FILEDIR="..";	
	int nFrames = 300;
	const int N = 3;
	int index;
	int *ret =(int*)malloc(sizeof(int)*NUM);
	AddListData(FILEDIR);
	SetDir(g_fullname);
	
	index=0;
	while (1)
	{	
		if(g_filePath[index][0]!='\0') 
		{
			strcpy(g_name, g_filePath[index]);
			strcpy(g_fullname, g_name);
			SetDir(g_fullname);
			printf("now is processing %s\n", g_name);
					
			//write_data(g_name,ret);
		}
		else
		{
			break;
		}
		index++;
	}
}
