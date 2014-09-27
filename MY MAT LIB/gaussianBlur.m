clc
im = imread('D:\STUDY\[1] 图像处理\模糊度检测\工作日志\20140619\Top10\outdoorTop1 300_0062.bmp');

w2 = fspecial('gaussian', [5,5], 2);
w3 = fspecial('gaussian', [10,10], 4);
w4 = fspecial('gaussian', [20,20], 8);

gm2 = imfilter(im, w2);
gm3 = imfilter(im, w3);
gm4 = imfilter(im, w4);

handle = figure(1);
imshow(im);

% handle = figure(101);
% subplot(221);imshow(gm1);
% subplot(222);imshow(gm2);
% subplot(223);imshow(gm3);
% subplot(224);imshow(gm4);
% set(handle, 'Name','IMVL Debug Window','NumberTitle','off','position', get(0,'ScreenSize'));

imwrite(gm2, 'gm2.bmp', 'bmp');
imwrite(gm3, 'gm3.bmp', 'bmp');
imwrite(gm4, 'gm4.bmp', 'bmp');
