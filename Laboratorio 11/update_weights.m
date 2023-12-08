function [update_weights,update_biases] = update_weights(weights,biases,grads,lr)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
W1 = weights{1}-lr*grads{1};
W2 = weights{2}-lr*grads{3};
b1 = biases{1}-lr*grads{2};
b2 = biases{2}-lr*grads{4};

update_weights={W1,W2};
update_biases={b1,b2};
end

