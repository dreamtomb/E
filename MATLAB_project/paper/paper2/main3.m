%% 神经网络改进决策树算法对数据进行分类
%% 处理数据
%此部分结束后res为346*1的列向量，代表着调查结果
%attribute为346*20的矩阵，346代表样本数，20代表属性数
close all;
clear;
clc;
[res,attribute]=deal();
ssum=size(res,1);
index=randperm(346,100);
index=[index index.*2 index.*3];
index=unique(index);
n=zeros(1,ssum-length(index));
temp=1;
for i=1:ssum
    if ismember(i,index)
    else
        n(temp)=i;
        temp=temp+1;
    end
end
n=[n index];
train_num=ssum-length(index);
%% 随机将数据排序
data=attribute;
res=res+1;
%% 输入输出数据
input=data;%输入数据
output=res;%输出数据——分类编号
%% 随机提取698个样本为训练样本，340个样本为预测样本
P_train=input(n(1:train_num),:)';
T_train=output(n(1:train_num),:)';
P_test=input(n(train_num+1:ssum),:)';
T_test=output(n(train_num+1:ssum),:)';
%% 支持向量机做第一次预测
result_pnn_train = [];
result_pnn_test = [];
for i = 1:20
    for j = i:20
        p_train = P_train(i:j,:);
        p_test = P_test(i:j,:);
        Tc_train = ind2vec(T_train);
        % 创建网络
        net_pnn = newpnn(p_train,Tc_train);
        %% PNN验证训练集
        Tc_trian = ind2vec(T_train);
        t_sim_pnn = sim(net_pnn,p_train);
        T_sim_pnn = vec2ind(t_sim_pnn);
        result_pnn_train = [result_pnn_train T_sim_pnn'];
        %% PNN创建及仿真测试
        Tc_test = ind2vec(T_test);
        t_sim_pnn = sim(net_pnn,p_test);
        T_sim_pnn = vec2ind(t_sim_pnn);
        result_pnn_test = [result_pnn_test T_sim_pnn'];
    end
end
% 正确率accuracy
accuracy_pnn_train = [];
for i = 1:size(result_pnn_train,2)
    accuracy_2 = length(find(result_pnn_train(:,i) == T_train'))/length(T_train);
    accuracy_pnn_train = [accuracy_pnn_train accuracy_2];
end
accuracy_pnn_test = [];
for i = 1:size(result_pnn_test,2)
    accuracy_2 = length(find(result_pnn_test(:,i) == T_test'))/length(T_test);
    accuracy_pnn_test = [accuracy_pnn_test accuracy_2];
end
check=result_pnn_train(:,20);
solution=result_pnn_test(:,20);
pnn_train_error_rate=accuracy_pnn_train(20);
pnn_error_rate=accuracy_pnn_test(20);
%% 创建随机森林分类器
temp_attribute_A=check;
temp_attribute_B=solution;
error=pnn_train_error_rate;
temp_rate=pnn_error_rate;
disp(['错误率是：',num2str(temp_rate*100),'%']);
new_attribute_A=temp_attribute_A;
new_attribute_B=temp_attribute_B;
rate=1;
x=1:500;
y=x;
P_train=P_train';
T_train=T_train';
P_test=P_test';
T_test=T_test';
for i=1:500
    i
    use=randperm(20,4);%每次随机选用4个属性
    use=sort(use);
    if temp_rate<=rate
        rate=temp_rate;
        new_attribute_A=temp_attribute_A;
        new_attribute_B=temp_attribute_B;
    end
    model=fitctree([P_train(:,use),new_attribute_A],T_train);
    [~,~,~,bestlevel]=cvLoss(model,'SubTrees','All','TreeSize','min');
    model = prune(model,'Level',bestlevel);
    temp_attribute_A=predict(model,[P_train(:,use),new_attribute_A]);
    temp_attribute_B=predict(model,[P_test(:,use),new_attribute_B]);
    error=find(temp_attribute_A~=T_train);
    temp_rate=length(error)/length(T_train);
    disp(['训练错误率是：',num2str(temp_rate*100),'%']);
    error_rate=length(find(temp_attribute_B~=T_test))/length(T_test);
    disp(['训练错误率是：',num2str(error_rate*100),'%']);
    y(i)=error_rate;
end
plot(x,y);


