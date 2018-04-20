clc,clear,close all
fun = 'sum((x-0.2).^2)';
x0 = [0.25, 0.25, 0.25]; 
[x,fval] = fseminf(fun,x0,1,@myysw)
[c,ceq,K1] = myysw(x,[0.5,0.5]);  % 样本间距为0.5
max(max(K1))

