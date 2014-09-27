function [] = NEG(I)
%% NEG is short for NORMALIZED EXCESSIVE GREEN
%%
epsilon = 0.00000001;
param = 3.5;
%%
r = double(I(:,:,1));
g = double(I(:,:,2));
b = double(I(:,:,3));
R = r(:,:) ./((r(:,:) + g(:,:) + b(:,:)) + epsilon);
G = g(:,:) ./((r(:,:) + g(:,:) + b(:,:)) + epsilon);
B = b(:,:) ./((r(:,:) + g(:,:) + b(:,:)) + epsilon);
NEG = param * G(:,:) - R(:,:) - B(:,:);
NEG = uint8(round(NEG(:,:) * 100));
% level = graythresh(I);
% BW = im2bw(I,level);
% G=I(:,:,3);
% G = G.* uint8(~BW);
% [height width] = size(G);
[height width] = size(NEG);
NEG1 = NEG(1:height/2, 1:width/2);  
NEG2 = NEG(1:height/2, width/2:width);
NEG3 = NEG(height/2:height, 1:width/2);
NEG4 = NEG(height/2:height, width/2:width);

index1 = find(50<NEG1(:,:) & NEG1(:,:)<100);num1 = length(index1)
index2 = find(50<NEG2(:,:) & NEG2(:,:)<100);num2 = length(index2)
index3 = find(50<NEG3(:,:) & NEG3(:,:)<100);num3 = length(index3)
index4 = find(50<NEG4(:,:) & NEG4(:,:)<100);num4 = length(index4)

figure(100);
subplot(221);imshow(I);
if(num1<20000) subplot(443);plot(1.5, num1, '--rs','LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g','MarkerSize', 10); hold on;grid on;axis([1 2 0 40000]);hold off;
else subplot(443);plot(1.5, num1, '--rs','LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r','MarkerSize', 10); hold on;grid on;axis([1 2 0 40000]);hold off;end;
    
if(num2<20000) subplot(444);plot(1.5, num2, '--rs','LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g','MarkerSize', 10); hold on;grid on;axis([1 2 0 40000]);hold off;
else subplot(444);plot(1.5, num2, '--rs','LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r','MarkerSize', 10); hold on;grid on;axis([1 2 0 40000]);hold off;end;
    
if(num3<20000) subplot(447);plot(1.5, num3, '--rs','LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g','MarkerSize', 10); hold on;grid on;axis([1 2 0 40000]);hold off;
else subplot(447);plot(1.5, num3, '--rs','LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r','MarkerSize', 10); hold on;grid on;axis([1 2 0 40000]);hold off;end;
    
if(num4<20000)subplot(448);plot(1.5, num4, '--rs','LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g','MarkerSize', 10); hold on;grid on;axis([1 2 0 40000]);hold off;
else subplot(448);plot(1.5, num4, '--rs','LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r','MarkerSize', 10); hold on;grid on;axis([1 2 0 40000]);hold off;end;
%title('SCORE');grid on; hold on; axis([1 5 0 100000]);
%colormap(gca,jet);set(gca,'YDir','normal');freezeColors;
hold off;  legend('Result');

subplot(4,4,9); imshow(NEG1);
subplot(4,4,10);imshow(NEG2);
subplot(4,4,13);imshow(NEG3);
subplot(4,4,14);imshow(NEG4);
%subplot(223);imshow(NEG);
subplot(224);plot(imhist(NEG),'k');hold on;axis([0 255 0 20000]);title('NEG gray scale hist'); hold off;

end