function output = nearestNeighbor(input, factor)
%nearestNeighbor Summary of this function goes here
%   Detailed explanation goes here
    [M ,N ,D] = size(input);
    zoom_M = M * factor;
    zoom_N = N * factor;
    output = zeros(zoom_M, zoom_N);
    for i = 0 : (zoom_M-1);
        for j = 0 : (zoom_N-1);
            for k = 1 : D;
                output(i+1, j+1, k) = input(floor(i/factor)+1, floor(j/factor)+1, k);
            end
        end
    end
end
 


