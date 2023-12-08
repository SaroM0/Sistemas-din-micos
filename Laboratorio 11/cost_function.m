function [cost] = cost_function(target,prediction)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
cost = (1/size(target,2))*sum((target-prediction).^2);
end

