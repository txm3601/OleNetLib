function [ I2 ] = symmetry_img( I1, loop )
%%
%将图像左右镜像对称
%loop为做镜像对称的次数
%得到的结果为对应点的灰度差值小于T的图片

%%
T = 10;

%%
if loop==0
     I2 = I1;
else
    [M, N] = size(I1);
    X1 = floor(N/2);
    X2 = floor(N/2)+1;
    IL = I1(:, 1:X1);
    IR = I1(:, X2:X2+X1-1);    
    IL = symmetry_img( IL, loop-1);
    IR = symmetry_img( IR, loop-1 );
    IRf = fliplr(IR);
    Diff = abs(IL-IRf);
    mask = Diff<T;%得到相似的点对应的蒙板
    IL = mask .* IL;
    IR = fliplr(mask .* IRf);
    I2(:, 1:X1) = IL;
    I2(:, X2:X2+X1-1) = IR ;
    I2(:, N) = I1(N);
end

end

