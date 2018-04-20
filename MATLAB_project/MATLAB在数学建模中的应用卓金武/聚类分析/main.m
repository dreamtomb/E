%% 用标准化数据矩阵+欧氏距离法实现聚类分析
clc
clear
close all
x=;
BX=zscore(x);
Y=pdist(x);
D=squareform(Y);
Z=linkage(Y);
[H,T]=dendrogram(Z,'colorthreshold','default');