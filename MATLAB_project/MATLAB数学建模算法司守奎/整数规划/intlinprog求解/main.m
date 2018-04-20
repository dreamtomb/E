%% min z=-3x1-2x2-x3
%   x1+x2+x3<=7
%   4x1+2x2+x3=12
%   x1,x2>=0
%   x3=0»ò1

c=[-3 -2 -1];
intcon=3;
a=[1 1 1];
b=[7];
aeq=[4 2 1];
beq=[12];

x=intlinprog(c,intcon,a,b,aeq,beq,zeros(3,1),[inf;inf;1]);