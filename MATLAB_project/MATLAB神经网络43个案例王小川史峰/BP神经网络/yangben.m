% %模板
% p=p1';
% t=t1';    
% [pn,minp,maxp,tn,mint,maxt]=premnmx(p,t);%原始数据归一化    
% net=newff(minmax(pn),[5,1],{'tansig','purelin'},'traingdx');%minmax(pn)取pn矩阵的最大最小值；[5,1]第一次神经元5个，第二层1个；'tansig','purelin'神经网络第一层和第二层的转移函数；'trainrp'网络训练函数。
% net.trainParam.show=2000; %训练步数 
% net.trainParam.lr=0.01; %学习率
% net.trainParam.epochs=100000;%训练次数
% net.trainParam.goal=1e-5;%精确度
% [net,tr]=train(net ,pn,tn);%调用TRAINGDM算法开始训练BP网络  
% pnew=pnew1';
% pnewn=tramnmx(pnew,minp,maxp); 
% anewn=sim(net,pnewn);%对BP网络进行仿真 
% anew=postmnmx(anewn,mint,maxt);%还原数据 
% y=anew';
%traingd?
clear;
clc;
P=[-1 -1 2 2 4;0 5 0 5 7];
T=[-1 -1 1 1 -1];
%利用minmax函数求输入样本范围?
net=newff(minmax(P),[5,1],{'tansig','purelin'},'trainrp');
%minmax(P)取P的最大最小值；[5,1]第一次神经元5个，第二层1个；'tansig','purelin'神经网络第一层和第二层的转移函数；'trainrp'网络训练函数。?
net.trainParam.show=50;%最多显示训练步数?
net.trainParam.lr=0.05;%学习率（缺省为0.01）?
net.trainParam.epochs=300;%设置训练次数，?
net.trainParam.goal=1e-5;%设置精确度?
[net,tr]=train(net,P,T);%训练开始??
net.iw{1,1};%隐层权值?
net.b{1};%隐层阈值??
net.lw{2,1};%输出层权值?
net.b{2};%输出层阈值??
sim(net,P)
