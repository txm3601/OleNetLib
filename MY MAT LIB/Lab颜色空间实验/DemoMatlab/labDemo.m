% Create a video input object to access the image acquisition device.
% vid = videoinput('matrox', 1, 'M_NTSC');
% 
% % Capture one frame of data.
% fabric = getsnapshot(vid);
dir = 'D:\Study\Í¼Ïñ\Ê÷Ò¶¼ì²â\Ò¶×ÓÍ¼Æ¬\18_0001.avi.bmp';
I = imread(dir);
fabric = I;
figure(1)
imshow(fabric)
title('original image');
% Determine the image resolution.
% imageRes = vid.VideoResolution;
imageRes = size(fabric);
imageWidth = imageRes(1);
imageHeight = imageRes(2);

% Once the video input object is no longer needed, delete
% it and clear it from the workspace.
% delete(vid)
% clear vid

%%
% Initialize storage for each sample region.
colorNames = { 'red','green','purple','blue','yellow' };
nColors = length(colorNames);
sample_regions = false([imageHeight imageWidth nColors]);

% Select each sample region.
f = figure;
for count = 1:nColors
    set(f, 'name', ['Select sample region for ' colorNames{count}] );
    sample_regions(:,:,count) = roipoly(fabric);
end
close(f);

% Display a sample region.
imshow(sample_regions(:,:,1))
title(['sample region for ' colorNames{1}]);

%%
% Convert the fabric RGB image into an L*a*b image.
cform = makecform('srgb2lab');
lab_fabric = applycform(fabric,cform);

% Calculate the mean 'a' and 'b' value for each area extracted.
% These values serve as your color markers in 'a*b' space.
a = lab_fabric(:,:,2);
b = lab_fabric(:,:,3);
color_markers = repmat(0, [nColors, 2]);

for count = 1:nColors
  color_markers(count,1) = mean2(a(sample_regions(:,:,count)));
  color_markers(count,2) = mean2(b(sample_regions(:,:,count)));
end

% For example, the average color of the second sample region in 'a*b' space is:
disp( sprintf('[%0.3f,%0.3f]', color_markers(2,1), color_markers(2,2)) );

%%
% Create an array that contains your color labels:
%     0 = background
%     1 = red
%     2 = green
%     3 = purple
%     4 = magenta
%     5 = yellow
color_labels = 0:(nColors-1);

% Initialize matrices to be used in the nearest neighbor classification.
a = double(a);
b = double(b);
distance = repmat(0,[size(a), nColors]);

% Perform classification.
for count = 1:nColors
  distance(:,:,count) = ( (a - color_markers(count,1)).^2 + ...
                      (b - color_markers(count,2)).^2 ).^0.5;
end

[value, label] = min(distance, [], 3);
label = color_labels(label);
clear value distance;

%%
rgb_label = repmat(label, [1 1 3]);
segmented_images = repmat(uint8(0), [size(fabric), nColors]);

for count = 1:nColors
  color = fabric;
  color(rgb_label ~= color_labels(count)) = 0;
  segmented_images(:,:,:,count) = color;
end

imshow(segmented_images(:,:,:,1));
title([colorNames{1} ' objects'] );

%%
imshow(segmented_images(:,:,:,2));
title([colorNames{2} ' objects'] );
imshow(segmented_images(:,:,:,3));
title([colorNames{3} ' objects'] );
imshow(segmented_images(:,:,:,4));
title([colorNames{4} ' objects'] );
imshow(segmented_images(:,:,:,5));
title([colorNames{5} ' objects'] );

