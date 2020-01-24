I = imread('blood.tif');
figure(1), imshow(I);title('Original-Image');
figure(2), imshow(I), colormap(jet(16));title('--jet(16)--');
figure(3), imshow(I), colormap winter;title('--Winter--');
figure(4), imshow(I), colormap autumn;title('--Autumn--');
figure(5), imshow(I), colormap summer;title('--Summer--');
figure(6), imshow(I), colormap pink;title('--Pink--');
figure(7), imshow(I), colormap lines;title('--Lines--');