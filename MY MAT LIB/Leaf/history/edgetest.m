function edgetest(I)

%%
image=I;
Image_roberts=edge(image,'roberts');
Image_sobel=edge(image,'sobel');
Image_log=edge(image,'log');
Image_prewitt=edge(image, 'prewitt');
Image_canny=edge(image,'canny');

% figure(1);
subplot(331);imshow(I);title('orign');
subplot(334);imshow(Image_roberts);title('roberts');
subplot(335);imshow(Image_sobel);title('sobel');
subplot(336);imshow(Image_log);title('lob');
subplot(337);imshow(Image_prewitt);title('prewitt');
subplot(338);imshow(Image_canny);title('canny');


end