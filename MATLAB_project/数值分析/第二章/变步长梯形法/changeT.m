%% 变步长梯形法算法
function val = changeT(f)
%f是函数
%e是精度
%% 算法实现
low=input('请输入积分下限:low=');
x=low;
flow=eval(f);
% flow=1;%sin(0)/0=1
high=input('请输入积分上限:high=');
x=high;
fhigh=eval(f);
e=input('请输入精确度:e=');
h=high-low;
T1=h*(flow+fhigh)/2;
%流程图是do-whiel形式
S=0;
x=low+h/2;
S=S+eval(f);
x=x+h;
while x<high
    S=S+eval(f);
    x=x+h;
end
T2=T1/2+S*h/2;
while abs(T2-T1)>=e
    h=h/2;
    T1=T2;
    S=0;
    x=low+h/2;
    S=S+eval(f);
    x=x+h;
    while x<high
        S=S+eval(f);
        x=x+h;
    end
    T2=T1/2+S*h/2;
end
val=T2;
fprintf('%s%f\n','变步长梯形法的结果是：',val);