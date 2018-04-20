%% 求最小生成树的Kruskal算法的Matlab程序
function [T c]=kruskal(a)
n=size(a,1);
m=0;
for i=1:n-1
    for j=i+1:n
        if a(i,j)>0&a(i,j)<inf
            m=m+1;b(1,m)=i;b(2,m)=j;
            b(3,m)=a(i,j);
        end
    end
end
[B,i]=sortrows(b',3);B=B';
k=0;
t=1:n;
T=[];c=0;
for i=1:m 
    if t(B(1,i))~=t(B(2,i))
        k=k+1;
        T(:,k)=B(:,i);
        c=c+B(3,i);
        tmin=min(t(B(1,i)),t(B(2,i)));
        tmax=max(t(B(1,i)),t(B(2,i))); 
        for j=1:n
            if t(j)==tmax
                t(j)=tmin;
            end
        end 
    end
    if k==n-1 
        break;
    end
end
t,c
