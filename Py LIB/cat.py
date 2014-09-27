# -*- coding: utf-8 -*-
'''
Cat file script

@ author：   LJX
@ version：  1.0
@ how to use:
    step1: 将本文件放入enw文件所在路径，双击，生成cat.enw。
    step2: endnote直接导入cat.enw即可
'''
import os
import sys 
import time

dir = 'D:\\TDDOWNLOAD\\GDown\\enw'
dst_file="cat.enw"
ext = '.enw'

docList = os.listdir(dir)
docList.sort()

fname = open(dst_file, "w") 
for i in docList:
    if os.path.splitext(i)[1] == ext:
        print i 
        x = open (i ,  "r")
        fname.write(x.read()+'\n') 
        x.close()

fname.close()
