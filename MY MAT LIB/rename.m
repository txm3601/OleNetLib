function [ output_args ] = rename( pth )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if nargin == 0
pth = 'D:\¹ýÂË°æ±¾º£¿µ£¨1£©\';
end

fs = dir(pth) ;

for i = 3 : length(fs) % skip . and ..
    subf = [pth, fs(i).name, '\'];
    files = dir ( fullfile(subf, ['*.', 'bmp']) );

    for j =1 : length(files)
        
        filename = files(j).name
        nameLength = length( filename );
        nameNotExt = filename(1:nameLength - 4);
        
        n = length( nameNotExt );
        switch n
            case 1
                newName = ['0000', filename];
            case 2
                newName = [ '000', filename];
            case 3
                newName = [  '00', filename];
            case 4
                newName = [   '0', filename];
            case 5
                newName = [        filename];
            otherwise               
                newName = filename;
        end
       
        if ~strcmp(newName , filename)
            movefile([subf, filename], [subf, newName]);
        end
    end
       
end

end

