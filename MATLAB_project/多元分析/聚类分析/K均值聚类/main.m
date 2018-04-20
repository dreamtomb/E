s = rng(5,'v5normal');
mu = round((rand(3,2)-0.5)*19)+1;
sigma = round(rand(3,2)*40)/10+1;
X = [mvnrnd(mu(1,:),sigma(1,:),200); ...
     mvnrnd(mu(2,:),sigma(2,:),300); ...
     mvnrnd(mu(3,:),sigma(3,:),400)];
% 作图
P1 = figure;clf;
scatter(X(1:200,1),X(1:200,2),10,'r*');
hold on;
scatter(X(201:500,1),X(201:500,2),10,'g*');
scatter(X(501:900,1),X(501:900,2),10,'y*');
title('研究样本散点分布图')
% 距离用传统欧式距离，分成两类
% cidx2               N*1的向量，存储的是每个点的聚类标号
% cmeans2         K*P的矩阵，存储的是K个聚类质心位置
% sumd2             1*K的和向量，存储的是类间所有点与该类质心点距离之和
% D2                   N*K的矩阵，存储的是每个点与所有质心的距离
[cidx2,cmeans2,sumd2,D2] = kmeans(X,3,'dist','sqEuclidean');
plot(cmeans2(:,1),cmeans2(:,2),'ko');
% gcf获得图形的句柄
% gco获得此时鼠标点击的元素的句柄
% gca获得坐标轴的句柄
% get(gca,'children')，获得了图像中画出的图线的句柄
set(get(gca,'Children'),'LineWidth',2);%设置图中的图像的宽度
P2 = figure;clf;
%下面的函数画的图横轴是分类的概率，纵轴是分类数。
[silh2,h2] = silhouette(X,cidx2,'sqeuclidean');
