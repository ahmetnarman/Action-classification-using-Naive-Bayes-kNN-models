%%% Ahmet Narman,	
%%% ahmet.narman18@imperial.ac.uk,	
%%% CID: 01578741,	
%%% MSc. HBR
%%% Imperial College London

function label = NB_Classify(input, P)

[testSize, testDim] = size(input); % Size of the testing sample

prob = zeros(testSize, 5); % Probability of datapoints being in each one of
                           % the five classes

% Prior class probabilities found using class sizes in training sample
PC1 = P.size.cl1/P.size.all;
PC2 = P.size.cl2/P.size.all;    
PC3 = P.size.cl3/P.size.all;    
PC4 = P.size.cl4/P.size.all;    
PC5 = P.size.cl5/P.size.all;    
                           
for i = 1:testSize
    % The class probabilities are found under the assumption of gaussian
    % distrubution. Thus, for every class, a probability was found using a
    % jointly gaussian distrubution. The normalization constant is omited 
    % because it wont affect the final comparison    
    prob(i,1) = exp((-1/2)*(input(i,:)-P.mean.cl1)...
        *inv(P.cov.cl1)*(input(i,:)-P.mean.cl1)')*PC1;
    prob(i,2) = exp((-1/2)*(input(i,:)-P.mean.cl2)...
        *inv(P.cov.cl2)*(input(i,:)-P.mean.cl2)')*PC2;
    prob(i,3) = exp((-1/2)*(input(i,:)-P.mean.cl3)...
        *inv(P.cov.cl3)*(input(i,:)-P.mean.cl3)')*PC3;
    prob(i,4) = exp((-1/2)*(input(i,:)-P.mean.cl4)...
        *inv(P.cov.cl4)*(input(i,:)-P.mean.cl4)')*PC4;
    prob(i,5) = exp((-1/2)*(input(i,:)-P.mean.cl5)...
        *inv(P.cov.cl5)*(input(i,:)-P.mean.cl5)')*PC5;
end

logProb = log10(prob'); % Probabilities converted to log scale

[MaxVal, label] = max(logProb); % Index of the max probability is the 
                                % assigned label for the corresponding data

end