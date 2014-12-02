#-*- coding:utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
#你好
dir = u"C:\\Users\\asus-pc\\Desktop\\lib\\日志.txt";
content = open(dir).read()
print content.decode("gbk").encode("utf-8")