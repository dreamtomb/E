% min z=-x1-x2
% -4x1+2x2<=-1
% 4x1+2x2<=11
% -2x2<=-1
% x1,x2>=0,ÕûÊı
c=[-1 -1];
intcon=[1,2];
a=[-4 2;4 2;0 -2];
b=[-1;11;-1];
[x,fval]=intlinprog(c,intcon,a,b,[],[],zeros(2,1));



