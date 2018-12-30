% Logistic regression batch rule, 2-class classifier
% takes as input training samples X Train, their true class labels Y Train, 
% the number of iterations iterNum, initial weights for linear classifier wInit, 
% and learning rate alpha. Runs logistic regression for iterNum number of iterations
% starting with wInit

function w = p6(X_Train,Y_Train, iterNum, wInit, alpha )

Xsiz = size(X_Train,1);     % total samples
Wsiz = size(wInit,1);       % total weights incl bias

% relabel all Y_train values to either 1 or 0
Y_t = ones(size(Y_Train)) * -1;
Y_t(Y_Train == max(Y_Train)) = 0;
Y_t(Y_Train == min(Y_Train)) = 1;

% concat ones column to X_Train for the bias if not already done
if size(X_Train,2) == Wsiz-1
    X_Train = [ones(Xsiz,1), X_Train];
end

% compute loss fn and update weight
w = wInit;
for i = 1:iterNum
    sig = sigmf(X_Train*w,[1 0]);
    loss = sum(repmat(Y_t - sig,1,Wsiz).*X_Train);
    w = w + alpha*loss';
end

end
