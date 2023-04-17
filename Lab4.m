% Digital Image Processing : Lab Task - 4
% Student: CTYCC22ECE601(Anubhav Sharma)
% Professor: Dr. Tapan Jain
% Date: 13 Feb 2023

% Task 1.0 - Find the Entropy of a Given Image.
% Task 1.1 - Find Average Pixel Intensity, Median Pixel Value, Mode Pixel
%            Value.

clc;
clear;
close all;

% Task - 1.0
I = [1 1 1
     2 0 0
     3 3 3];
% Dimensions of Input Image
[row,col,depth] = size(I);

% Convert Color Image to Gray Scale
if depth ==3
    I = rgb2gray(I);
end

I = double(I);

% Calculating the Frequency of Every Pixel Intensity in the Input Image
Frequency = zeros(1,8);
for i = 1:row
    for j = 1:col
        for k = 0:(2^(row)-1)
            if I(i,j)==k
                Frequency(k+1)= Frequency(k+1)+1;
            end
        end
    end
end

% Calculating the Probablity of Each Pixel Value in the Input Image.
Probability = (1/(row*col))*Frequency;

% Entropy = summation(-p*log2(p)), for all pixels in 'I' with Probability 'p'
Entropy = 0;
for m = 1:(2^(row)-1)
    if(Probability(m)~=0)
        Entropy = Entropy + (Frequency(m))*(Probability(m))*(log2(Probability(m)));
    end
end
Entropy = -(Entropy);
% Task - 1.1
% Calculating Average Pixel Intensity
Sum_of_Pixels = 0;
for S = 1:(row*col)
    Sum_of_Pixels = Sum_of_Pixels + I(S);
end
Avg_Pixel_Intensity = Sum_of_Pixels/(row*col);

% Calculating Median Pixel Value
I_sort = sort(I(:)); % Sorts the Array I in Ascending Order
S = size(I_sort);
Index_of_Median = round(S(1)/2);
Median_Pixel_Value = I_sort(Index_of_Median);

% Calculating Mode Pixel Value
% Intensity Levels ->  0   1  2  3  4  5  6  7
% Frequency        ->  2   3  1  3  0  0  0  0
[Maximum_Frequency_Value,Max_Frequency_Index] = max(Frequency);
Mode_Pixel_Value = (Max_Frequency_Index-1);
