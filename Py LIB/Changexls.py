#!/usr/bin/python
# -*- coding: utf-8 -*-
import xlrd
from pyExcelerator import *
import ConfigParser
import os
import os.path

#get the .ini file information
config = ConfigParser.ConfigParser()
config.read("TestConfig.ini")

src = config.get("file_path","src")
dst = config.get("file_path","dst")
template = config.get("file_path","template")

def open_excel(file):
    try:
        data = xlrd.open_workbook(file)
        return data
    except Exception,e:
        print str(e)
        
#.xls file conversion
def convertfile(filefullpath):
    #source file compare with template file and return the index
    def getIndex(src_class,template_classes):
        for i in range(1,len(template_classes)):
            if src_class == template_classes[i]:
                return i
        print src_class+"does not exist! Check it again!"

    rfile=open(filefullpath,'r')
    data = open_excel(template)
    table = data.sheets()[0]
    template_classes = table.row_values(0)

    dst_xlsfile_line = {}
    content = []
    content.append(template_classes)
    isFirstLine = True;
    lineno = 0
    
    while 1:
        line = rfile.readline().decode('gbk')
        if not line:
            content.append(dst_xlsfile_line)
            break
        if lineno < 2:
            lineno = lineno+1
            continue

        values = line.rsplit('\t',7)
        src_filename = values[2]
        src_class = values[3]
        src_value = values[4]

        if isFirstLine:
            dst_xlsfile_line[0] = src_filename
            isFirstLine = False
            for i in range(1,len(template_classes)):
                dst_xlsfile_line[i] = 'N/A'

        if dst_xlsfile_line[0] == src_filename:
            isSameFile = True
        else:
            isSameFile = False

        if isSameFile:
            id = getIndex(src_class,template_classes)
            dst_xlsfile_line[id] = src_value
        else: # process next file
            content.append(dst_xlsfile_line)
            dst_xlsfile_line = {}
            dst_xlsfile_line[0] = src_filename
            for i in range(1,len(template_classes)):
                dst_xlsfile_line[i] = 'N/A'
            id = getIndex(src_class,template_classes)
            dst_xlsfile_line[id] = src_value

    return content
    
#get all the files in the directory
def getfilelist(file_path):
    c = os.listdir(file_path)
    return c
    
#Creat a directory to save file
def mkdir(dst):
    dst = dst.strip()
    dst = dst.rstrip("\\")
    isExists=os.path.exists(dst)
    if not isExists:
        print dst+'\t'+'has been created successfully'
        os.makedirs(dst)
        return dst
    else:
        print dst+'\t'+'has been already exist'
        return dst

def main():
   filelist = getfilelist(src)
   for k in range(0,len(filelist)):
       f,ext = os.path.splitext(filelist[k])
       if ext != '.xls':
           continue

       print "processing"+'\t'+filelist[k].decode('gbk')
       content = convertfile(src+'\\'+filelist[k])
       wb = Workbook()
       ws = wb.add_sheet('sheet1')
       j = 0
       for row in content:
           if row:
              for i in range(len(row)):
                  c = row[i]
                  ws.write(j,i,c)
              j = j+1
       #split path and filename suffixes
       f,ext = os.path.splitext(filelist[k])
       #create directory
       dstpath = mkdir(dst)
       #save the file in the specified path
       wb.save(dstpath+'\\'+f+'.xls')
       #output the information of the saved files
       print filelist[k].decode('gbk')+'  '+'results are saved in'+'\t'+dstpath

if __name__=="__main__":
    main()
    raw_input('Enter any key to exit')
