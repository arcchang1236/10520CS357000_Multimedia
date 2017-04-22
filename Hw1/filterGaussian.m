function output = filterGaussian(input, filter)
%filterGaussian Summary of this function goes here
%   Detailed explanation goes here
    [M, N] = size(input);
    [X, Y] = size(filter);
    mid_x = floor(X/2);
    mid_y = floor(Y/2);
    now = zeros(X, Y);
    for i = 1 : M;
        for j = 1 : N;
            if (i-mid_x > 0 && i+mid_x <= M && j-mid_y > 0 && j+mid_y <= N)
                now = input(i-mid_x:i+mid_x, j-mid_x:j+mid_x);
                output(i, j) = sum(sum(filter.*now));
            else
                output(i, j) = input(i, j);
            end
        end
    end
end

