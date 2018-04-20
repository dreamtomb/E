%% 雅克比迭代法
function val=jacobi(A,b,x0)
%A是系数矩阵,如：A=[10 -1 -2;-1 10 -2;-1 -1 5];
%b是常数矩阵,如：b=[7.2;8.3;4.2];
%x0是初始值
%% 算法实现
e=input('请输入解的精度e：');
step=input('请输入最大迭代次数step:');
D=diag(diag(A));    %求A的对角矩阵,diag一次是向量，两次是矩阵
L=tril(A,-1);      %求A的下三角阵
U=triu(A,1);       %求A的上三角阵
G=-D\(L+U);     %只能左除，右除会出错
f=D\b;
val=G*x0+f;
n=1;                  %迭代次数

while (val-x0)>e
    x0=val;
     val=G*x0+f;
    n=n+1;
    if(n>=step)
        disp(' 迭代次数超出，可能不收敛！');
        return;
    end
end
disp('得到的解如下：');
val

