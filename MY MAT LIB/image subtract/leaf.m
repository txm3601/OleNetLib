function [ output_args ] = leaf( aviObj )
%LEAF Summary of this function goes here
%   Detailed explanation goes here
%%
STEP = 50;
NUM = 3;

%%
% filename = aviObj.filename;
totleFrames = aviObj.NumberOfFrames;
Height = aviObj.Height;
Width = aviObj.Width;
nFrames = min(NUM, totleFrames);

for k = 1 : nFrames  
    vidHeight = aviObj.Height;
    vidWidth  = aviObj.Width;
    images(1:5) =struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),'colormap', []);
    for i=0:4
        images(i+1).cdata = rgb2gray(read(aviObj, k+i));
    end
    
    imgDiff1(Height,Width) = uint8(0);
    imgDiff2(Height,Width) = uint8(0);
    for i=0:4      
        temp1 = imabsdiff(images(1).cdata, images(2).cdata);
        temp2 = images(1).cdata - images(2).cdata;
        imgDiff1 = imgDiff1 + temp1;
        imgDiff2 = imgDiff2 + temp2;     
    end
 
    subplot(121);imshow(imgDiff1);
    subplot(122);imshow(imgDiff2);
    %bw = im2bw(imgOld, 0.5);
    imgDiff1(:,:) = uint8(0);
    imgDiff2(:,:) = uint8(0);
    pause(3);
end

end

