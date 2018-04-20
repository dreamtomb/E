%% 求最小生成树的Prim算法的Matlab程序
function [T e]=prim(a)
T=[];
e=0;
v=1;
n=size(a,1);
c=2:n;
for j=2:n
    b(1,j-1)=1;
    b(2,j-1)=j;
    b(3,j-1)=a(1,j);
end
while size(T,2)<n-1 
    [m,i]=min(b(3,:));
    T(:,size(T,2)+1)=b(:,i);              
    e=e+b(3,i);
    v=b(2,i);
    t=find(c==b(2,i));c(t)=[];
    b(:,i)=[];
    for j=1:length(c)
        d=a(v,b(2,j));
        if d<b(3,j)
            b(1,j)=v;b(3,j)=d;
        end
    end
end
T;e;
