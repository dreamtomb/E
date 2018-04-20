function [T_sim,rf_err_rate] = rf(n,attribute,res,train_num,tree_num,sum,attri_num)
%% 随机将数据排序
data=attribute;
%% 输入输出数据
input=data;%输入数据
output=res;%输出数据——分类编号
%% 随机提取698个样本为训练样本，340个样本为预测样本
input_train=input(n(1:train_num),:);%调用函数对矩阵有要求
trainres=output(n(1:train_num),:)+1;
input_test=input(n(train_num+1:sum),:);
outputres=output(n(train_num+1:sum),:)+1;%1是原来的0,2是原来的1
%% 创建随机森林分类器
model=classRF_train(input_train,trainres,tree_num,attri_num);
%% 仿真测试
[T_sim,votes]=classRF_predict(input_test,model);
rf_err_rate=1-length(find(T_sim==outputres))/length(T_sim);



