%% 先对多元函数分别求偏导，再求出Hessian阵
%   如果在驻点处，Hessian阵为正定阵，则为极小值
%   如果在驻点处，Hessian阵为负定阵，则为极大值
%   如果在驻点处，Hessian阵为不定阵，则不是极值点
clear
close 
clc
%定义符号变量，并列出目标函数
syms x y
f=x^3-y^3+3*x^2+3*y^2-9*x;
%分别求一阶偏导数
df=jacobian(f);%求一阶偏导数
d2f=jacobian(df);%求Hessian阵
[xx,yy]=solve(df);%求驻点
xx=double(xx);
yy=double(yy);
for i=1:length(xx)
    a=subs(d2f,{x,y},{xx(i),yy(i)});
    b=eig(a);%求矩阵的特征值
    f=subs(f,{x,y},{xx(i),yy(i)});
    f=double(f);
    if all(b>0)
        fprintf('(%f,%f)是极小值点，对应的极小值是%f\n',xx(i),yy(i),f);
    elseif all(b<0)
        fprintf('(%f,%f)是极大值点，对应的极大值是%f\n',xx(i),yy(i),f);
    elseif any(b>0)&any(b<0)
        fprintf('(%f,%f)不是极值点\n',xx(i),yy(i));
    else
        fprintf('无法判断（%f,%f）是否是极值点',xx(i),yy(i));
    end
end