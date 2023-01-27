% Digital Image Processing : Lab Task - 2
% Student: CTYCC22ECE601(ANUBHAV SHARMA)
% Professor: Dr. Tapan Jain
% Date: 23 Jan 2023

% Task 1.0 - Generate Image using pixel value and Display it
% Task 1.1 - Generate Histogram of Input Image
% Task 1.2 - Histogram Equalization of Input Image
% Task 1.3 - Plot Input Image, Input Histogram, Output Image, Output Histogram


clc;
clear all;
close all;
% Input Image
I = [52	55	61	59	79	61	76	61
     62	59	55	104	94	85	59	71
     63	65	66	113	144	104	63	72
     64	70	70	126	154	109	71	69
     67	73	68	106	122	88	68	68
     68	79	60	70	77	66	58	75
     69	85	64	58	55	61	65	83
     70	87	69	68	65	73	78	90];
 
 I = uint8(I);
 % Dimensions of Input Image
 [row,col,depth] = size(I);

% Convert Color Image to Gay Scale
if depth ==3
    I = rgb2gray(I);
end

I = double(I);
% Histogram of Input Image
HIn = zeros(1,256);
for i = 1:row
    for j = 1:col
        for k1 = 0:255
            if I(i,j)==k1
                HIn(k1+1)= HIn(k1+1)+1;
            end
        end
    end
end

% Histogram Equalization

% Normalization of Input Histogram
Histnorm = (1/(row*col))*HIn;

% Generating CDF of Input Histogram
Histcdf = zeros(1,256);
Histcdf(1)= Histnorm(1);
for i=2:256
    Histcdf(i)=Histcdf(i-1)+Histnorm(i);
end

% De-Normalize CDF
Histcdf = round(255*Histcdf);
%Generate Output Image
Ih = zeros(row,col);
for i=1:row
    for j=1:col
        pix = (I(i,j)+1);
        Ih(i,j)= Histcdf(pix);
    end
end

% Histogram of Ouput Image
HistOut = zeros(1,256);
for i =1:row
    for j=1:col
        for k=0:255
            if Ih(i,j) ==k
                HistOut(k+1)= HistOut(k+1)+1;
            end
        end
    end
end

% Plots
%Input Image
subplot(2,2,1);
imshow(uint8(I));
title("Input Image");

% Histogram of Input Image
subplot(2,2,2);
plot(HIn);
title("Input Images's Histogram");
xlabel("Gray Levels");
ylabel("Frequency");


% Output Image
subplot(2,2,3);
imshow(uint8(Ih));
title("Histogram Equalized Image");

% Histogram of Output Image
subplot(2,2,4);
plot(HistOut);
title("Output Images's Histogram");
xlabel("Gray Levels");
ylabel("Frequency");




            

