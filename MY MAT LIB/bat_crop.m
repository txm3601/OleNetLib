function bat_crop(img, filename)
%%
[imcroped rect] = imcrop(img);
imcroped = imcroped;
newName = [filename,'.bmp'];
if ~isempty(imcroped)
    imwrite(imcroped, newName, 'bmp');
    newDir = '.\leaf\';
    if ~exist(newDir)
        mkdir(newDir);
    end
    movefile(newName, newDir,'f');
end
end