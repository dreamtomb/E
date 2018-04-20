%% 神经网络算法流程介绍
% 算法流程：
%
%1、清空环境变量 
%     close；clear；clc；
%
%2、随机选择网络的训练数据和预测数据并归一化
% 假设所有样本个数共为N,假设样本为P，分类结果为T;
% 每一行是一个样本，每一列是一个属性
% temp=randperm(N);
% input_train=P(temp(1:2/3*N),:)';(所有数据的2/3~3/4为宜)
% output_train=T(temp(1:2/3*N),:)';
% input_test=P(temp(2/3*N:end),:)';
% output_test=T(temp(2/3*N:end),:)';
% 以上四个矩阵最终的每行是一个属性，每一列是一个样本;
% N = size(input_test,2);用于计算决定系数R^2
% [input_train,inputps]=mapminmax(input_train);
% [output_train,outputps]=mapminmax(output_train);

% 3、创建网络
% net = feedforwardnet (10,'trainlm')
% 隐含层有10个神经元，训练函数是trainlm 
% 
% 4、设置网络参数
% net.trainParam.show=1000;               %1000轮回显示一次结果
% net.divideParam.trainRatio=0.8;用于训练数据的比例
% net.divideParam.valRatio=0.1;用于检验数据的比例
% net.divideParam.testRatio=0.1;用于测试数据的比例
% net.trainParam.epochs = 1000;最大训练次数
% net.trainParam.goal = 1e-3;最小均方误差的训练目标
% net.trainParam.lr = 0.01;学习速率
% 
% 5、训练网络
% net = train(net,input_train,output_train);BP网络
% net = newrbe(input_train,output_train,0.3);RBF网络

% 6、测试样本归一化，仿真测试（用于检验模型效果）,结果反归一化
% input_test=mapminmax('apply',input_test,inputps);
% res = sim(net,input_test);
% res=mapminmax('reverse',res,outputps);
% output_test=mapminmax('apply',output_test,outputps);
% 
% 7、评价网络效果
% 相对误差error
% error_bp = abs(res - output_test)./output_test;
% 决定系数R^2
% R2_bp = (N * sum(res .* output_test) - sum(res) * sum(output_test))^2 / ((N * sum((res).^2) - (sum(res))^2) * (N * sum((output_test).^2) - (sum(output_test))^2)); 

