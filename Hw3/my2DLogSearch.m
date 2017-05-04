function [SAD_min, SAD_result] = my2DLogSearch(T, R, b, p, x, y)
%my2DLogSearch Summary of this function goes here
%   Detailed explanation goes here
    [A, B, C]=size(R);
    Np = floor(log2((p-1)/2));
    N = max(2, 2^(Np-1));
    T2 = T(x:x+b-1,y:y+b-1,:);
    SAD_tmp = realmax;
    dis_x = 0;
    dis_y = 0;
    flag = 0;
    while flag ~= 1
        M = {[0 0], [N 0], [0 N], [-N 0], [0 -N]};
        Mp = M;
        point = 1;
        for k = 1 : 5;
            if (x+dis_x+Mp{k}(1)>=1 && x+dis_x+b-1+Mp{k}(1)<=A &&y+dis_y+Mp{k}(2)>=1 && y+dis_y+b-1+Mp{k}(2)<=B)
                R2 = R(x+dis_x+Mp{k}(1):x+dis_x+b-1+Mp{k}(1), y+dis_y+Mp{k}(2):y+dis_y+b-1+Mp{k}(2), :);
                SAD_now = sum(sum(sum(abs(T2-R2)))); 
                if SAD_now < SAD_tmp
                   SAD_tmp = SAD_now;
                   point = k;
                end      
            end     
        end
        if point == 1      
            N = N/2;
            if N == 1
                SAD_min = realmax;
                for ii = -1 : 1;
                    for jj = -1 : 1;
                        if (x+dis_x+ii>=1 && y+jj+dis_y>=1 && x+dis_x+ii+b-1<=A && y+jj+dis_y+b-1<=B)
                            R2 = R(x+dis_x+ii:x+ii+dis_x+b-1, y+dis_y+jj:y+jj+dis_y+b-1, :);
                            SAD_now = sum(sum(sum(abs(T2-R2))));
                            if SAD_now < SAD_min
                               SAD_min = SAD_now;
                               SAD_x = x + dis_x + ii;
                               SAD_y = y + dis_y + jj;
                               flag = 1;
                            end    
                        end     
                    end   
                end
            end
        else
            dis_x = dis_x + Mp{point}(1);
            dis_y = dis_y + Mp{point}(2);
        end 
    end
    SAD_result = R(SAD_x:SAD_x+b-1, SAD_y:SAD_y+b-1, :);
end