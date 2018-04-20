%% 超松弛法
function val=SOR(A,b,x0)
%A是系数矩阵
%b是常数矩阵
%x0是初始值
%% 算法实现
w=input('请输入松弛因子w=');
e=input('请输入精度e=');
step=input('请输入最大迭代数step=');
if(w<=0 || w>=2)
    disp('松弛因子的范围应为【0,2】');
    return;
end
D=diag(diag(A));    %求A的对角矩阵
L=tril(A,-1);      %求A的下三角阵
U=triu(A,1);       %求A的上三角阵

B=inv(D+L*w)*((1-w)*D-w*U);
f=w*inv((D+L*w))*b;
val=B*x0+f;
n=1;                  %迭代次数

while norm(val-x0)>=e
    x0=val;
    val =B*x0+f;
    n=n+1;
    if(n>=step)
        disp('Warning: 迭代次数太多，可能不收敛！');
        return;
    end
end
disp('得到的解如下：')
val