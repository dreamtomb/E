clc,clear
%% dijkstra解决最短路问题(假设从第一个顶点到其余顶点)
%无向赋权图
%邻接矩阵初始化
a=zeros(6); 
a(1,2)=50;a(1,4)=40;a(1,5)=25;a(1,6)=10;
a(2,3)=15;a(2,4)=20;a(2,6)=25;
a(3,4)=10;a(3,5)=20;
a(4,5)=10;a(4,6)=25;
a(5,6)=55;
a=a+a';
index=find(a==0);
a(index)=65535;
%% 算法主题
%初始化各个数组
pb=zeros(1,length(a));%保存是否访问过该点的标志
pb(1)=1;
index1=zeros(1,length(a));%保存顶点的顺序
index1(1)=1;
index2=zeros(1,length(a));%保存顶点索引
for i=1:length(a)
    d(i)=a(1,i);%保存顶点一到其余顶点的最短路径
end
temp=1;% 最新的得到min值的点
%循环遍历
while (length(find(pb==0)))~=0
    %找到所有的未访问过得点，更新他们的最小值
    index=find(pb==0);
    pindex=find(pb==1);
    for i=1:length(pindex)
        d(index)=min(d(index),d(pindex(i))+a(pindex(i),index));
    end
    %假如有多个点同时达到最小值，只将最前面的设置为访问过，
    %并将这一点加入访问路径顺序index1中
    temp=find(d(index)==min(d(index)));
    pb(index(temp(1)))=1;
    index1=[index1,index(1)];
end
index=find(d==65535);
d(index)=inf;
d




