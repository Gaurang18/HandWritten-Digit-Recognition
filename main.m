testlabels = parseLabel('MNIST_data/t10k-labels.idx1-ubyte');
testimages = parseImage('MNIST_data/t10k-images.idx3-ubyte');
labels = parseLabel('MNIST_data/train-labels.idx1-ubyte');
images = parseImage('MNIST_data/train-images.idx3-ubyte');
knnclassifier(10,images,testimages,200,200,labels,testlabels)

sz = 200;
BW_data_train = preprocessing('MNIST_data/train-images.idx3-ubyte',sz);
%testlabels1 = preprocessing('MNIST_data/t10k-labels.idx1-ubyte',sz);
%testimages1 = preprocessing('MNIST_data/t10k-images.idx3-ubyte',sz);
labels1 = preprocessing('MNIST_data/train-labels.idx1-ubyte',sz);
images1 = preprocessing('MNIST_data/train-images.idx3-ubyte',sz);

images2 = feature_zoning(images1);
%testimages2 = feature_zoning(testimages1);
labels2 = feature_zoning(labels1);
%testlabels2 = feature_zoning(testlabels1);

knnclassifier(10,images2,testimages,200,1000,labels2,testlabels)
