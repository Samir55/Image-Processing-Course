# Load image package
pkg load image

close all  % figures windows
clc % command window
clear % variables in memory

# Reading the image.
img = imread("test.png");

[img_height img_width channels] = size(img);

# Converting to grey scale.
img_grey = rgb2gray(img);

# Change to double
img_grey = im2double(img_grey);

# Convert the image to the frequency domain.
img_freq = fft2(img_grey);
img_freq = fftshift(img_freq);

# Generate the filter.
avg_stencil = 1/9 * ones(3,3);

# Convert the mask(filter/stencil) to the frequency domain but in the size of the selected image.
stencil_freq = fft2(avg_stencil, rows(img_freq), columns(img_freq)); # ToDo @Samir55 use img_grey instead of img_freq.
stencil_freq = fftshift(stencil_freq);

# Get the ouptut image
img_filtered = img_freq .* stencil_freq;

# Get the image back to the spatial(a.k.a. time) domain.
img_inversed = ifftshift(img_filtered);
img_inversed = ifft2(img_inversed);

# Plot.
figure();
subplot (1, 3, 1);
imshow (img_grey, []);
subplot (1, 3, 2);
img_filtered = abs(img_filtered);
img_filtered = log(img_filtered + 1);
imshow (img_filtered, []);
subplot (1, 3, 3);
img_inversed = abs(img_inversed);
img_inversed = log(img_inversed + 1);
imshow (img_inversed, []);

# Debugging (Testing).
# PLoting Testing using spatial(time) domain.
#img_test = imfilter(img_grey, avg_stencil);
#figure();
#imshow(img_test, []);