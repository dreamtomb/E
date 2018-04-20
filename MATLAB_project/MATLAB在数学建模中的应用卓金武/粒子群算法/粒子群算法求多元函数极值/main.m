%% 该例是求函数z=100*(x(i)-y(i)^2)^2+(y(i)-1)^2;的最小值
clear
clc

%参数初始化
x_range=[-50,50];%参数x变化范围
y_range=[-50,50];%参数y变化范围
range=[x_range;y_range];%参数变化矩阵
Max_V=0.2*(range(:,2)-range(:,1));%最大速度
n=2;%函数维度

%算法参数
PSOparams=[25 2000 24 2 2 0.9 0.4 1500 1e-25 250 NaN 0 0];

%% 粒子群寻优
pso_Trelea_vectorized('test_func',n,Max_V,range,0,PSOparams)
