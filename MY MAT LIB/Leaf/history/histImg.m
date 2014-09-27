function [  ] = histImg( img )

%%
r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

r_num = size(r(find(r > 0)))
g_num = size(r(find(g > 0)))
b_num = size(r(find(b > 0)))

handle = figure(101);
subplot(231);imshow(img);title('orign'); 
subplot(234);plot(imhist(r),'r');hold on;axis([0 255 0 4000]);title('r:hist'); hold off;
subplot(235);plot(imhist(g),'g');axis([0 255 0 4000]);title('g:hist'); 
subplot(236);plot(imhist(b),'b');hold on;axis([0 255 0 4000]);title('b:hist');hold off;


end

