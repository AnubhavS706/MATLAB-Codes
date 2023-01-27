   % this file extracting layers from color image %
       % created by anubhav (CTYCC22ECE601) %

clc
close all
clear all
I = imread('667555.jpg');
imshow(I)

     %this is the red layer output will be a grayscale image   %
figure(1)
Ir=I(:,:,1);
imshow(Ir)

     %this is the green layer output will be a grayscale image  %
figure(2)
Ig=I(:,:,2);
imshow(Ig)

     %this is the blue layer output will be a grayscale image  %
figure(3)
Ib=I(:,:,3);
imshow(Ib)

     %this is the red color layer output will be a red color image  %
     % because we are doing 2nd and 3rd layer color pixel value = 0 %
figure(4)
IR=I;
IR(:,:,2)=0;
IR(:,:,3)=0;
imshow(IR)

      %this is the green color layer output will be a green color image  %
figure(5)
IG=I;
IG(:,:,1)=0;
IG(:,:,3)=0;
imshow(IG)

     % this is the green color layer output will be a green color image  %
figure(6)
IB=I;
IB(:,:,1)=0;
IB(:,:,2)=0;
imshow(IB)




