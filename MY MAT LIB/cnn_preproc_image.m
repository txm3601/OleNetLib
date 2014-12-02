src = 'D:/STUDY/[1] Í¼Ïñ´¦Àí/ÊÓÆµ¿â 4.1_Í¼Ïñ¿â/';
dst = 'D:/STUDY/[1] Í¼Ïñ´¦Àí/resizeÍ¼Æ¬¿â/';
ext = 'bmp'
folders = dir(src);

 
% i begin with 3 to skip . and ..
for i = 3 : length(folders)
    files = dir(fullfile([src folders(i).name], ['*.', ext]));

    if isempty(files)
        continue;
    end
    
    dstFolder = [dst folders(i).name '/'];

    for j = 1 : length(files)
        [pathstr,name,fileext]  = fileparts(files(j).name);
        image_fullpath = [src folders(i).name '/' files(j).name];
        image = imread(image_fullpath);  
        image_re = imresize(image, [28 28]);
        if ~exist(dstFolder, 'dir')
            mkdir(dstFolder);   
        end
        dst_file_name = [name '.bmp'];
        imwrite(image_re, dst_file_name);
        movefile(dst_file_name, [dstFolder dst_file_name]);
        display([num2str(j), 'finished generate the screenshot ', dst_file_name,...
            ' from ', folders(i).name,...
            ' to ', dstFolder]);
    end

end