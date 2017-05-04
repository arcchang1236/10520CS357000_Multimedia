function output = myPSNR(first,second)
%myPSNR Summary of this function goes here
%   Detailed explanation goes here
    [M, N, D]=size(first);
    MSER= sum(sum((first(:,:,1)-second(:,:,1)).^2)) / M / N;
    MSEG= sum(sum((first(:,:,2)-second(:,:,2)).^2)) / M / N;
    MSEB= sum(sum((first(:,:,3)-second(:,:,3)).^2)) / M / N;
    MSE = (MSER + MSEG + MSEB) / 3;
    output = 10 * log10(1 / MSE);
end