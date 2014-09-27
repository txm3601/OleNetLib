function [] = qurd_hist( I )
%QURD_HIST Summary of this function goes here
%   Detailed explanation goes here
% 1 2 
% 3 4
%%
level = graythresh(I);
BW = im2bw(I,level);
G=I(:,:,3);
G = G.* uint8(~BW);
[height width] = size(G);
I1 = G(1:height/2, 1:width/2);  
I2 = G(1:height/2, width/2:width);
I3 = G(height/2:height, 1:width/2);
I4 = G(height/2:height, width/2:width);

figure(100);
imshow(I);

figure(101);
subplot(221);imshow(I1);title('1');
subplot(222);imshow(I2);title('2');
subplot(223);imshow(I3);title('3');
subplot(224);imshow(I4);title('4');
figure(102);
subplot(221);plot(imhist(I1),'g');axis([0 255 0 500]);title('g:hist');
subplot(222);plot(imhist(I2),'g');axis([0 255 0 500]);title('g:hist');
subplot(223);plot(imhist(I3),'g');axis([0 255 0 500]);title('g:hist');
subplot(224);plot(imhist(I4),'g');axis([0 255 0 500]);title('g:hist');

pause();

end

