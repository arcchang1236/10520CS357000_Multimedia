function output = blockDivide(size)
%blockDivide Summary of this function goes here
%   Detailed explanation goes here
    for i = 1 : size;
        for j = 1 : size;
            if i ~= 1
                output(i,j) = sqrt(2/size)*cos(pi*(2*j-1)*(i-1)/(2*size));
            else
                output(i,j)=1/sqrt(size);    
            end        
        end
    end
end
