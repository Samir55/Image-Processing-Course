# Load image package
pkg load image

close all  % figures windows
clc % command window
clear % variables in memory

# Reading the image.
img = imread("Picture2.png");

[img_height img_width channels] = size(img);

# Converting to grey scale.
img_grey = rgb2gray(img);

# Change to double
img_grey = im2double(img_grey);

# Apply salt and pepper noise.
img_noise = imnoise(img_grey, 'salt & pepper', 0.05);

img_median_self = img;
stencil = ones(3,3);
for i = 1:img_height
  for j = 1:img_width
    if (i-1 > 0 && i +1 < img_height &&  j-1 > 0 && j+1 < img_width)
    neighbours = img( i-1:i+1, j-1:j+1);
    # Convert to 1d array.
    neighbours = neighbours(:);
    # Get median
    m = median(neighbours);
    img_median_self(i, j) = m;
   end
  end
end
 
# Apply median filtering using built in function.
img_median = medfilt2(img_grey);

# Plot Median filters.
figure();
subplot (3, 1, 1);
imshow (img_grey, []);
subplot (3, 1, 2);
imshow (img_median_self, []);
subplot (3, 1, 3);
imshow (img_median, []);

# Get gaussain filters.
g1 = fspecial("gaussian", [3 3], 0.5); 
g2 = fspecial("gaussian", [7 7], 0.5);
g3 = fspecial("gaussian", [3 3], 8);
g4 = fspecial("gaussian", [3 3], 0.2);# This is the best as the coins have a lot of details that have to be kept.

img_g1 = imfilter(img_noise, g1);
img_g2 = imfilter(img_noise, g2);
img_g3 = imfilter(img_noise, g3);
img_g4 = imfilter(img_noise, g4);

# Plot Gaussian filters.
figure();
subplot (5, 1, 1);
imshow (img_grey, []);
#figure();
subplot (5, 1, 2);
imshow (img_g1, []);
#figure();
subplot (5, 1, 3);
imshow (img_g2, []);
#figure();
subplot (5, 1, 4);
imshow (img_g3, []);
#figure();
subplot (5, 1, 5);
imshow (img_g4, []);
    
