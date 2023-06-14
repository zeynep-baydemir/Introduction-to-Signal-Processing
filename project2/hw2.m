% Read image
img = imread("otter.png", "png");

% grayscale image
img = rgb2gray(img);

org_img = img;

%imshow(org_img);

height = size(img, 1);
width = size(img, 2);

% Downsample the image to half of its size
four_copies = img(1:2:height,1:2:width);

% Create a version of the image with 4 copies
four_copies = [four_copies four_copies ; four_copies four_copies];

%imshow(four_copies)

% Hiding four photo into one cat
n = 5;

four_copies = bitshift(four_copies,(n-8));
img = bitor(bitand(img, (256-2^n)), four_copies);

first_rmse_img = img;

%imshow(first_rmse_img);

% Corrupt 30 rows
rng(1);
corrupted = reshape((randi([0, 255],30*512, 1)),30,512);
img(96:125, 1:512) = corrupted;

second_rmse_img = img;
%imshow(second_rmse_img);

% Get hidden bits back

img = bitand(img,(2^n-1)) ;
img = bitshift(img, (8-n));
%imshow(img);


% Resize one copy which is bottom left
one_copy = img(height/2+1:height, 1:width/2);

height_one_copy = size(one_copy,1);
width_one_copy = size(one_copy,2);

doubled_img(1:2:height_one_copy*2, 1:2:width_one_copy*2) = one_copy;
doubled_img(2:2:height_one_copy*2, 2:2:width_one_copy*2) = one_copy;
doubled_img(1:2:height_one_copy*2, 2:2:width_one_copy*2) = one_copy;
doubled_img(2:2:height_one_copy*2, 1:2:width_one_copy*2) = one_copy;
%imshow(doubled_img);

first_rmse = rmse(double(org_img(:)), double(first_rmse_img(:)));
second_rmse = rmse(double(org_img(:)), double(second_rmse_img(:)));
third_rmse = rmse(double(org_img(:)), double(doubled_img(:)));
%imshow(doubled_img);

img = doubled_img;
%imwrite(doubled_img, "otter5.png");
%imshow(first_rmse_photo);

