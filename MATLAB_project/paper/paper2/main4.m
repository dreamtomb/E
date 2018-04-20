%% 决策树改进决策树算法对数据进行分类
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
%% 输入输出数据
input=data;%输入数据
output=res;%输出数据——分类编号
%% 随机提取698个样本为训练样本，340个样本为预测样本
input_train=input(n(1:train_num),:);%调用函数对矩阵有要求
trainres=output(n(1:train_num),:)+1;
input_test=input(n(train_num+1:ssum),:);
outputres=output(n(train_num+1:ssum),:)+1;%1是原来的0,2是原来的1
%% 创建随机森林分类器
model=fitctree(input_train,trainres);
[~,~,~,bestlevel]=cvLoss(model,'SubTrees','All','TreeSize','min');
model = prune(model,'Level',bestlevel);
temp_attribute_A=predict(model,input_train);
temp_attribute_B=predict(model,input_test);
error=find(temp_attribute_A~=trainres);
temp_rate=length(error)/length(trainres);
disp(['错误率是：',num2str(temp_rate*100),'%']);
new_attribute_A=temp_attribute_A;
new_attribute_B=temp_attribute_B;
rate=1;
x=1:500;
y=x;
for i=1:500
    i
%     use=randperm(20,4);%每次随机选用4个属性
    use=randperm(20,7);
    use=sort(use);
    if temp_rate<=rate
        rate=temp_rate;
        new_attribute_A=temp_attribute_A;
        new_attribute_B=temp_attribute_B;
    end
    model=fitctree([input_train(:,use),new_attribute_A],trainres);
    [~,~,~,bestlevel]=cvLoss(model,'SubTrees','All','TreeSize','min');
    model = prune(model,'Level',bestlevel);
    temp_attribute_A=predict(model,[input_train(:,use),new_attribute_A]);
    temp_attribute_B=predict(model,[input_test(:,use),new_attribute_B]);
    error=find(temp_attribute_A~=trainres);
    temp_rate=length(error)/length(trainres);
    disp(['错误率是：',num2str(temp_rate*100),'%']);
    y(i)=length(find(temp_attribute_B~=outputres))/length(outputres);
end
plot(x,y);


