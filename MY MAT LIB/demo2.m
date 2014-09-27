set_startup;

%%
FILEDIR = 'D:\STUDY\Ð¡³ÌÐò\TestProj4.62\writeBMP2Video\';

FILES = dir(fullfile(FILEDIR,'*.avi'));
FILENUM = size(FILES,1);
START = 1;
END = 200;
SHOWFLAG = 1;
WRITEFLAG = 0;
CUTFLAG = 0;

%%
for  i = START:END
    filename=FILES(i,1).name; 
    aviObj = mmreader([FILEDIR,filename]);
    
    flag =['Now Processing: ', filename ]; disp(flag);  
    YourCoreFunction(aviObj, filename, SHOWFLAG, WRITEFLAG, CUTFLAG,i);   
    flag =['Estimated Parameter is: ']; disp(flag);
end
