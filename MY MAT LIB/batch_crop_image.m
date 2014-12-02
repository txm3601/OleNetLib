src = 'T:/视频库整理/视频库 4.1/';
dst =  'D:/STUDY/[1] 图像处理/视频库 4.1_图像库/';
ext = 'avi';
folders = dir(src);

% files = dir(fullfile(src, ['*.', ext]));
% l = length(files);
% step = 14;
% folderno = 1;

% i begin with 3 to skip . and ..
for i = 5 : length(folders)
    files = dir(fullfile([src folders(i).name], ['*.', ext]));
    
    if isempty(files)
        continue;
    end
    
    dstFolder = [dst folders(i).name '/'];
    
    for j = 1 : length(files)
        [pathstr,name,fileext]  = fileparts(files(j).name);
        avi_obj = VideoReader([src folders(i).name '/' files(j).name]);
        image = read(avi_obj, 1); 
        if getversion == 8.3 % prevent matlab 2014a's bug
            image = flipud(image);
        end
        if ~exist(dstFolder, 'dir')
            mkdir(dstFolder);   
        end
        dst_file_name = [name '.bmp'];
        imwrite(image, dst_file_name);
        movefile(dst_file_name, [dstFolder dst_file_name]);
        display([num2str(j), 'finished generate the screenshot ', dst_file_name,...
            ' from ', folders(i).name,...
            ' to ', dstFolder]);
    end
    
    

end
