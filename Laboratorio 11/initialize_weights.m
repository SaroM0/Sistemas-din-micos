function [weights,biases] = initialize_weights(input_dim,hidden_neurons,output_dim)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here 

%se utiliza la inicialización de Xavier para inicializar los pesos de la
%red

W1 = randn(hidden_neurons,input_dim)*(sqrt(2/(input_dim+hidden_neurons)));
W2 = randn(output_dim,hidden_neurons)*(sqrt(2/(hidden_neurons+output_dim)));
b1 = zeros(hidden_neurons,1);
b2 = zeros(output_dim,1);

weights = {W1,W2};
biases = {b1,b2};
end

