% minZ=-4a+b+7c
% s.t.
% a+b-c=5 3a-b+c<=4
% a+b-4c<=-7 a,b>=0
c=[-4 1 7];
A=[3 -1 1;1 1 -4];
b=[4; -7];
Aeq=[1 1 -1];
beq=[5];
[x,fval]=linprog(c,A,b,Aeq,beq,zeros(2,1));