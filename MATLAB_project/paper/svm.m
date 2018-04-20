function [solution,svm_error_rate] = svm(n,attribute,res,train_num,rbf,sum)
%% 随机将数据排序
data=attribute;
%% 输入输出数据
input=data;%输入数据
output=res;%输出数据——分类编号
%% 随机提取698个样本为训练样本，340个样本为预测样本
input_train=input(n(1:train_num),:)';%调用函数对矩阵有要求
trainres=output(n(1:train_num),:);
input_test=input(n(train_num+1:sum),:)';
outputres=output(n(train_num+1:sum),:);
%% 输入数据归一化
[inputn,inputps]=mapminmax(input_train);%训练数据归一化
inputn_test=mapminmax('apply',input_test,inputps);%测试数据归一化,inputps可以理解为归一化input_train使用的方法
s=svmtrain(inputn',trainres,'Kernel_Function',rbf);%可以输入doc svmtrain查看函数的参数
sv_index=s.SupportVectorIndices;%这四个都是参数
sv_Alpha=s.Alpha;
sv_Bias=s.Bias;
mean_and_std_trains=s.ScaleData;
check=svmclassify(s,inputn');
svm_train_error_rate=1-length(find(check==trainres))/length(trainres);%找到错误率
solution=svmclassify(s,inputn_test');%对测试数据进行检测
svm_error_rate=1-length(find(solution==outputres))/length(outputres);%找到错误率
