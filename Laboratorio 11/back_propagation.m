function [grads] = back_propagation(predicted,input,activations,att_fun,weights)
%UNTITLED7 Summary of this function goes here
%  Complete los espacios vacios 

W1 = weights{1};
W2 = weights{2};
m = size(predicted,2);

% Hint= activations{2} corresponde a la predicción de la red

dZ2 = 2 * (activations{2} - predicted) .* att_fun(activations{2}, 1); %Completar
dW2 = (1/m)*dZ2*activations{1}';
db2 = (1/m) * sum(dZ2, 2); %Completar

dZ1 = (W2'*dZ2).*att_fun(activations{1},1);
dW1 = (1/m) * dZ1 * input; %Completar
db1 = (1/m)*sum(dZ1,2);

grads={dW1,db1,dW2,db2};

end

