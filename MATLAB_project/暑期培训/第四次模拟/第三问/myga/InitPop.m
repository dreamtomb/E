%% 初始化种群
%输入：
% NIND：种群大小
% N：   个体染色体长度（这里为区域的个数）  
%输出：
%初始种群
function Chrom=InitPop(NIND,N)
Chrom=zeros(NIND,N);%用于存储种群
for i=1:NIND
    A=rand(1,N); 
    S=sum(A);
    B=A*100/S;
    for j=1:9
        Chrom(i,j)=floor(B(j));%随机生成初始种群 
    end
    Chrom(i,10)=100-sum(Chrom(i,:));
end