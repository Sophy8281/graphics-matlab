%Read Image
i = imread('cameraman.jpg');

I = rgb2gray(i);

%Binary conversion
bw1 = im2bw(I,0.03);
bw2 = im2bw(I,0.0);
bw3 = im2bw(I,0.2);
bw4 = im2bw(I,0.4);

subplot(1,5,1); imshow(I); title('Original');
subplot(1,5,2); imshow(bw1); title('im2bw--0.03');
subplot(1,5,3); imshow(bw2); title('im2bw--0.0');
subplot(1,5,4); imshow(bw3); title('im2bw--0.2');
subplot(1,5,5); imshow(bw4); title('im2bw--0.4');