 %%
syms a b h y L
m=sqrt(b^2-y^2);
m1=int(m);
m2=int(m,'-b','n')
m2 =(b^2*asin(b/(b^2)^(1/2)))/2 + (b^2*asin(n/(b^2)^(1/2)))/2 + (n*(b^2 - n^2)^(1/2))/2
 
m3=subs(m2,'n','y');
S=2*a/b*m3;
simplify(S)
