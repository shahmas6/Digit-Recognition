% Multi-class linear classifier
% assigns samples from X using weight W
% returns classes assigned, C, to each X sample

function C = p7(W,X)

% concat ones column to X_Train for the bias if not already done
if size(X,2) == size(wInit,1) - 1
	X = [ones(size(X,1),1), X];
end

[~,index] = max(W*X');
C = index';

end