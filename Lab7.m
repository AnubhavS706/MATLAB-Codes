% Digital Image Processing : Lab Task - 7
% Student: CTYCC22ECE601(Anubhav Sharma)
% Professor: Dr. Tapan Jain
% Date: 20 Feb 2023

word = 'ABBAS';
code = arithmetic_coding(word)

function code = arithmetic_coding(word)
alphabet = ['A', 'B', 'S'];
probability = [2/5, 2/5, 1/5];


left = 0;
right = 1;
cumulative_prob = [0, cumsum(probability)];


for i = 1:length(word)
    
    symbol_idx = find(alphabet == word(i));
    symbol_left = left + (right - left) * cumulative_prob(symbol_idx);
    symbol_right = left + (right - left) * cumulative_prob(symbol_idx+1);
    
    
    left = symbol_left;
    right = symbol_right;
end


code = (left + right) / 2;
end
