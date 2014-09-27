function [  ] = reNameFile( FILEDIR, nameNotExt, FILEEXT )
%%最多支持9999个视频

%%
 n = length( nameNotExt );
switch n
   case 1
     newName = [FILEDIR, '0000', nameNotExt, FILEEXT];
   case 2
     newName = [FILEDIR,  '000', nameNotExt, FILEEXT];
   case 3
     newName = [FILEDIR,   '00', nameNotExt, FILEEXT];
   case 4
     newName = [FILEDIR,    '0' nameNotExt, FILEEXT];
   case 5
     newName = [FILEDIR,        nameNotExt, FILEEXT];
   otherwise
      disp('Unknown name.')
end

if ~strcmp(newName , filename)
    movefile([FILEDIR, filename], [FILEDIR, newName]);
end

end

