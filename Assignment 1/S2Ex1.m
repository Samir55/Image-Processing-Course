# Bluish.
# Load image package
pkg load image

close all  % figures windows
clc % command window
clear % variables in memory

# Read image
img_org = imread("Picture2.png");

# convert to greyscale
img = rgb2gray(img_org);

# Change to double
img = double(img);

# Apply Contrast Enchancement.
#[img_th] = Cntrst(img);

# Remove Bluish.
img_without_blue = img_org;
img_without_blue(:,:,3) = 0; # 3 means Blue colour (The 3 RGB channels).

# Segmentation.
img(img >= 0 & img < 50) = 50;
img(img >= 50 & img < 100) = 100;
img(img >= 100 & img < 150) = 150;
img(img >= 150 & img < 200) = 200;
img(img >= 200 & img <= 255) = 255;

# Show different images
figure();
subplot(2,1, 1);
imshow(img_org, []);
#subplot(4,1, 2)
#imshow(img_th, []);
#subplot(2, 1, 3);
#imshow(img, []);
subplot(2, 1, 2);
imshow(img_without_blue, []);

