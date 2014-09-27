

static int judgeBMPName(CString filename)
{
	int ret;
	
	TCHAR IMAGEFILTER1[] =_T(".avi");
	TCHAR IMAGEFILTER2[] =_T(".AVI");
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