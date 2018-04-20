%% 牛顿下山法
function val=NewtonDown(f,alpha)
% f为待求根函数
% alpha为下山因子
%% 算法实现
begin=input('请输入起始点：begin=');
e=input('请输入精度:e=');
error=1;
temp=func2str(f);%转化函数句柄为字符串
temp=temp(5:length(temp));
syms x
fun=diff(temp,x);
fun=matlabFunction(fun);
val=begin;
while(error>e)
    r1=val;
    fx=feval(f,r1);
    dfx=feval(fun,r1);
    val=r1-alpha*fx/dfx;
    error=abs(val-r1);
end
fprintf('%s%f','方程的近似根为：',val);
