function [] = leaf( aviObj )
%LEAF Summary of this function goes here
%   Detailed explanation goes here
%%
STEP = 50;
NUM = 3;

%%
totleFrames = aviObj.NumberOfFrames;
Height = aviObj.Height;
Width = aviObj.Width;
nFrames = min(NUM, totleFrames);

for k = 1 : nFrames
    kOld = k;
    kNew = min(k+STEP, totleFrames);
    imgOld = read(aviObj, kOld);   
    imgNew = read(aviObj, kNew);     
    bw = im2bw(imgOld, 0.5);
    figure(1);imshow(bw);    
    imwrite(bw, [aviObj.Name, num2str(k),'.bmp'], 'bmp');

    %imgDiff = imabsdiff(imgNew, imgOld);
    %imgDiff = rgb2gray(imgDiff);  
    pause();
end

end

