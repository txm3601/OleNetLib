function [] = lab1_exp( rgb )
%%
cform = makecform('srgb2lab'); 
lab = applycform(rgb, cform);

ab = double(lab(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 3;
% repeat the clustering 3 times to avoid local minima
[cluster_idx cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);
pixel_labels = reshape(cluster_idx,nrows,ncols);
subplot(231);imshow(pixel_labels,[]), title('image labeled by cluster index');

segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = rgb;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end

subplot(234);imshow(segmented_images{1}), title('objects in cluster 1');
subplot(235);imshow(segmented_images{2}), title('objects in cluster 2');
subplot(236);imshow(segmented_images{3}), title('objects in cluster 3');
%%
% L=lab(:,:,1);
% Al=lab(:,:,2);
% Bl=lab(:,:,3);
% 
% Rc=rgb(:,:,1);
% Gc=rgb(:,:,2);
% Bc=rgb(:,:,3);
% 
% figure(2);
% subplot(331);imshow(rgb);
% subplot(334);imshow(L);title('L');
% subplot(335);imshow(Al);title('A');
% subplot(336);imshow(Bl);title('B');
% subplot(337);imshow(Rc);title('R');
% subplot(338);imshow(Gc);title('G');
% subplot(339);imshow(Bc);title('B');
%pause();

end

