set_startup;

%%
%FILEDIR = 'D:\Study\Í¼Ïñ\Ëã·¨ÊÓÆµÑù±¾20130712£¨IMVL°æ£©(50Ãë°æ)\18 ÒìÎïÕÚµ²\Ê÷Ò¶ÕÚµ²\';
FILEDIR = 'D:\pic\aa\';
FILES = dir(fullfile(FILEDIR,'*.avi'));
FILENUM = size(FILES,1);

START = 1;
END = 60;

%%
for  i = START:END
    filename=FILES(i,1).name;
    aviObj = mmreader([FILEDIR,filename]);
    rgb=read(aviObj, 50);
    imshow(rgb);
    
%     flag =['Now Processing: ', filename ]; disp(flag); 
%     
%     tStart = ...
%     tic;
%    
%     [ratio] = LeafDetection(rgb, filename);
%     
%     tElapsed = ...
%     toc(tStart);
%     
%     flag =['Estimated Result is: ', num2str(tElapsed), 'seconds']; disp(flag); 
%     
    pause();
end
