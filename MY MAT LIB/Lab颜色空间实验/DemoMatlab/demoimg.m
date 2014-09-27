%%
%FILEDIR = 'D:\Study\Í¼Ïñ\Ê÷Ò¶¼ì²â\Ò¶×ÓÍ¼Æ¬\';
FILEDIR = 'C:\Users\Administrator\Desktop\';
FILES = dir(fullfile(FILEDIR,'*.bmp'));
FILENUM = size(FILES,1);
START = 1;
END = 99;

%%
for  i = START:END
    filename=FILES(i,1).name; 
    rgb=imread([FILEDIR,filename]);
    flag =['Now Processing: ', filename ]; disp(flag);  
    %lab1(rgb);
    lab2(rgb);
    %histImg(rgb) ;
    flag =['Estimated Parameter is: ']; disp(flag);
    pause();
end