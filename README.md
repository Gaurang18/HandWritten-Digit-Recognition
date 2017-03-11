# Hand Written Digit Recognition using Backpropagation Algorithm

The objective of the project is to generate an Artificial Neural Network (ANN) for hand written
digit recognition application using two variations of BP algorithm variations of Back Propagation
(BP) algorithm: simple BP and BP with momentum. Different patterns of handwritten digits are
used to analyze the performance of BP algorithm. The criteria of performance being the
accuracy and amount of time taken. Various parameters such as learning rate, number of
hidden neurons in hidden layer, momentum term and number of training iterations are used
during the analysis of the BP algorithm.

INTRODUCTION:-

Digit recognition is important to the overall system in terms of performance (accuracy and
speed). In recent years, different algorithms and classification approaches have been presented
to solve this problem. Digit recognition is an important component of handwritten character
recognition system due to its wide application. From more than three decades can achieve high
classification high recognition rates in the area of recognition of handwritten numerals
Artificial Neural Networks (ANN) has been intensively used to solve the complex engineering
problems. In ANN the basic element is the neuron which is from the nerves system of the
human. Neuron can be a computational and communication function. Herein we have used "log
sigmoid" function. The flow of information in ANN is in parallel manner while the knowledge is
distributed among the processing units or neurons
Some Parameters of artificial neural network while constructing considered are:

• Learning rate
• Accuracy of results
• Momentum Tern
• Number of iterations used to train the Neural Network Model
• Architecture of the Neural Network
• Numer of hidden neurons in the hidden layer.

The main difference between in simple Back propagation and Back propagation with
Momentum is the way by which weights are adjusted. The Back propagation with momentum
uses an additional factor of momentum. In Back propagation neural network, the learning rate
parameter can have a significant effect on generalization accuracy. The selection of small or
large learning rate affects the generalization accuracy and training the neural network
architecture directly

Ref:- https://www.tutorialspoint.com/artificial_intelligence/artificial_intelligence_neural_networks.htm

TRAINING AND TESTING :-

1. Data Sets:-

The neural network uses MNIST as the benchmark dataset of images of segmented handwritten
digits. MNIST database includes a training set of 60,000 images and a test set of 10,000
images. The MNIST digit database contained fixed size images and digit image (foreground
pixels) is center alignment with respect to the background pixels. The MNIST digit database is
good database for applying learning techniques and patterns recognition methods

2. Training:-

Training sets are used to train and adjust the weights of ANN. The idea is that we do not want
to make the ANN too specific, making it give precise results for the training data, but incorrect
results for all other data (in case of new input). Otherwise ANN would be over-fitted.

3. Testing:-

The performance of neural network system is compared using different value to different
learning rates for Backpropagation algorithm. The system also compares the efficiency when
the momentum is changed.

PSEDO CODE AND IMPLEMENTATION PROCEDURE:-

Files :

1. train_single_example.m
2. backprop.m
3. feedforward.m
4. results.m
5. testing.m


backprop.m contains :-
function [W1, W2, B1, B2] = backprop(num_of_hidden_neurons,eta,num_of_epochs,num_of_examples,momentum_const)

It takes training parameters in the function and returns the weight matrixes after training from
MNIST database using backpropagation with stochastic gradient descent. Following is
pseudocode of backprop.m

1. Load input images and its respective labels from database into 60000X784 matrix. and
60000X1 matrix and randomly initialize weight and bias matrices.
2. For each input image:-
a)call the 'train_single_example' function to get new weight using back propagation algorithm
without using momentum.
b)Include momentum term using the previous ΔW to get new set of weights
c) Store the new ΔW for subsequent calls.
3. Return the calculate weight matrix.
train_single_example.m does the following for each input example:
a) Feedforward --> Calculate hidden_layer_output and output_layer_output.
b) Calculate δ for output layer neurons.
c) Backpropagate δ for hidden layer neurons.
d) Calculate ΔW using δ calculate above in b) and c).
e) Update and return new weight matrix W using the above ΔW.
testing.m --> uses the testing data to return the number of correctly matched images of digits.
results.m --> is the wrapper for backprop.m, is used to find the relationship between testing
result and parameters. It is the final result file.


Results:-
Model was trained using the MNIST database.
Maximum accuracy of 91.3% was observed for the testing data.
Number of images in test database = 10000

PAPERS REFFERED :-

http://www.sciencedirect.com/science/article/pii/S0031320311004006
https://cs.nyu.edu/~wanli/dropc/dropc.pdf
http://ce.sharif.edu/courses/85-86/2/ce667/resources/root/15%20-
%20Convolutional%20N.%20N./fugu9.pdf
http://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=5625732
