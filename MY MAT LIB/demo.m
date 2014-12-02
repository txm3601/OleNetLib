set_startup;

%%
FILEDIR = 'D:\ENTERTAINMENT\PHOTO\±ÚÖ½\';
FILES = dir(fullfile(FILEDIR,'*.jpg'));
FILENUM = 99;
START = 1;
END = 99;
SHOWFLAG = 1;

%%
for i = START:END
    filename = FILES(i,1).name; 
    img = imread([FILEDIR, filename]) ;
    
    flag =['Now Processing: ', filename ]; disp(flag);
    bat_crop(img, filename);
    flag =['Estimated Parameter is: ']; disp(flag);
end