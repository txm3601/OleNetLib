# -*- coding: cp936 -*-
import os
import sys
dir = 'D:\\STUDY\\C\\TestProj\\Release\\pictest\\'
ext = '.bmp';

list_file = os.listdir(dir)

i=1;
for filename in list_file:
    filenameold = dir+filename;
    filenamenew = dir+str(i)+ext;
    print filenameold,filenamenew
    os.rename(filenameold, filenamenew);
    print 'oldname:'+filename
    i=i+1
