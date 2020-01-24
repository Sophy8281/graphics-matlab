y= imread('leafy.jpg');
subplot(2,3,1)
imshow(y);
gray = rgb2gray(y);

title('Original Image');

[bw,rgb]=MaskYellow(y);
  
 
 subplot(2,3,2)
 imshow(bw);
 title('Black and White Image');
 
 subplot(2,3,3)
 imshow(rgb);
 title('Yellow part image');
 
 subplot(2,3,4)
 imhist(gray);
 title('Original Image Histogram');
 

