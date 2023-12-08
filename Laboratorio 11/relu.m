function [output] = relu(input,derivate)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if derivate==0
    output=(input>0).*input;
else
    output=(input>0);
end

end

