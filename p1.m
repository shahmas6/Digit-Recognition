%{
  Takes input samples X with their true labels Y and two specified labels l1 and l2
  returns only those smaples in X and labels in Y that correspond to l1 and l2
  output labels renamed to 1 and 2
%}
function [Xout, Yout] = p1(X,Y,l1,l2)

rows = [find(Y == l1); find(Y == l2)];

Xout = X(rows,:);
Yout = Y(rows);
Yout(Yout == min(l1,l2)) = 1;
Yout(Yout == max(l1,l2)) = 2;

end
