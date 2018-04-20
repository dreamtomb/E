%% 四阶经典格式龙格库塔算法
function val=lungkuta4(f, h)
%f是一阶常微分方程的右端函数
%例如：f=@(x,y) y-2*x/y
%h是积分步长
%% 算法实现
low=input('请输入自变量下限：low=');
high=input('请输入自变量上限：high=');
first=input('请输入函数初值:first=');
N=(high-low)/h;
val=zeros(N+1,1);
val(1)=first;
x=low:h:high;
for i=2:N+1
    K1=feval(f,x(i-1),val(i-1));
    K2=feval(f,x(i-1)+h/2,val(i-1)+K1*h/2);
    K3=feval(f,x(i-1)+h/2,val(i-1)+K2*h/2);
    K4=feval(f,x(i-1)+h,val(i-1)+h*K3);
    val(i)=val(i-1)+h*(K1+2*K2+2*K3+K4)/6;
end
disp('计算结果如下：')
val

