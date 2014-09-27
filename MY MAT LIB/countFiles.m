function countFiles()
clear all;
clc;
%%
src = 'D:\¹ýÂËº£¿µ2\';
ext = 'bmp';

%%
fileCount = 0 ;
fs = dir(src) ;
fid = 0;

for i = 3 : length(fs)
    
    nowPath = [src, fs(i).name]
    files = dir(fullfile(nowPath, ['*.', ext]));
    for j =1 : length(files)
        
        fileCount = fileCount + 1;
        nameLength = length( files(j).name );
        filename = files(j).name;
        fid = fopen( 'data', 'A' );
        while(str2num( filename(1:nameLength - 4) ) ~= fileCount )
            
            fprintf(fid, '%s-%s\n', src, files(j).name);
            fprintf(fid, '%s\n', num2str(fileCount));
            fileCount = fileCount + 1
        
        end       
        fclose(fid);
        
    end
    
end

end