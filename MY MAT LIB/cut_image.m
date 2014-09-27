function  cut_image(aviObj, filename,i)

%%
DST_DIR = '.'; 

%%
img = read(aviObj, i);
%img = imresize(img, [288 352]);
imwrite(img, [filename, num2str(i), '.bmp'], 'bmp');

end

