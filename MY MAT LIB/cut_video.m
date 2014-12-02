%function cut_video
%%
set_startup;

%%
%FILEDIR = '..\video\测试视频样本1（混合类型2013版）\';
FILEDIR = 'D:\TDDOWNLOAD\GDown\473\473\';
FILEEXT = '.avi';
START = 1;
SHOWFLAG = 1;
FRAMES=80;

%%
for i =1:1
    % FILEDIR1 = [FILEDIR, num2str(i),'\',]
    FILES = dir(fullfile(FILEDIR,'*.avi'));
    FILENUM = size(FILES,1);
    for  j = START:FILENUM
        filename=FILES(j,1).name;
        aviObj = VideoReader([FILEDIR1, filename]);
        flag =['Now Processing: ', filename ]; disp(flag);
        vidObj = VideoWriter(['D:\STUDY\New Video\',filename]);
        open(vidObj);
        for k = 1:FRAMES
            currFrame = read(aviObj, j);
            writeVideo(vidObj,currFrame);
        end
        close(vidObj);
        flag =['Finished Mission: ', filename ]; disp(flag);
    end  
end
