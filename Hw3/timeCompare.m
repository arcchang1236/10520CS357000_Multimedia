R = im2double(imread('data\frame72.jpg'));
T = im2double(imread('data\frame73.jpg'));

image_size = size(T);

disp('p = 8')

disp('Full')
tic;
for x = 1 : 8 : image_size(1);
    for y = 1 : 8 : image_size(2);
        [SAD, result(x:x+8-1, y:y+8-1, :)] = myFullSearch(T, R, 8, 8, x, y);
    end
end
toc;

disp('Log')
tic;
for x = 1 : 8 : image_size(1);
    for y = 1 : 8 : image_size(2);
        [SAD, result(x:x+8-1, y:y+8-1, :)] = my2DLogSearch(T, R, 8, 8, x, y);
    end
end
toc;

disp('p = 16')

disp('Full')
tic;
for x = 1 : 8 : image_size(1);
    for y = 1 : 8 : image_size(2);
        [SAD, result(x:x+8-1, y:y+8-1, :)] = myFullSearch(T, R, 8, 16, x, y);
    end
end
toc;

disp('Log')
tic;
for x = 1 : 8 : image_size(1);
    for y = 1 : 8 : image_size(2);
        [SAD, result(x:x+8-1, y:y+8-1, :)] = my2DLogSearch(T, R, 8, 16, x, y);
    end
end
toc;