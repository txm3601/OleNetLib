function [ output_args ] = hsv_hist( I )
%HSV_HIST Summary of this function goes here
%   Detailed explanation goes here
%%
SHOWFLAG = 0;

%%
r = I(:,:,1);
g = I(:,:,2);
b = I(:,:,3);
grayImg = rgb2gray(I);

level = graythresh(grayImg);
BW = im2bw(grayImg,level);
se = strel('disk',5);
erodedBW = imerode(BW,se);
segI1C = g .* uint8(~erodedBW);

hsv_image = rgb2hsv(I);
%imshow(hsv_image);
hsv = hsv_image;
figure(100);
imhist(hsv(:,:,1));

figure(101);
subplot(231);imshow(I);title('origin');
subplot(232);imshow(hsv);title('hsv');
subplot(234);plot(imhist(hsv(:,:,1)),'r');axis([0 360 0 20000]);title('hue');
subplot(235);plot(imhist(hsv(:,:,2)),'y');axis([0 360 0 10000]);title('satuation');
subplot(236);plot(imhist(hsv(:,:,3)),'y');axis([0 360 0 10000]);title('value');
%imhist(hsv(:,:,3));title('b');


%%
if (SHOWFLAG)
    figure(101);   
    subplot(221);imshow(I);title('orign');
    subplot(222);imshow(erodedBW);title('morph');
    subplot(223);imshow(segI1C);title('seg');
    figure(102);
    plot(imhist(segI1C),'g');axis([0 255 0 4000]);title('g:hist');
end
pause();

end
