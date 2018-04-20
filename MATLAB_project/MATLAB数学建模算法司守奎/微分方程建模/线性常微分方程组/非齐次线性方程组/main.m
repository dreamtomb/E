%% x'=[]x,x(0)=[];
syms x(t) y(t) z(t)
X=[x;y;z];
A=[2 1 3;0 2 -1;0 0 2];
B=[1 2 3]';
[x,y,z]=dsolve(diff(X)==A*X,X(0)==B);