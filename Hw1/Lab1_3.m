ILR = imread('img_LR.png');
IHR = imread('img_HR.png');

IN = nearestNeighbor(im2double(ILR), 4); 
imwrite(IN, 'nearest_neighbor.png');

p1 = myPSNR(im2single(IHR), im2single(IN));
disp(p1);

% For test
%IB = imresize(ILR, 4, 'bilinear');
IB = resizeBilinear(im2double(ILR), 4);
imwrite(IB, 'resize_bilinear.png');

p2 = myPSNR(im2double(IHR), im2double(IB));
disp(p2);


