set_startup;

%%
FILEDIR = 'D:\STUDY\[1] Í¼Ïñ´¦Àí\ÊÓÆµ¿â 4.0\0019 Ê÷Ò¶ÕÚµ²\Imgs\LeafImg\my\';

FILES = dir(fullfile(FILEDIR,'*.bmp'));
FILENUM = size(FILES,1);
START = 1;
END = 500;
SHOWFLAG = 1;
WRITEFLAG = 0;
CUTFLAG = 0;

%%
for  i = START:END
    filename=FILES(i,1).name; 
    currFrame = imread([FILEDIR,filename]);
    
    flag =['Now Processing: ', filename ]; disp(flag);  
    %     currFrame = read(aviObj, 1);
    %     currFrame = flipud(currFrame);
    bat_crop(currFrame, filename);
    %imwrite(currFrame, [filename, '.bmp'], 'bmp');

    flag =['Estimated Parameter is: ']; disp(flag);
end
