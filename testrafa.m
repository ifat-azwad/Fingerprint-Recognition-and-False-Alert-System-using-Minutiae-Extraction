filename='2006085_2.jpg';
img = imread(filename);
figure; imshow(img); title("Original Image");
fimg = fft2(img);
imagesc(abs(fftshift(fimg)));