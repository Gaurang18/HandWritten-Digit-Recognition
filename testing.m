function [res] = testing(W1, W2, B1, B2)
testlabels = parseLabel('MNIST_data/t10k-labels.idx1-ubyte');
testimages = parseImage('MNIST_data/t10k-images.idx3-ubyte');
res = 0;
for i=1:10000
    Y = [0,0,0,0,0,0,0,0,0,0];
    temp = testlabels(i) + 1;
    Y(temp) = 1;
    image = testimages(i,:)';
    out1 = feedforward(image,B1,W1);
    out2 = feedforward(out1,B2,W2);
    [va,ind] = max(out2);
    if (ind==temp)
        res = res + 1;
    end
end