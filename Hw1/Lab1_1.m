I = imread('lalaland.png');

I2(:,:,1) = myDCT(I(:,:,1));
I2(:,:,2) = myDCT(I(:,:,2));
I2(:,:,3) = myDCT(I(:,:,3));
II2(:,:,1) = myIDCT(I2(:,:,1), 2);
II2(:,:,2) = myIDCT(I2(:,:,2), 2);
II2(:,:,3) = myIDCT(I2(:,:,3), 2);

p2 = myPSNR(im2single(im2uint8(I)),im2single(im2uint8(II2)));
disp(p2);
imwrite(II2, 'idct_2.jpg');

I4(:,:,1) = myDCT(I(:,:,1));
I4(:,:,2) = myDCT(I(:,:,2));
I4(:,:,3) = myDCT(I(:,:,3));
II4(:,:,1) = myIDCT(I4(:,:,1), 4);
II4(:,:,2) = myIDCT(I4(:,:,2), 4);
II4(:,:,3) = myIDCT(I4(:,:,3), 4);

p4 = myPSNR(im2single(im2uint8(I)),im2single(im2uint8(II4)));
disp(p4);
imwrite(II4, 'idct_4.jpg');

I8(:,:,1) = myDCT(I(:,:,1));
I8(:,:,2) = myDCT(I(:,:,2));
I8(:,:,3) = myDCT(I(:,:,3));
II8(:,:,1) = myIDCT(I8(:,:,1), 8);
II8(:,:,2) = myIDCT(I8(:,:,2), 8);
II8(:,:,3) = myIDCT(I8(:,:,3), 8);

p8 = myPSNR(im2single(im2uint8(I)),im2single(im2uint8(II8)));
disp(p8);
imwrite(II8, 'idct_8.jpg');

% ----------------------------------------------------------------------- %

X = myYIQ(im2double(I));

IY2(:,:,1) = myDCT(X(:,:,1));
IY2(:,:,2) = myDCT(X(:,:,2));
IY2(:,:,3) = myDCT(X(:,:,3));
IIY2(:,:,1) = myIDCT(IY2(:,:,1), 2);
IIY2(:,:,2) = myIDCT(IY2(:,:,2), 2);
IIY2(:,:,3) = myIDCT(IY2(:,:,3), 2);

IX2 = myIYIQ(im2double(IIY2));
py2 = myPSNR(im2single(im2uint8(I)),im2single(im2uint8(IX2)));
disp(py2);
imwrite(IX2, 'iyiq_2.jpg');

IY4(:,:,1) = myDCT(X(:,:,1));
IY4(:,:,2) = myDCT(X(:,:,2));
IY4(:,:,3) = myDCT(X(:,:,3));
IIY4(:,:,1) = myIDCT(IY2(:,:,1), 4);
IIY4(:,:,2) = myIDCT(IY2(:,:,2), 4);
IIY4(:,:,3) = myIDCT(IY2(:,:,3), 4);

IX4 = myIYIQ(im2double(IIY4));
py4 = myPSNR(im2single(im2uint8(I)),im2single(im2uint8(IX4)));
disp(py4);
imwrite(IX4, 'iyiq_4.jpg');

IY8(:,:,1) = myDCT(X(:,:,1));
IY8(:,:,2) = myDCT(X(:,:,2));
IY8(:,:,3) = myDCT(X(:,:,3));
IIY8(:,:,1) = myIDCT(IY2(:,:,1), 8);
IIY8(:,:,2) = myIDCT(IY2(:,:,2), 8);
IIY8(:,:,3) = myIDCT(IY2(:,:,3), 8);

IX8 = myIYIQ(im2double(IIY8));
py8 = myPSNR(im2single(im2uint8(I)),im2single(im2uint8(IX8)));
disp(py8);
imwrite(IX8, 'iyiq_8.jpg');