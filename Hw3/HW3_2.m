R1 = im2double(imread('data\frame72.jpg'));
R2 = im2double(imread('data\frame85.jpg'));
T = im2double(imread('data\frame81.jpg'));
b = 8;
p = 8;

total = 0;

image_size = size(T);
for x = 1 : b : image_size(1);
    for y = 1 : b : image_size(2);
        [SAD, log_R1(x:x+b-1, y:y+b-1, :)] = my2DLogSearch(T, R1, b, p, x, y);
        [SAD2, log_R2(x:x+b-1, y:y+b-1, :)] = my2DLogSearch(T, R2, b, p, x, y);
        if SAD < SAD2
            result(x:x+b-1, y:y+b-1, :) = log_R1(x:x+b-1, y:y+b-1, :);
            total = total + SAD;
        else
            result(x:x+b-1, y:y+b-1, :) = log_R2(x:x+b-1, y:y+b-1, :);
            total = total + SAD2;
        end
    end
end
imwrite(sum(abs(result-T), 3), 'Result\2_log_b8_p8.jpg')
disp('SAD: ')
disp(total);
disp('PSNR: ')
psnr = myPSNR(T, result);
disp(psnr);