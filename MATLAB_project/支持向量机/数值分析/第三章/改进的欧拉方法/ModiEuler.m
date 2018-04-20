%% 改进的欧拉算法
function val=ModiEuler(f,h)
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
        v1=feval(f,x(i-1),val(i-1));
        temp=val(i-1)+h*v1;
        v2=feval(f,x(i),temp);
        temp2=val(i-1)+h*v2;
        val(i)=(temp+temp2)/2;
end
disp('计算结果如下：')
val

