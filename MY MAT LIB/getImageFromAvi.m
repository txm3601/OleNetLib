function imgDiff = getImageFromAvi(filename, M1, M2)

%%
JND_THRESH = 0/255;
START = 50;
STEP = 25;

%%
K1 = START;
K2 = START + STEP;
videoObj = mmreader(filename);
img1 = read(videoObj, K1);
img2 = read(videoObj, K2);

img1 = imresize(img1,[M1,M2]);
img2 = imresize(img2,[M1,M2]);
imgDiff = imabsdiff(img1, img2);
imgDiff = im2double(rgb2gray(imgDiff));

imgDiff(imgDiff < JND_THRESH) = 0;

end