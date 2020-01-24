image = imread('C:/sophy1.jpg');
imshow(image);
gray = rgb2gray(image);
imshow(gray);

subplot(2,1,1);imshow(image);
subplot(2,1,2);imhist(gray);