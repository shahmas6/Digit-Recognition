%
% Finds weights w for a 2-class linear classifier by searching at random
%

function w = p5(X_train,Y_train,iterNum)

d1 = size(X_train,2) + 1;
minErr = 1;
w = zeros(d1,1);

for i = 1:iterNum
    testW = randn(d1,1);
   
    C = p4(testW, X_train);
    err = p2(C, Y_train);
    
    if err < minErr
        w = testW;
        minErr = err;
    end
end

end