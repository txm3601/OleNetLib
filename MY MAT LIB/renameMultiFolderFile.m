function [ output_args ] = renameMultiFolderFile( pth )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if nargin == 0
    pth = 'D:\temp\';
end

fs = dir(pth) ;

for i = 3 : length(fs) % skip . and ..
    subf = [pth, fs(i).name, '\'];
    files = dir ( fullfile(subf, ['*.', 'bmp']) );
    [pathstr, name, ext] = fileparts(files);
    
    if isempty( ext )
         reNameFile(pathstr, name, '.bmp');
    else
        for j =1 : length(files)
            
            filename = files(j).name
            nameLength = length( filename );
            %nameNotExt = filename(1:nameLength - 4);
            
            reNameFile(subf, nameNotExt, '.bmp');
            
        end
        
    end
    
    
end

end

