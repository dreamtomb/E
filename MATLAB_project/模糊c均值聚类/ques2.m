close;
clear;
clc;
%% 数据处理
point=[0 0;0 1;4 4;4 5;5 4;5 5;1 0];%样本点
%% c-均值聚类
figure;
[U,P,Dist,Cluster_Res,Obj_Fcn,iter]=fuzzycm(point,2,1);