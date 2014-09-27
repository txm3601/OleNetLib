function [] = lab2( rgb )
%%
T_lab = 128;

%%
cform = makecform('srgb2lab'); 
lab = applycform(rgb, cform);

a = lab(:,:,2);
b = lab(:,:,3);
figure(1);
subplot(121);imhist(a);
subplot(122);imhist(b);

mask = uint8(a<T_lab );
redA = mask .* rgb(:,:,2);
figure(2);
subplot(221);imshow(rgb);title('origin');
subplot(223);imshow(a);title('a*');
subplot(224);imshow(b);title('b*');
% nrows = size(ab,1);
% ncols = size(ab,2);
% ab = reshape(ab,nrows*ncols,2);

end