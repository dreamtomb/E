%% 求解常微分方程组
%f''+3g=sinx
%g'+f'=cosx
%f'(2)=0,f(3)=3,g(5)=1
syms f(x) g(x)
df=diff(f);
[f1,g1]=dsolve(diff(f,2)+3*g==sin(x),diff(g)+df==cos(x));
f1=simplify(f1);
g1=simplify(g1);
[f2,g2]=dsolve(diff(f,2)+3*g==sin(x),diff(g)+df==cos(x),df(2)==0,f(3)==3,g(5)==1);
f2=simplify(f2);
g2=simplify(g2);
