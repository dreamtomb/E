function mr=maxrowf(U,c)
% 求矩阵 U 每列第 c 大元素所在行,c 的缺省值为 1
% 调用格式: mr = maxrowf(U,c)
% See also: addr
if nargin<2
    c=1;
end
N=size(U,2);mr(1,N)=0;
for j=1:N
    aj=addr(U(:,j),'descend');
    mr(j)=aj(c);
end
