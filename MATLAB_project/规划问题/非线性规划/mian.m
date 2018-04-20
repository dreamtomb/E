% min z=x1^2+x2^2+8
% x1^2-x2>=0
% -x1-x2^2+2=0
% x1,x2>=0;
fun=@(x)x(1)^2+x(2)^2+8;
[x,fval]=fmincon(fun,[0;0],[],[],[],[],[0;0],[],'nonlinearcondition');



