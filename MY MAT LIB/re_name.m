function [ filename ] = reName( FILEDIR, filename, FILEEXT )
%%最多支持9999个视频

%%
 n = length( nameNotExt );
switch n
   case 1
     newName = [FILEDIR, '0000', filename];
   case 2
     newName = [FILEDIR,  '000', filename;
   case 3
     newName = [FILEDIR,   '00', filename;
   case 4
     newName = [FILEDIR,    '0' filename];
   case 4
     newName = [FILEDIR,        filename];
   otherwise
      disp('Unknown name.')
end

if ~strcmp(newName , filename)
    movefile([FILEDIR, filename], [FILEDIR, newName]);
end

end

