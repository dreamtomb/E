function [newsample basevector]=pca(patterns,num)
%主分量分析程序，patterns表示输入模式向量，num为控制变量，当num大于1的时候表示
%要求的特征数为num，当num大于0小于等于1的时候表示求取的特征数的能量为num
%输出：basevector表示求取的最大特征值对应的特征向量，newsample表示在basevector
%映射下获得的样本表示。
[u v]=size(patterns);
totalsamplemean=mean(patterns);
for i=1:u
    gensample(i,:)=patterns(i,:)-totalsamplemean;
end
sigma=gensample*gensample';
[U V]=eig(sigma);
d=diag(V);
[d1 index]=dsort(d);
if num>1
    for i=1:num
        vector(:,i)=U(:,index(i));
        base(:,i)=d(index(i))^(-1/2)* gensample' * vector(:,i);
    end
else
    sumv=sum(d1);
    for i=1:u
        if sum(d1(1:i))/sumv>=num
            l=i;
            break;
        end
    end
    for i=1:l
        vector(:,i)=U(:,index(i));
        base(:,i)=d(index(i))^(-1/2)* gensample' * vector(:,i);
    end
end
newsample=patterns*base;
basevector=base;