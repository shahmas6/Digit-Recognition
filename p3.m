function C = p3(X_train, Y_train, X_test, k)

% size of test and training data
sizTest = size(X_test,1);   
sizTrain = size(X_train,1);

% repeat X_train for every test datum and
% repeat X_test for every training datum
X_train = permute(X_train,[3 2 1]);
X_train = repmat(X_train,sizTest,1,1);
X_test = repmat(X_test,1,1,sizTrain);

% distance (squared) b/w test datum and all training data
% calculated for all test data
absDiff = abs(X_train - X_test).^2;  
dist = sum(absDiff,2);

% the k smallest distances
[~,I] = sort(dist,3);
neighborsInd = I(:,:,1:k);

% corresponding true labels of k smallest distances
neighbors = Y_train(neighborsInd); 
C = mode(neighbors,3);

end