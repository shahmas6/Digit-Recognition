%{
  2-Class classifier
  
%}
function [Xout, Yout] = p1(X,Y,l1,l2)

rows = [find(Y == l1); find(Y == l2)];

Xout = X(rows,:);
Yout = Y(rows);
Yout(Yout == min(l1,l2)) = 1;
Yout(Yout == max(l1,l2)) = 2;

end