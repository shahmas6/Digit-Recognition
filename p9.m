function W = p9(X_Train,Y_Train, iterNum, WInit, alpha )

% Total samples
xSiz = size(X_Train,1); 

% Augment with ones column and transpose data
X_Train = [ones(xSiz,1), X_Train]';
    
W = WInit;
for j = 1:iterNum
    for i = 1:xSiz
        WX = W*X_Train(:,i);
        sm = softmaxx(WX);
        
        W = W + alpha*(zeros(size(W,1),1)*Y_Train(i) - sm)*X_Train(:,i);
    end
end

end

function sm = softmaxx(a)

ep = exp(a);
sm = ep/sum(ep);

end