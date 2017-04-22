function output = filterMedian(input, f_size)
%filterMedian Summary of this function goes here
%   Detailed explanation goes here
    [M, N] = size(input);
    mid_x = floor(f_size/2);
    mid_y = floor(f_size/2);
    K = zeros(f_size, f_size);
    for i = 1 : M;
        for j = 1 : N;
            if (i-mid_x > 0 && i+mid_x <= M && j-mid_y > 0 && j+mid_y <= N)
                K = input(i-mid_x:i+mid_x, j-mid_x:j+mid_x);
                K = reshape(K, [f_size*f_size, 1]);
                output(i, j) = median(K);
            else
                output(i, j) = input(i, j);
            end
        end
    end
end