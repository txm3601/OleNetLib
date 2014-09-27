%**************************************************************************
%基于共生矩阵纹理特征提取，d=1,θ=0°,45°,90°,135°共四个矩阵
%所用图像灰度级均为256
%function : T=Texture(Image)
%Gray     : 输入灰度图像
%T        : 返回八维纹理特征行向量
%G        : 返回灰度共生矩阵
%**************************************************************************
function [Fe G] = Texture(OrignGray,SHOWFLAG,fileName)
Gray = OrignGray;
[M,N] = size(Gray);
dis = 1;
% %--------------------------------------------------------------------------
% %1.为了减少计算量，对原始图像灰度级压缩，将Gray量化成16级
% %--------------------------------------------------------------------------

T = [0,31,62,93,124,155,186,217,248,255];
for i =1:length(T)-1
    Gray(find(Gray(:,:) >= T(i) & Gray(:,:) < T(i+1))) = i-1;
end
Gray(find(Gray(:,:) >= T(i))) = i-1;
grayscale = i;

%--------------------------------------------------------------------------
%2.计算四个共生矩阵P,取距离为dis，角度分别为0,45,90,135
%--------------------------------------------------------------------------

P = zeros(grayscale,grayscale,4);
for i = 1:M
    for j = 1:N
        if j<N-dis+1
            P(Gray(i,j)+1,Gray(i,j+dis)+1,1) = P(Gray(i,j)+1,Gray(i,j+dis)+1,1)+1;
        end
        if i>dis&j<N-dis+1
            P(Gray(i,j)+1,Gray(i-dis,j+dis)+1,2) = P(Gray(i,j)+1,Gray(i-dis,j+dis)+1,2)+1;
        end
        if i<M-dis+1
            P(Gray(i,j)+1,Gray(i+dis,j)+1,3) = P(Gray(i,j)+1,Gray(i+dis,j)+1,3)+1;
        end
        if i<M-dis+1&j<N-dis+1
            P(Gray(i,j)+1,Gray(i+dis,j+dis)+1,4) = P(Gray(i,j)+1,Gray(i+dis,j+dis)+1,4)+1;
        end
    end
end
%%---------------------------------------------------------
% 3.对共生矩阵归一化
%%---------------------------------------------------------
for n = 1:4
    P(:,:,n) = P(:,:,n)/(sum(sum(P(:,:,n)))+1);
end
G = P;
%--------------------------------------------------------------------------
%4.对共生矩阵计算能量、熵、惯性矩、相关4个纹理参数
%--------------------------------------------------------------------------
H = zeros(1,4);
E = H;
deltaX = H;  deltaY = H;
C = H;
M = H;
MV = H;
V = H;
for n = 1:4
    E(n) = sum(sum(P(:,:,n).^2)); %%能量
    for i = 1:grayscale-1
        for j = 1:grayscale-1
            if P(i,j,n)~=0
                H(n) = -P(i,j,n)*log(P(i,j,n))+H(n); %%熵
            end
            M(n) = P(i,j,n)/(1+(i-j)^2)+M(n);%%IDM相关度，反差分矩阵
        end
    end
end

%--------------------------------------------------------------------------
%求能量、熵、惯性矩、相关的均值和标准差作为最终16维纹理特征
%--------------------------------------------------------------------------
a1 = mean(E);
b1 = sqrt(cov(E));
a2 = mean(H);
b2 = sqrt(cov(H));
a3 = mean(M);
b3 = sqrt(cov(M));
a4 = mean(MV);
b4 = sqrt(cov(MV));
a5 = mean(V);
b5 = sqrt(cov(V));
Fe = [a1,a2,a3,a4,a5]';

if SHOWFLAG
    h = figure (1);
    set(h, 'Name','IMVL Debug Window','NumberTitle','off', 'position', get(0,'ScreenSize')); colormap(hot);
    subplot(1,2,1);
    imagesc(Gray);
    title(['original img',num2str(fileName)]);
    subplot(1,2,2);
    imshow(Gray);
    title(['original img',num2str(fileName)]);
    pause;
end


