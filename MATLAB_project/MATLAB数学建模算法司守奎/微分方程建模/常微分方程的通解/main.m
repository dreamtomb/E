%% 求解常微分方程x^2+y+(x-2y)y'=0;
syms y(x)
dsolve(x^2+y+(x-2*y)*diff(y)==0);