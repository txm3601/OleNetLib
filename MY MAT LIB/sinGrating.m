%%
% 制作正弦光栅

%%
clc;
clear;
M=256;
T=20;
P=pi/4;%Phase

I=zeros(M, M);
for i=1:M
    for j=1:M
        I(i,j) = 128+127*cos((i+j)/T*2*pi+P);
        %I(i,j) = 128+127*cos(j/T*2*pi+P);
        %I(i,j) = 128+127*cos(i/T*2*pi+P);
    end
end
I1=mat2gray(I);
figure(1),imshow(I1)