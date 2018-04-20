%% 迭代法求方程的根
function val=iteration(f)
%f是待求根的函数
%% 算法的实现
x0=input('请输入迭代起点：x0=');
e=input('请输入期望的解的精度：e=');
N=input('请输入最大迭代数：N=');
val=9999;
for i=1:N
    x1=feval(f,x0);
    if abs(x1-x0)<e
        val=x1;
        return;
    else
        x0=x1;
    end
end
fprintf('%s%f','迭代结果是：',val);