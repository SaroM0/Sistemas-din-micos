function [out] = act_tanh(input,derivate)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if derivate==0
    out = (2./(1+exp(-2.*input)))-1;
else
    %En el caso de las derivadas la entrada corresponde a f(x) no a x
    out = 1-input.^2;
end

end

