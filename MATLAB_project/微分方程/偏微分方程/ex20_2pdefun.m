function [c,f,s]=ex20_2pdefun(x,t,u,dudx)
c=[1 1]';
f=[0.024 0.170]'.*dudx;
y=u(1)-u(2);
F=exp(5.73*y)-exp(-11.47*y);
s=[-F F]';