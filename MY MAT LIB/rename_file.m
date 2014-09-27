clc;

%%
DIR = 'D:\STUDY\[1] 图像处理\算法视频样本20130712（IMVL版）(50秒版)\453 灰尘过多\';
EXT = '.avi';
FILES = dir([DIR,'*',EXT]);
FILENUM = size(FILES,1);
START = 1;
END = FILENUM;

for  i = START:END
    filename = FILES(i,1).name;
    % FileName will be 'newName'.mp3.
    %   Rename the file: it will move the file, 
    %   rather than duplicate the file
    newName = ['453_00',num2str(i)];
    movefile([DIR,filename],[DIR,newName,EXT],'f');
end
