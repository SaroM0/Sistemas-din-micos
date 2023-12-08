function [out] = sigmoid(input,derivate)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

if derivate==0
    out = 1./(1+exp(-input));
else
    out = input.*(1-input);
end

end

