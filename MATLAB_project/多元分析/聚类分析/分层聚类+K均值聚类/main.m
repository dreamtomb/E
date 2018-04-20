clear;
close;
clc;
% 使用高斯分布（正态分布）
% 随机生成3个中心以及标准差
s = rng(5,'v5normal');
mu = round((rand(3,2)-0.5)*19)+1;
sigma = round(rand(3,2)*40)/10+1;
X = [mvnrnd(mu(1,:),sigma(1,:),200); ...
     mvnrnd(mu(2,:),sigma(2,:),300); ...
     mvnrnd(mu(3,:),sigma(3,:),400)];
% 作图
P1 = figure;clf;
scatter(X(:,1),X(:,2),10,'ro');
title('研究样本散点分布图')
%分层聚类
eucD = pdist(X,'euclidean');
clustTreeEuc = linkage(eucD,'average');
cophenet(clustTreeEuc,eucD);
P3 = figure;clf;
[h,nodes] =  dendrogram(clustTreeEuc,20);
set(gca,'TickDir','out','TickLength',[.002 0],'XTickLabel',[]);
%K均值聚类
[cidx3,cmeans3,sumd3,D3] = kmeans(X,3,'dist','sqEuclidean');
P4 = figure;clf;
[silh3,h3] = silhouette(X,cidx3,'sqeuclidean');
%显示聚类结果
P5 = figure;clf
ptsymb = {'bo','ro','go',',mo','c+'};
MarkFace = {[0 0 1],[.8 0 0],[0 .5 0]};
hold on
for i =1:3
    clust = find(cidx3 == i);
    plot(X(clust,1),X(clust,2),ptsymb{i},'MarkerSize',3,'MarkerFace',MarkFace{i},'MarkerEdgeColor','black');
    plot(cmeans3(i,1),cmeans3(i,2),ptsymb{i},'MarkerSize',10,'MarkerFace',MarkFace{i});
end
hold off