%{
  Computes error rate and confusion matrix from classification results and
  true labels
%}
function [err, CONF] = p2(C,T)

% maximum digit in C and T, size of confusion matrix
m = max([C; T]);

i = sub2ind([m, m], T, C);
CONF = histcounts(i, 1:m^2+1);
CONF = reshape(CONF,m,m);

err = sum(C ~= T) / length(T);

end