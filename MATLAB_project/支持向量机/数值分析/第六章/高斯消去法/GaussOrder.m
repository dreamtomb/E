%% 高斯消元法
function x=GaussOrder(A,b)
%A是系数矩阵A=[2 -1 3;4 2 5;1 2 0];
%b是常数b=[1;4;7];
%x是解
N = size(A);
n = N(1);
for i=1:n
    step=A(i,i);%对角线元素
    while(step==0)
        if(i==n)
            fprintf('%c(%d)%s','x',n,'可以是任何数');
        end
        step=A(i,:);
        A(i,:)=A(n,:);
        A(n,:)=step;
    end
    step=A(i,i);
    b(i)=b(i)/A(i,i);
    A(i,:)=A(i,:)/A(i,i);
    for j=(i+1):n
         ss=A(j,i);
         A(j,:)=A(j,:)-A(i,:)*ss;
         b(j)=b(j)-b(i)*ss;
    end
end
for i=n:-1:1
    s=0;
    for j=i+1:n
        s=s+A(i,j)*x(j);
    end
    x(i)=(b(i)-s)/A(i,i);
end
disp('方程组的解为：');
for i=1:length(x)
    disp(x(i));
end
