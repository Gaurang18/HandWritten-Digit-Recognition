function [W1, W2, B1, B2] = backprop(x,eta,num_of_epochs,num_of_examples,momentum_const)

testlabels = parseLabel('MNIST_data/t10k-labels.idx1-ubyte');
testimages = parseImage('MNIST_data/t10k-images.idx3-ubyte');
labels = parseLabel('MNIST_data/train-labels.idx1-ubyte');
images = parseImage('MNIST_data/train-images.idx3-ubyte');
knnclassifier(10,images,testimages,200,200,labels,testlabels)

sz = 200;
BW_data_train = preprocessing('MNIST_data/train-images.idx3-ubyte',sz);

for i= 1:sz
    images(i) = BW_data_train(i,:);
end

rng('shuffle');
W1 = randn(x,784); W2 = randn(10,x); B1 = randn(x,1); B2 = randn(10,1);
%load 'Copy_2_of_backup.mat';
deltaW1 = zeros(x,784); deltaW2 = zeros(10,x); deltaB1 = zeros(x,1); deltaB2 = zeros(10,1);
save('backup','W1','W2','B1','B2');
for j=1:num_of_epochs
    for i=1:num_of_examples
        Y = [0,0,0,0,0,0,0,0,0,0];
        temp = labels(i) + 1;
        Y(temp) = 1;
        image = images(i,:)';
        W1old = W1; W2old = W2; B1old = B1; B2old = B2;
        [W1 ,W2, B1, B2] = train_single_example(image,Y',W1,W2,B1,B2,eta);
        W1 = W1 + momentum_const.*deltaW1;
        W2 = W2 + momentum_const.*deltaW2;
        B1 = B1 + momentum_const.*deltaB1;
        B2 = B2 + momentum_const.*deltaB2;
        deltaW1 = W1-W1old;
        deltaW2 = W2-W2old;
        deltaB1 = B1-B1old;
        deltaB2 = B2-B2old;
    end
    disp(j)
end
