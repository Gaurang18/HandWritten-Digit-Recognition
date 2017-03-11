function output = feedforward(input,bias, weight_matrix)
%num_of_rows in weight matrix = num of neurons in output layer
%num_of_cols in weight matrix = num of neurons in input layer + 1
% + 1 above is for the biases
    output = weight_matrix*input + bias;
    output = sigmf(output,[1,0]);
end

