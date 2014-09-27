function [] = rgbf(I)
%%
mask = ostu_exp(I);
R = I(:,:,1);
R1 = R .* uint8(mask);
G = I(:,:,2);
G1 = G .* uint8(mask);
B = I(:,:,3);
B1 = B .* uint8(mask);

sumR = sum(R(:));
sumG = sum(G(:));
sumB = sum(B(:));
div = sumG / (sumG+ sumR + sumB)
% G1 = G .* uint8(mask);
% sum = sum(G1(:));
% len = length(find(G1(:) ~= 0));
% avg_g = summ/len;

figure(100);
subplot(221);imshow(I);
subplot(222);imshow(G);
if(div<0.5) subplot(223);plot(1.5, div, '--rs','LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g','MarkerSize', 10); hold on;grid on;axis([1 2 0 1]);hold off;
else subplot(223);plot(1.5, div, '--rs','LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r','MarkerSize', 10); hold on;grid on;axis([1 2 0 1]);hold off;end;
 
end