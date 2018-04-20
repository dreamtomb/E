%%
clc,clear,close all
f = [-5; -4; -6];
A =[1 -1  1;3  2  4;3  2  0];
b = [20; 42; 30];
lb = zeros(3,1);
[x,fval,exitflag,output,lambda] = linprog(f,A,b,[],[],lb)
lambda.ineqlin
lambda.lower
%%
clc,clear,close all
H=[0,-1;-1,0];
f=[0;0];
Aeq=[1 1];
b=2;
[x,fval,exitflag,output,lambda] = quadprog(H,f,[ ],[ ],Aeq,b)
