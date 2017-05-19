clear all; close all; clc;

rbImage = im2double(imread('icon_back.png'));
[h, w, ~] = size(rbImage);
imshow(rbImage);

%% Mouse input
xlabel ('Select 39 points along the outline', 'FontName', 'Arial', 'FontSize', 14);
[ ctrlPointX, ctrlPointY ] = ginput(40);
ctrlPointList = [ctrlPointX ctrlPointY];
clickedN = size(ctrlPointList,1);

promptStr = sprintf('%d points selected', clickedN);
xlabel (promptStr, 'FontName', 'Arial', 'FontSize', 14);

%% Calculate Bazier Curve && Draw and fill the polygon
LoD = 0.2; % 0.2: LOW 0.01: HIGH
outlineVertexList = myBezier(ctrlPointList, clickedN, LoD); %Enrich outlineVertexList
figure;
result = drawAndFillPolygon( rbImage, ctrlPointList, outlineVertexList, true, true, true );
imwrite(result, 'result_40_low.png');

LoD = 0.01;
outlineVertexList = myBezier(ctrlPointList, clickedN, LoD); %Enrich outlineVertexList
figure;
result = drawAndFillPolygon( rbImage, ctrlPointList, outlineVertexList, true, true, true );
imwrite(result, 'result_40_high.png');

result_big = imresize(result, 4, 'nearest');
for i = 1 : clickedN;
    ctrlPointList(i, 1) = 4 * ctrlPointList(i, 1);
    ctrlPointList(i, 2) = 4 * ctrlPointList(i, 2);
end

figure;
outlineVertexList = myBezier(ctrlPointList, clickedN, LoD);
result = drawAndFillPolygon( result_big, ctrlPointList, outlineVertexList, true, true, true );
imwrite(result, 'result_40_NN.png');


