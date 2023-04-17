% Digital Image Processing : Lab Task - 8
% Student: CTYCC22ECE601(Anubhav Sharma)
% Professor: Dr. Tapan Jain
% Date: 06 Mar 2023

clc;
clear all;
close all;
I = imread('trees.tif');
I = im2gray(I);
[R, C, D] = size(I);
subplot(2,3,1)
imagesc(I)
colormap gray
title('Orignal Image')

[LoD,HiD, LoR, HiR] = wfilters('haar');
[LL,LH,HL,HH] = dwt2(I,LoD,HiD,'mode','symh');
DWt_1 = [LL, LH; HL,HH];

subplot(2,3,2)
imagesc(DWt_1)
colormap gray
title('DWT')

Irec = idwt2(LL,LH,HL,HH,LoR,HiR);
subplot(2,3,3)
imagesc(Irec)
colormap gray
title('IDWT Image')
