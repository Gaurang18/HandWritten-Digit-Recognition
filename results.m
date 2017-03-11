for eta = 0.0:0.1:0.5
x = 100;
num_of_epochs = 4;
num_of_examples = 60000;
momentum_const = 0.8;

%for eta = 0.01:0.01:0.05
    sumresult = 0;
    [W1, W2, B1, B2] = backprop(x,eta,num_of_epochs,num_of_examples,momentum_const);
    res = testing(W1, W2, B1, B2);
 %   disp(eta);
    disp(res)
    plot(eta,res);
end
%end