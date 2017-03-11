function [W1new,W2new,B1new,B2new] = train_single_example(X,Y,W1,W2,B1,B2,eta)

%Doing work for single training example
%Assuming X as input column vector and Y the label vector
%Assuming W1 be the weight matrix for hidden layer
%Assuming W2 be the weight matrix for output layer
hidden_layer_output = feedforward(X,B1,W1);
output_layer_output = feedforward(hidden_layer_output,B2,W2);
delta_at_output = (output_layer_output-Y).*output_layer_output.*(1-output_layer_output);
delta_at_hidden = (delta_at_output'*W2)';
%Calculating deltaW
deltaW2 = -eta*(hidden_layer_output*delta_at_output')';
deltaW1 = -eta*(X*delta_at_hidden')';

W1new = W1+deltaW1;
W2new = W2+deltaW2;
B1new = B1 -eta * delta_at_hidden;
B2new = B2 -eta * delta_at_output;
