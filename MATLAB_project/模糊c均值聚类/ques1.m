close;
clear;
clc;
%% 数据处理
point=[0 0;0 1;4 4;4 5;5 4;5 5;1 0];%样本点
dis=pdist(point,'cityblock');%求距离
%% 最小距离聚类
figure;
Z1=linkage(dis,'single');
subplot(1,2,1);
[H,T]=dendrogram(Z1,'colorthreshold','default');
set(H,'LineWidth',2);
grid on;
xlabel('x');
ylabel('y');
title('最短距离法聚类图')
%% 最大距离聚类
Z2=linkage(dis,'complete');
subplot(1,2,2);
[H,T]=dendrogram(Z2,'colorthreshold','default');
set(H,'LineWidth',2);
grid on;
xlabel('x');
ylabel('y');
title('最长距离法聚类图')

