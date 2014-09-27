function [] = copyvideo(FILEDIR, FILES)
%%
DSTDIR = 'D:\temp\'
%%
fid = fopen('result.dat');
C = textscan(fid, '%s\t%f');
[lenth ~] = size(C{1});

for i=1:lenth
    str = C{1}{i};
    index = str(6:9);
    index = str2num(index);
    filename = FILES(index,1).name;
    movefile([FILEDIR,filename],[DSTDIR,filename],'f');
end
fclose(fid);
end
