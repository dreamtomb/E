function [dist,mypath]=normal_floyd(a,sb,db);
% 输入：a—邻接矩阵，元素(aij)是顶点i到j之间的直达距离，可以是有向的
% sb—起点的标号；db—终点的标号
% 输出：dist—最短路的距离；% mypath—最短路的路径
%% 算法实现
%首先a是邻接矩阵，就像normal_dijkstra中的例子一样 
%path记载了两点间的途径节点，比如path（1,4）=5
%说明1->4的最短路径是1->5->4
n=size(a,1); path=zeros(n);
for k=1:n
    for i=1:n
        for j=1:n
            if a(i,j)>a(i,k)+a(k,j)
                a(i,j)=a(i,k)+a(k,j);%a最后变成最短路径矩阵
                path(i,j)=k;
            end
        end
    end
end
dist=a(sb,db);
parent=path(sb,:); %从起点sb到终点db的最短路上各顶点的前驱顶点
parent(parent==0)=sb; %path中的分量为0，表示该顶点的前驱是起点
mypath=db; t=db;
while t~=sb
        p=parent(t); mypath=[p,mypath];
        t=p;
end
