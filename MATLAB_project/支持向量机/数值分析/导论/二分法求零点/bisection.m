function val=bisection(f,step)
%% 这是二分法求根的函数
% step最多循环步数，防止死循环。
% f为待求根函数，例：
%若x^3-x-1=0，则f='x^3-x-1'
%% 算法实现
e=input('请输入求根精度:e=');
xlow=input('请输入求根区间下限:xlow=');
x=xlow;
vallow=eval(f);
xhigh=input('请输入求根区间上限:xhigh=');
x=xhigh;
valhigh=eval(f);
for i=1:step    
    if (xhigh-xlow)<e
        break;
    end
    xmid=(xlow+xhigh)/2;
    x=xmid;
    valmid=eval(f);
    if valmid*vallow<0
        xhigh=xmid;
    else
        xlow=xmid;
    end
end
val=xmid;
fprintf('%s%f%s%f%s%f%s%f','大致零点是'...
    ,val,'零点所在区间是:[',xlow,',',xhigh,'],精度为:',e);