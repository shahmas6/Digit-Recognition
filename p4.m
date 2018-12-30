% 2-class classifier

function C = p4(w,X)

b = w(1);       % bias
w = w(2:end);   % weights

C = b + X*w;

% Classifier: positive = class1, negative = class2
C(C>=0) = 1;
C(C <0) = 2;

end
