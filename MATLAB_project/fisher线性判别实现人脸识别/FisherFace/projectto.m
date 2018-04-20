function vsort=projectto(sw,sb,num)
%计算sw/sb投影的最优向量
%sw为类内协方差矩阵，sb是类间协方差矩阵
%vsort为最优投影向量
invSw=inv(sw);
newspace=invSw*sb;
[x y]=eig(newspace);
d=diag(y);
[d1 index1]=dsort(d);
for i=1:num
    vsort(:,i)=x(:,index1(i));
end