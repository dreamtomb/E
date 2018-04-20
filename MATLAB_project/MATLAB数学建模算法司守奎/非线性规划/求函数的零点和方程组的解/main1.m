%% 求多项式f(x)=x^3-x^2+2*x-3的零点
clear
clc
%法1
x=[1 -1 2 -3];
x=roots(x);

%法2
syms x
x=solve(x^3-x^2+2*x-3);
x=vpa(x,5)

%法3
y=@(x)x^3-x^2+2*x-3;
x=fsolve(y,rand);