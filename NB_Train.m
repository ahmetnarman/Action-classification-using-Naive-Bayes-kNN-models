%%% Ahmet Narman,	
%%% ahmet.narman18@imperial.ac.uk,	
%%% CID: 01578741,	
%%% MSc. HBR
%%% Imperial College London

function P = NB_Train(input, label)

cl1 = input(find(label==1),:); % All data belonging to class 1
cl2 = input(find(label==2),:); % All data belonging to class 2
cl3 = input(find(label==3),:); % All data belonging to class 3
cl4 = input(find(label==4),:); % All data belonging to class 4
cl5 = input(find(label==5),:); % All data belonging to class 5

[trainSize, trainDim] = size(input); % Size of the training sample

P = struct; % All the parameters, which is the output of the training func.

P.size.all = trainSize;  % size of the training data
P.size.cl1 = length(cl1); % Size of the sample that belongs to class 1 
P.size.cl2 = length(cl2); % Size of the sample that belongs to class 2
P.size.cl3 = length(cl3); % Size of the sample that belongs to class 3
P.size.cl4 = length(cl4); % Size of the sample that belongs to class 4
P.size.cl5 = length(cl5); % Size of the sample that belongs to class 5

P.mean.all = mean(input); % Means of the training data dimensions
P.mean.cl1 = mean(cl1); % Means of the sample that belongs to class 1 
P.mean.cl2 = mean(cl2); % Means of the sample that belongs to class 2 
P.mean.cl3 = mean(cl3); % Means of the sample that belongs to class 3 
P.mean.cl4 = mean(cl4); % Means of the sample that belongs to class 4 
P.mean.cl5 = mean(cl5); % Means of the sample that belongs to class 5 

P.cov.all = cov(input); % Covariance betwen the training data dimensions
P.cov.cl1 = cov(cl1); % Covariance of the sample that belongs to class 1 
P.cov.cl2 = cov(cl2); % Covariance of the sample that belongs to class 2 
P.cov.cl3 = cov(cl3); % Covariance of the sample that belongs to class 3  
P.cov.cl4 = cov(cl4); % Covariance of the sample that belongs to class 4
P.cov.cl5 = cov(cl5); % Covariance of the sample that belongs to class 5 

end
