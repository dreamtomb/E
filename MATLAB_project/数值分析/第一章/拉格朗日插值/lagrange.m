%% 拉格朗日插值函数
function y0=lagrange(x,y,x0)
%插值节点分别以 x, y 输入
%待插值点以数组 x0 输入,输出数组y0为插值
%% 算法实现
if length(x)~=length(y)
    disp('您输入的点维度不一致');
    return;
end
y0=zeros(1,length(x0));
n=length(x);
m=length(x0);
for i=1:m
    xx=x0(i);
    res=0.0;
    for k=1:n
        p=1.0;
        for j=1:n
            if j~=k
                p=p*(xx-x(j))/(x(k)-x(j));
            end
        end
        res=p*y(k)+res;
    end
    y0(i)=res;
end
disp('插值结果如下：');
for index=1:m
    fprintf('%s%f%s%f%s','(',x0(index),',',y0(index),')');
end