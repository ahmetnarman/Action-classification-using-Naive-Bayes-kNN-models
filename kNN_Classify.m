%%% Ahmet Narman,   
%%% ahmet.narman18@imperial.ac.uk,  
%%% CID: 01578741,  
%%% MSc. HBR
%%% Imperial College London
 
function label = kNN_Classify(input, P)
 
% Training data and labels combined, training data normalized
train = [P.data(:,1) (P.data(:,2:65)-P.mean)./P.std];
 
[trainSize, trainDim] = size(train); % Training sample size 
 
 
test = (input-P.mean)./P.std; % Normalized testing data
[testSize,testDim] = size(test); % Testing sample size
 
% Closest neighbours will be put in this matrix
closestNeighbours = zeros(P.k, testSize);
% Neighbour distances will be put in this array
NeighDist = zeros(1,P.k);
% Distance weighted sums will be put in this matrix for every class
classDistSum = zeros(testSize,5);
 
for i = 1:testSize
    % Below parameter is the Euclidian distances of training data
    % their corresponding classes are included as well.
    dist=[sqrt(sum((train(:,2:65) - test(i,:)).^2'))' train(:,1)];
    % The minimum distance was found 'k' times in this loop
    for j = 1:P.k
        [M,I] = min(dist(:,1)); % Finding the neighbour with min distance
        closestNeighbours(j,i) = dist(I,2); % Adding to the neighbour list
        dist(I,1)=max(dist(:,1)); % Increasing that value to find the
                                  % next minimum distance in the dist var.
        NeighDist(1,j) = M; % Neighbour distance recorded
    end 
    % Weighted sum for each class was found where weights are inverse
    % squared distances. Lower the distance, higer the weight
    classDistSum(i,1) = sum(1./NeighDist(closestNeighbours(:,i)==1));
    classDistSum(i,2) = sum(1./NeighDist(closestNeighbours(:,i)==2));
    classDistSum(i,3) = sum(1./NeighDist(closestNeighbours(:,i)==3));
    classDistSum(i,4) = sum(1./NeighDist(closestNeighbours(:,i)==4));
    classDistSum(i,5) = sum(1./NeighDist(closestNeighbours(:,i)==5));  
end
 
[M,label] = max(classDistSum'); % Assigning the class label according to
                                %  argmax rule
end
