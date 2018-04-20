load data3_1.txt;  
[m,n]=size(data3_1);
tsx=data3_1(1:m,1);
tsx=tsx';
ts=data3_1(1:m,2);
ts=ts'; 
[TSX,TSXps]=mapminmax(tsx,1,2);
[TS,TSps]=mapminmax(ts,1,2);
TSX=TSX';  
figure; 
plot(ts,'LineWidth',2);
title('到杭旅游总人数(1999.01.01-2009.12.31)','FontSize',12);
xlabel('统计年份(1990.12.19-2009.08.19)','FontSize',12); 
ylabel('归一化后的总游客数/万人','FontSize',12); 
grid on;     
% 生成BP网络、利用minmax函数求输入样本范围  
net_1=newff(minmax(TS),[10,1],{'tansig','purelin'},'traincgf') 
% 设置训练参数  
net_1.trainParam.show = 50; %显示训练迭代过程（NaN表示不显示，缺省25） 
net_1.trainParam.lr = 0.025; %学习率（缺省0.01） 
net_1.trainParam.mc = 0.9; %动量因子（缺省0.9)
net_1.trainParam.epochs=10000;%最大训练次数
net_1.trainParam.goal=0.001;%训练要求精度
inputWeights=net_1.IW{1,1}%输入层权值
inputbias=net_1.b{1}%输入层阈值
layerWeights=net_1.LW{2,1}%输出层权值
layerbias=net_1.b{2}%输出层阈值
TS',TSX
%网络训练??
[net_1,tr]=train(net_1,TS,TSX);