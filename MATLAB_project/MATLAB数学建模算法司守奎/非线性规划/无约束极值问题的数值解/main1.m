%%分别利用fminunc和fminsearch求极小值
%目标函数：x^3-y^3+3*x^2+3*y^2-9*x
clear
clc
%% fminunc函数
%利用函数句柄,fminunc求极小值
f=@ (x) x(1)^3-x(2)^3+3*x(1)^2+3*x(2)^2-9*x(1);
g=@ (x) -f(x);
[xy,z]=fminunc(f,rand(2,1));
fprintf('%s%f\n%s%f\n%s%f\n','极值点的x为：',xy(1),...
    '极值点的y为',xy(2),'极值点的z为',z)
%fminunc求极大值
[xy,z]=fminunc(g,rand(2,1));
fprintf('%s%f\n%s%f\n%s%f\n\n\n\n','极值点的x为：',xy(1),...
    '极值点的y为',xy(2),'极值点的z为',-z)

%% fminsearch函数
%利用函数句柄,fminsearch求极小值
f=@ (x) x(1)^3-x(2)^3+3*x(1)^2+3*x(2)^2-9*x(1);
g=@ (x) -f(x);
[xy,z]=fminsearch(f,rand(2,1));
fprintf('%s%f\n%s%f\n%s%f\n','极值点的x为：',xy(1),...
    '极值点的y为',xy(2),'极值点的z为',z)
%fminsearch求极大值
[xy,z]=fminsearch(g,rand(2,1));
fprintf('%s%f\n%s%f\n%s%f\n','极值点的x为：',xy(1),...
    '极值点的y为',xy(2),'极值点的z为',-z)