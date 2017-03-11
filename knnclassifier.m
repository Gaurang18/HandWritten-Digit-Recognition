function [accuracy]=knnclassifier(k,feature_train,feature_test,a,b,label_train,label_test)

sizeDataTrain=a;
sizeDataTest=b;
labels=zeros(1,k);
correct=0;
incorrect=0;

confusionMatrix=zeros(10,10);

for i=1:sizeDataTest

    disp(i)
	
	% Difference of feature vector calculation
    difference=zeros(1,sizeDataTrain);
    for j=1:sizeDataTrain
        difference(j)=sum((feature_train(j,:)-feature_test(i,:)).^2);
    end
	
	%sort difference vector
    [~,sortedIndex] = sort(difference,'ascend'); 
     
    for j=1:k
        labels(j)=label_train(sortedIndex(j),1);
    end
    lbl=mode(single(labels));
	
	%test label
    if label_test(i)==lbl
        correct=correct+1;
    else
        incorrect=incorrect+1;
        
    end
	
	%confusion matrix update
    confusionMatrix(label_test(i)+1,lbl+1)=confusionMatrix(label_test(i)+1,lbl+1)+1;
end

%compute accuracy
accuracy=correct/sizeDataTest;
dlmwrite('myFile.txt', confusionMatrix);
end
