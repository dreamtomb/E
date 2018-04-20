clc,clear,close all
load('jlx.mat')
x=jlx;
BX=zscore(x);%标准化数据矩阵；
Y=pdist(x);%用欧氏距离计算两两之间的距离；
D=squareform(Y);%欧氏距离矩阵
Z=linkage(Y);%最短距离法；
% T=cluster(Z,4);
[H,T]=dendrogram(Z,'colorthreshold','default');