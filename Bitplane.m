clc; 
clear; 
close all;
b = imread('639436.jpg');
a = rgb2gray(b);
[r, c, p]=size(a);
if (p==3)
 error('Input image should be Grayscale')
else
 
[plane1,plane2,plane3,plane4,plane5,plane6,plane7,plane8]=bitplaneane_code(a);
end
figure;
 subplot(3,3,1);imshow(plane1);title('1st plane');
 subplot(3,3,2);imshow(plane2);title('2nd plane');
 subplot(3,3,3);imshow(plane3);title('3rd plane');
 subplot(3,3,4);imshow(plane4);title('4th plane');
 subplot(3,3,5);imshow(plane5);title('5th plane');
 subplot(3,3,6);imshow(plane6);title('6th plane');
 subplot(3,3,7);imshow(plane7);title('7th plane');
 subplot(3,3,8);imshow(plane8);title('8th plane')
 
rec=plane1+plane2*2+plane3*4+plane4*8+plane5*16+plane6*32+plane7*64+plane8*128;
 subplot(3,3,9);imshow(uint8(rec));title('Rec Img')
function [plane1, plane2, plane3, plane4, plane5, plane6, plane7, plane8]=bitplaneane_code(img)
[row, col]=size(img);
b=zeros(row,col,8);
for k=1:8
 for i=1:row
 for j=1:col
 b(i,j,k)=bitget(img(i,j),k);
 end
 end
end
plane1=b(:,:,1);
plane2=b(:,:,2);
plane3=b(:,:,3);
plane4=b(:,:,4);
plane5=b(:,:,5);
plane6=b(:,:,6);
plane7=b(:,:,7);
plane8=b(:,:,8);
end