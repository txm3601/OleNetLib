%%
set_startup;
mydir=uigetdir('c:','选择一个目录');
DIRS=dir(mydir);
ROOTDIR = 'D:\Study\图像\算法视频样本20130712（IMVL版）(50秒版)\';      

n=length(DIRS);
for i=23:n
    if (DIRS(i).isdir && ~strcmp(DIRS(i).name,'.') && ~strcmp(DIRS(i).name,'..') )                
        FILEDIR  = DIRS(i).name;
        DIR=[ROOTDIR, FILEDIR,'\'];
        FILES = dir(fullfile(DIR,'*.avi'));
        FILENUM = size(FILES,1);
        START = 1;
        END = FILENUM;     
  
        for  j = START:END
            filename=FILES(j,1).name;
            aviObj = mmreader([DIR,filename]);
            rgb=read(aviObj,1);
            %rgb=imread([FILEDIR,filename]);
            flag =['Now Processing: ', filename ]; disp(flag);
            [ratio] = LeafDetection(rgb, filename);
            flag =['Estimated Parameter is: ']; disp(flag);
            %pause();
        end      
    end
end