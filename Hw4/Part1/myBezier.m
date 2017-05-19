function [ output ] = myBezier(pointList, num, LoD)
%myBezier Summary of this function goes here
%   Detailed explanation goes here\
    now = 1;
    for i = 1 : 3 : num;
        for t = 0 : LoD : 1;
            t_p0 = (1-t)^3;
            t_p1 = 3*t*(1-t)^2;
            t_p2 = 3*t*t*(1-t);
            t_p3 = t^3;
            if(i > num - 3)
                tmp(now, 1) = t_p0 * pointList(i, 1) + t_p1 * pointList(i+1, 1) + t_p2 * pointList(i+2, 1) + t_p3 * pointList(1, 1);
                tmp(now, 2) = t_p0 * pointList(i, 2) + t_p1 * pointList(i+1, 2) + t_p2 * pointList(i+2, 2) + t_p3 * pointList(1, 2); 
            else
                tmp(now, 1) = t_p0 * pointList(i, 1) + t_p1 * pointList(i+1, 1) + t_p2 * pointList(i+2, 1) + t_p3 * pointList(i+3, 1);
                tmp(now, 2) = t_p0 * pointList(i, 2) + t_p1 * pointList(i+1, 2) + t_p2 * pointList(i+2, 2) + t_p3 * pointList(i+3, 2); 
            end
            now = now + 1;
        end
    end
    output = tmp;
end

