%% 牛顿插值公式
function [f,val]=newton(x,y,x0)
%x是已知数据的横坐标
%y是已知数据的纵坐标
%x0是带插值点的横坐标
%f是得到的多项式
%val是插值结果
%% 算法实现
if length(x)~=length(y)
    disp('您输入的维度不相等');
    return;
end
syms X;
len=length(x);
f=y(1);%f(x0)
y1=[];
L=1;
for i=1:len-1
    for j=i+1:len
        y1(j)=(y(j)-y(i))/(x(j)-x(i));%差商表第j列
    end
    temp(i)=y1(i+1);
    L=L*(X-x(i));
    f=f+temp(i)*L;
    simplify(f);
    y=y1;
end
f=matlabFunction(f);
val=feval(f,x0);
fprintf('%s%f%s%f\n','插值多项式为：',func2str(f),'插值结果为：',val);