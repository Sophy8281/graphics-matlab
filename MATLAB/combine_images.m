%Reading two grayscale uint8 images
I = imread('Lena.png');
J = imread('Fruits.png');

%Adding the images using linear combination with output of type uint16
K = imlincomb(1,I,1,J,'uint16');

%Display of combined images
imshow(K,[]);% title('Super-imposed images');
%figure;

%Histogram dislay of the combined images
%imhist(K);title('Histogram after super-imposing');