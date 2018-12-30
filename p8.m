function W = p8(X_train, Y_train, iterNum, wInit,alpha)

% Total samples
xSiz = size(X_train,1);

% Augment with ones column and transpose data
X_train = [ones(xSiz,1), X_train]';
    
W = wInit;
for j = 1:iterNum
    for i = 1:xSiz
        WX = W*X_train(:,i);
        [MAX,Id] = max(WX);

        % Incorrect classification, update W
        if MAX ~= WX(Y_train(i))
            % Gradient of loss function
            gradLoss = zeros(size(W,1),size(X_train,1));
            gradLoss(Id,:) = -X_train(:,i);
            gradLoss(Y_train(i),:) = X_train(:,i);

            W = W + alpha*gradLoss;
        end

    end
end
