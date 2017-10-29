# Erosion.
# Load image package
pkg load image

close all  % figures windows
clc % command window
clear % variables in memory

# Constructing the image.
img = [1 1 1 1 1 1 1 1 1 1 1;
1 1 1 1 1 1 1 1 1 1 1;
1 1 0 0 0 0 0 0 0 1 1;
1 1 0 0 0 0 0 0 0 1 1;
1 1 0 0 1 1 1 0 0 1 1;
1 1 0 0 1 1 1 0 0 1 1;
1 1 0 0 1 1 1 0 0 1 1;
1 1 0 0 0 0 0 0 0 1 1;
1 1 1 1 1 1 1 1 1 1 1;
1 1 1 1 1 1 1 1 1 1 1;];

# Create the structuring elements.
h_1 = strel('arbitrary', [1 1; 1 1;]);
h_2 = strel('arbitrary', [1 1 1; 1 1 1; 1 1 1;]);

# Apply erosion.
img_ero_1 = imerode(img, h_1)
img_ero_2 = imerode(img, h_2)
[img_height img_width channels] = size(img);

# Display differences.
figure();
subplot (3,1,1);
imshow(img);

subplot (3,1,2);
imshow(img_ero_1);

subplot (3,1,3);
imshow(img_ero_2);
