function [ s_index ] = calcSimilarity( I1, I2 )
%CALCSIMILARITY Summary of this function goes here
%   Detailed explanation goes here
%计算图像直方图距离
%巴氏系数计算法

M = I1;
N = I2;
I = rgb2gray(M);
J = rgb2gray(N);
[ Count1, x ] = imhist(I);
[ Count2, x ] = imhist(J);
Sum1 = sum(Count1);Sum2=sum(Count2);
Sumup = sqrt(Count1 .* Count2);
SumDown = sqrt(Sum1 * Sum2);
Sumup = sum(Sumup);
% figure(1);
% subplot(2,2,1); imshow(I);
% subplot(2,2,2); imshow(J);
% subplot(2,2,3); imhist(I);
% subplot(2,2,4); imhist(J);
HistDist = 1 - sqrt( 1 - Sumup/SumDown );
s_index = HistDist;
end

