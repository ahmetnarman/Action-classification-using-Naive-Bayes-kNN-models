%%% Ahmet Narman,   
%%% ahmet.narman18@imperial.ac.uk,  
%%% CID: 01578741,  
%%% MSc. HBR
%%% Imperial College London
 
function P = TrainClassifierX(input, label)
 
P.mean = mean(input); % Mean of training samle for normalization
P.std = std(input); % Std of training sample for normalization
 
allData = [label input]; % Labels combined with the inputs
 
P.data = allData; % All the input and the labels are taken as parameters
 
P.k = 4; % The optimal 'k' for distance weighted KNN 
 
end
