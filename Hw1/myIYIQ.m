function output = myIYIQ(input)
%myIYIQ Summary of this function goes here
%   Detailed explanation goes here
    K=[ 0.299, 0.587, 0.114;
        0.596,-0.275,-0.321;
        0.212,-0.523, 0.311 ];
    [M, N, D]=size(input);
    YIQ = zeros(3:1);
    for i = 1 : M;
        for j = 1 : N;
            YIQ(1,1) = input(i,j,1);
            YIQ(2,1) = input(i,j,2);
            YIQ(3,1) = input(i,j,3);
            output(i,j,:) = inv(K) * YIQ;
        end
    end 

end