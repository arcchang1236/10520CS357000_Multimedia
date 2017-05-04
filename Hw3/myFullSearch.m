function [ SAD_min, SAD_result ] = myFullSearch(T, R, b, p, x, y)
%myFullSearch Summary of this function goes here
%   Detailed explanation goes here
	[M, N, C] = size(R);
	SAD_min = realmax;
    T2 = T(x:x+b-1, y:y+b-1, :);
    for i = -p : p;
		for j = -p : p;
            if(x+i>=1 && y+j>=1 && x+i+b-1<=M && y+j+b-1<=N)
                R2 = R(x+i:x+i+b-1, y+j:y+j+b-1, :);
                SAD_now = sum(sum(sum(abs(T2-R2))));
                if(SAD_now < SAD_min)
                    SAD_min = SAD_now;
                    SAD_x = x+i; 
                    SAD_y = y+j;
                end
            end
		end
    end
    SAD_result = R(SAD_x:SAD_x+b-1, SAD_y:SAD_y+b-1, :);
end

