x= imread('leafy.jpg');
subplot(1,3,1)
imshow(x)
title('Original Image');


 [bw,rgb]=MaskGreen(x);
  
 
 subplot(1,3,2)
 imshow(bw);
 title('Black and White Image');
 
 subplot(1,3,3)
 imshow(rgb);
 title('Green part image');
 

 

