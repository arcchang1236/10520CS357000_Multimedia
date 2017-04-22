I = imread('thinker_gray_noised.jpg');

% Create the gaussian filter with size and sigma
G1 = fspecial('gaussian',[3 3], 0.3);
G2 = fspecial('gaussian',[9 9], 1);

IG1 = filterGaussian(im2double(I), G1);
IG2 = filterGaussian(im2double(I), G2);
imwrite(IG1, 'gaussian_1.jpg');
imwrite(IG2, 'gaussian_2.jpg');

% For test gaussian
%IGT1 = conv2(im2double(I), G1);
%IGT2 = conv2(im2double(I), G2);
%imwrite(IGT1, 'conv_1.jpg');
%imwrite(IGT2, 'conv_2.jpg');

IM1 = filterMedian(im2double(I), 3);
IM2 = filterMedian(im2double(I), 9);
imwrite(IM1, 'median_1.jpg');
imwrite(IM2, 'median_2.jpg');


