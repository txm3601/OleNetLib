src = 'D:\6月18日武汉市局海康截图\2\CapPic\';
dst = 'D:\6月18日武汉市局海康截图\2\CapPic\';
ext = 'bmp'
files = dir(fullfile(src, ['*.', ext]));
l = length(files);
step = 14;
folderno = 1;
for i = 11 : step : l
    % toMoveFiles = files( i : i+step-1 );
    dstFolder = [dst, num2str(folderno),'\'];
    if ~exist(dstFolder, 'dir')
        mkdir(dstFolder);
    end
    
    for j = 0 : step-1
        filename = [num2str(i+j), '.', ext];
        movefile([src, filename ], [dstFolder, filename]);        
    end
    folderno = folderno + 1
end
