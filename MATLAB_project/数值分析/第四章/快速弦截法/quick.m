%% 快速弦截法
function root=quick(f)
%f是方程比如f=@(x)x*exp(x)-1
a=input('方程的第一个起始点a是');
b=input('方程的第二个起始点b是');
e=input('方程的根的精度是：e=');
f1=feval(f,a);
f2=feval(f,b);
if(f1==0)
    root=a;
end
if(f2==0)
    root=b;
end
if(f1*f2>0)
    disp('两端点函数值乘积大于0!');
    return;
else
    error=100;
    root=b;
    r2=a;                         %迭代初始值
    while(error>e)
        r1 = r2;
        r2 = root;
        f1=feval(f,r1);
        f2=feval(f,r2);
        if(f1==0)
            root=r1;
        else
            if(f2==0)
                root = r2;
            else
                root=r2-(r2-r1)*f2/(f2-f1);          
            end
        end
        error=abs(root-r2);
    end
end
fprintf('%s%f\n','方程的根是：',root);