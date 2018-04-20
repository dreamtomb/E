%% 未经遗传算法优化的BP神经网络建模
clear;
clc;
%%%%%%%%%%%%%输入参数%%%%%%%%%%%%%%
N=2000;            %数据总个数
M=1500;            %训练数据
%%%%%%%%%%%%%训练数据%%%%%%%%%%%%%%
for i=1:N
    input(i,1)=-5+rand*10;
    input(i,2)=-5+rand*10;
end
output=input(:,1).^2+input(:,2).^2;
save data input output
 
load data.mat
 
%从1到N随机排序
k=rand(1,N);
[m,n]=sort(k);
%找出训练数据和预测数据
input_train=input(n(1:M),:)';
output_train=output(n(1:M),:)';
input_test=input(n((M+1):N),:)';
output_test=output(n((M+1):N),:)';
%数据归一化
[inputn,inputs]=mapminmax(input_train);
[outputn,outputs]=mapminmax(output_train);
%构建BP神经网络
net=newff(inputn,outputn,5);
net.trainParam.epochs=100;
net.trainParam.lr=0.1;
net.trainParam.goal=0.0000004;
%BP神经网络训练
net=train(net,inputn,outputn);
%测试样本归一化
inputn_test=mapminmax('apply',input_test,inputs);
%BP神经网络预测
an=sim(net,inputn_test);
%%网络得到数据反归一化
BPoutput=mapminmax('reverse',an,outputs);
 
figure(1)
%plot(BPoutput,':og');
scatter(1:(N-M),BPoutput,'rx');
hold on;
%plot(output_test,'-*');
scatter(1:(N-M),output_test,'o');
legend('预测输出','期望输出','fontsize',12);
title('BP网络预测输出','fontsize',12);
xlabel('样本','fontsize',12);
xlabel('优化前输出的误差','fontsize',12);
 
figure(2)
error=BPoutput-output_test;
plot(1:(N-M),error);
xlabel('样本','fontsize',12);
ylabel('优化前输出的误差','fontsize',12);
%save net net inputs outputs