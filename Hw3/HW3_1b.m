R = im2double(imread('data\frame72.jpg'));
T = im2double(imread('data\frame81.jpg'));
b1 = 8;
b2 = 16;
p1 = 8;
p2 = 16;

total_full_a = 0;
total_full_b = 0;
total_full_c = 0;
total_full_d = 0;

total_log_a = 0;
total_log_b = 0;
total_log_c = 0;
total_log_d = 0;

image_size = size(T);
for x = 1 : b1 : image_size(1);
    for y = 1 : b1 : image_size(2);
        [SAD, full_a(x:x+b1-1, y:y+b1-1, :)] = myFullSearch(T, R, b1, p1, x, y);
        total_full_a = total_full_a + SAD;
        
        [SAD2, full_b(x:x+b1-1, y:y+b1-1, :)] = myFullSearch(T, R, b1, p2, x, y);
        total_full_b = total_full_b + SAD2;
        
        [SAD3, log_a(x:x+b1-1, y:y+b1-1, :)] = my2DLogSearch(T, R, b1, p1, x, y);
        total_log_a = total_log_a + SAD3;
        
        [SAD4, log_b(x:x+b1-1, y:y+b1-1, :)] = my2DLogSearch(T, R, b1, p2, x, y);
        total_log_b = total_log_b + SAD4;
    end
end

for x = 1 : b2 : image_size(1);
    for y = 1 : b2 : image_size(2);
        [SAD, full_c(x:x+b2-1, y:y+b2-1, :)] = myFullSearch(T, R , b2, p1, x, y);
        total_full_c = total_full_c + SAD;
        
        [SAD2, full_d(x:x+b2-1, y:y+b2-1, :)] = myFullSearch(T, R , b2, p2, x, y);
        total_full_d = total_full_d + SAD2;
        
        [SAD3, log_c(x:x+b2-1, y:y+b2-1, :)] = my2DLogSearch(T, R , b2, p1, x, y);
        total_log_c = total_log_c + SAD3;
        
        [SAD4, log_d(x:x+b2-1, y:y+b2-1, :)] = my2DLogSearch(T, R , b2, p2, x, y);
        total_log_d = total_log_d + SAD4;
    end
end

% Result images
imwrite(sum(abs(full_a-T), 3), 'Result\1b_full_b8_p8.jpg')
imwrite(sum(abs(full_b-T), 3), 'Result\1b_full_b8_p16.jpg')
imwrite(sum(abs(full_c-T), 3), 'Result\1b_full_b16_p8.jpg')
imwrite(sum(abs(full_d-T), 3), 'Result\1b_full_b16_p16.jpg')

imwrite(sum(abs(log_a-T), 3), 'Result\1b_log_b8_p8.jpg')
imwrite(sum(abs(log_b-T), 3), 'Result\1b_log_b8_p16.jpg')
imwrite(sum(abs(log_c-T), 3), 'Result\1b_log_b16_p8.jpg')
imwrite(sum(abs(log_d-T), 3), 'Result\1b_log_b16_p16.jpg')

% Show Toatal SAD
disp('SAD: ')

disp(total_full_a)
disp(total_full_b)
disp(total_log_a)
disp(total_log_b)

disp(total_full_c)
disp(total_full_d)
disp(total_log_c)
disp(total_log_d)

disp('------------------')

% Show PSNR
disp('PSNR: ')

psnr = myPSNR(T, full_a);
psnr2 = myPSNR(T, full_b);
psnr3 = myPSNR(T, log_a);
psnr4 = myPSNR(T, log_b);
disp(psnr)
disp(psnr2)
disp(psnr3)
disp(psnr4)

psnr5 = myPSNR(T, full_c);
psnr6 = myPSNR(T, full_d);
psnr7 = myPSNR(T, log_c);
psnr8 = myPSNR(T, log_d);
disp(psnr5)
disp(psnr6)
disp(psnr7)
disp(psnr8)