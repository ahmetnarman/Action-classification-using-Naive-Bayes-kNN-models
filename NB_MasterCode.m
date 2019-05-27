%%% Ahmet Narman,	
%%% ahmet.narman18@imperial.ac.uk,	
%%% CID: 01578741,	
%%% MSc. HBR
%%% Imperial College London

close all;
clear all;

load('data.mat');

[dataSize,dataDim] = size(data); % Size of the dataset
trainSize = 0.8*dataSize; % Training data size
testSize = dataSize - trainSize; % Testing data size

t=10; % Number or repetition for training-testing

perf = zeros(1,t); % Testing performance to be stored here

for i=1:t
    tic % To keep track of time
    
    randomData = data(randperm(size(data,1)),:); % The dataset is shuffled

    train_data = randomData(1:trainSize, 2:end);
    train_label = randomData(1:trainSize, 1);
    test_data = randomData(trainSize+1:end, 2:end);
    test_label = randomData(trainSize+1:end, 1);
    
    % Training and classifying
    param = NB_Train(train_data, train_label);
    label_out = NB_Classify(test_data, param);
    
    Corr = label_out' == test_label;% To find correctly classified elements
    perf(i) = sum(Corr)*100/testSize; % Performance in percentage 
    toc % To find the time for training and classifying
end

% Average and std values of the performance
avgPerf = mean(perf)
stdPerf = std(perf)

% To calculate the confusion matrix
cl1Err = zeros(1,5);
cl2Err = zeros(1,5);
cl3Err = zeros(1,5);
cl4Err = zeros(1,5);
cl5Err = zeros(1,5);
%Confusion matrix elements for the last train-test pair is calculated 
for i=1:5
    cl1Err(i)=sum(label_out(test_label==1)'==i)*100/sum(test_label==1);
    cl2Err(i)=sum(label_out(test_label==2)'==i)*100/sum(test_label==2);
    cl3Err(i)=sum(label_out(test_label==3)'==i)*100/sum(test_label==3);
    cl4Err(i)=sum(label_out(test_label==4)'==i)*100/sum(test_label==4);
    cl5Err(i)=sum(label_out(test_label==5)'==i)*100/sum(test_label==5);
end
