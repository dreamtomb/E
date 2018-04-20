%% 高斯-塞德尔迭代
function val=gauss_seidel(A,b,x0)
%A是系数矩阵
%b是常数矩阵
%x0是初始值
%% 算法实现  
e=input('请输入解的精度e：');
step=input('请输入最大迭代次数step:');
D=diag(diag(A));    %求A的对角矩阵
L=tril(A,-1);      %求A的下三角阵
U=triu(A,1);       %求A的上三角阵
G=-(D+L)\U;
f=(D+L)\b;
val=G*x0+f;
n=1;                  %迭代次数
while val-x0>e
    x0=val;
    val=G*x0+f;
    n=n+1;
    if(n>=step)
        disp('Warning: 迭代次数太多，可能不收敛！');
        return;
    end
end
disp('得到的解如下：')
val
