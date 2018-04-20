%% svm改进决策树算法对数据进行分类
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
%% 支持向量机做第一次预测
[inputn,inputps]=mapminmax(input_train');%训练数据归一化
inputn_test=mapminmax('apply',input_test',inputps);%测试数据归一化,inputps可以理解为归一化input_train使用的方法
s=svmtrain(inputn',trainres,'Kernel_Function','rbf');%可以输入doc svmtrain查看函数的参数
sv_index=s.SupportVectorIndices;%这四个都是参数
sv_Alpha=s.Alpha;
sv_Bias=s.Bias;
mean_and_std_trains=s.ScaleData;
check=svmclassify(s,inputn');
svm_train_error_rate=1-length(find(check==trainres))/length(trainres);%找到错误率
solution=svmclassify(s,inputn_test');%对测试数据进行检测
svm_error_rate=1-length(find(solution==outputres))/length(outputres);%找到错误率
%% 创建随机森林分类器
temp_attribute_A=check;
temp_attribute_B=solution;
error=svm_train_error_rate;
temp_rate=svm_error_rate;
disp(['错误率是：',num2str(temp_rate*100),'%']);
new_attribute_A=temp_attribute_A;
new_attribute_B=temp_attribute_B;
rate=1;
x=1:1000;
y=x;
for i=1:1000
    i
    use=randperm(20,4);%每次随机选用4个属性
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
    disp(['训练错误率是：',num2str(temp_rate*100),'%']);
    error_rate=length(find(temp_attribute_B~=outputres))/length(outputres);
    disp(['训练错误率是：',num2str(error_rate*100),'%']);
    y(i)=error_rate;
end
plot(x,y);


