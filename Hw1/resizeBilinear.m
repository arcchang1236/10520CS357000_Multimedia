function output = resizeBilinear( input, factor )
%resizeBilinear Summary of this function goes here
%   Detailed explanation goes here
    [M, N, D] = size(input);
    zoom_M = M * factor;
    zoom_N = N * factor;
    
    for i = 1 : zoom_M;
        x = (i-0.5) * (M/zoom_M) + 0.5;
        row_u = floor(x);
        if row_u <1
            row_u = row_u + 1;
        end
        row_d = ceil(x);
        if row_d > M
            row_d = row_d - 1;
        end
        a = x - row_u;
        
        for j = 1 : zoom_N;
            y = (j-0.5) * (N/zoom_N) + 0.5;
            col_l = floor(y);
            if col_l < 1
                col_l = col_l+1;
            end
            col_r = ceil(y);
            if col_r > N
                col_r = col_r-1; 
            end
            b = y - col_l;
            
            lu = input(row_u, col_l, :);
            ld = input(row_d, col_l, :);
            ru = input(row_u, col_r, :);
            rd = input(row_d, col_r, :);
            output(i, j, :) = (1-a) * ((1-b)*lu + b*ru) + a * ((1-b)*ld + b*rd);
        end
    end
end