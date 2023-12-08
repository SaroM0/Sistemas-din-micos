function [activations] = forward_propagation(input,act_fun,weights,biases)
%UNTITLED Summary of this function goes here
%  Complete los espacios vacios. Hint: dado que este es un problema de
%  regresión, la última capa tiene función de activación lineal


W1 = weights{1};
W2 = weights{2};

b1 = biases{1};
b2 = biases{2};

Z1 = W1*input'+b1;
A1 = act_fun(Z1,0);

Z2 = W2 * A1 + b2;  % Completar
A2 = Z2;  % Completar

activations={A1,A2};
end

