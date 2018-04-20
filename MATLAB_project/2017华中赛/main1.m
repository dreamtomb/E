%% 第一问unnormalized
%先根据邻接矩阵画出无向图
g=[0 1 1 1 1 1;
     1 0 1 1 0 0;
     1 1 0 1 0 0;
     1 1 1 0 0 0;
     1 0 0 0 0 1;
     1 0 0 0 1 0];
 graph(g);
 %聚类
res=SpectralClustering(g,0,2);
l1=find(res==1);
l2=find(res==2);
fprintf('%s\n%d\n%d\n%d\n%s\n%d\n%d\n%d\n','第一类顶点是：',l1(1),l1(2),l1(3),'第二类顶点是：',l2(1),l2(2),l2(3));