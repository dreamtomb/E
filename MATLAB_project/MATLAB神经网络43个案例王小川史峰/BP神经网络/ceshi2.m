clear;
clc;
X=[0 1 2 3 4 5 6 7 8 9 10];D=[0 1 2 3 4 3 2 1 2 3 4];
figure;
plot(X,D,'*');%绘制原始数据分布图?
net=newff([0 10],[5 1],{'tansig','purelin'})
net.trainParam.epochs=100;
net.trainParam.goal=0.005;
net=train(net,X,D);
O=sim(net,X);
figure;
plot(X,D,'*',X,O);%绘制训练后得到的结果和误差曲线
V=net.iw{1,1}%输入层到中间层权值?
theta1=net.b{1}%中间层各神经元阈值?
W=net.lw{2,1}%中间层到输出层权值?
theta2=net.b{2}%输出层各神经元阈值