function output = myYIQ(input)
%myYIQ Summary of this function goes here
%   Detailed explanation goes here
    K=[ 0.299, 0.587, 0.114;
        0.596,-0.275,-0.321;
        0.212,-0.523, 0.311 ];
    [M, N, D]=size(input);
    RGB = zeros(3:1);
    for i = 1 : M;
        for j = 1 : N;
            RGB(1,1) = input(i,j,1);
            RGB(2,1) = input(i,j,2);
            RGB(3,1) = input(i,j,3);
            output(i,j,:) = K * RGB;
        end
    end 

end