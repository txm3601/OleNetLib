function [ newName ] = makeName( oldName )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
filename = oldName;
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

end

