%% 牛顿法求方程的根
function val=Newton(f)
%f是待求根方程，例：f=@(x)x*exp(x)-1
%% 算法实现
temp=func2str(f);%转化函数句柄为字符串
temp=temp(5:length(temp));
syms x
df=diff(temp,x);
if df==0
    disp('函数为常函数，请换一种算法');
    return;
end
df=matlabFunction(df);%将sym转化为func
begin=input('算法起始点是：begin=');
e=input('方程的根的精度是：e=');
fbegin=feval(f,begin);
dfbegin=feval(df,begin);
val=begin-fbegin/dfbegin;
error=abs(val-begin);
while(error>e)
    temp=val;
    fx=feval(f,temp);
    dfx=feval(df,temp);
    if dfx==0
        val=-99999999;
        disp('导数为0，请换一种算法');
        return;
    end
    val=temp-fx/dfx;
    error=abs(val-temp);
end
% format long;
fprintf('%s%f','方程的根为：',val);


