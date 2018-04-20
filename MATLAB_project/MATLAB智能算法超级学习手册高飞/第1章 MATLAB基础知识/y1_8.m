%%
syms H C K x
T=(H/C)*((1/cos(x))+[1+(K-tan(x))^2]^(1/2));

dfdx=diff(T,x)
a=solve(dfdx,'x');

tan(a)
