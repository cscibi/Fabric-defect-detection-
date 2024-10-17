leaf = imread('2A.jpg');
leaf_gray = rgb2gray(leaf);
% binarize
leaf_bin = leaf_gray < 90;
se = strel('line',01,10);
% eroded image
erodedBW = imerode(leaf_bin,se);

imshowpair(leaf_bin, erodedBW, 'montage')