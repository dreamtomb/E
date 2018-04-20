%% 神经网络算法对数据进行分类
%% 处理数据

%此部分结束后res为346*1的列向量，代表着调查结果
%attribute为346*20的矩阵，346代表样本数，20代表属性数
close all;
clear;
clc;
[res,attribute]=deal();
ssum=size(res,1);

x=1:100;
y=zeros(1,100);
for ii=1:100
    
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
    
    %% 使用神经网络法进行分类
    
    [res1,pnn_err_rate] = pnn(n,attribute,res,train_num,ssum);
    disp(['神经网络算法的错误率是：',num2str(pnn_err_rate*100),'%']);
    fprintf('%c\n',' ');
    
    %% 使用支持向量机进行分类
    
    rbf='rbf';
    [res2,svm_err_rate] = svm(n,attribute,res,train_num,rbf,ssum);
    disp(['支持向量机算法的错误率是：',num2str(svm_err_rate*100),'%']);
    
    %% 使用随机森林法进行分类
    
    tree_num=80;
    attri_num=4;
    [res3,rf_err_rate]=rf(n,attribute,res,train_num,tree_num,ssum,attri_num);
    disp(['the error rate of Random forest algorithm ：',num2str(rf_err_rate*100),'%']);
    
    %% 第一种方案
    
    rate=plan1(n,res,res1,res2,res3,train_num,ssum);
    disp(['算法的错误率是：',num2str(rate*100),'%']);
    
    y(ii)=rate;
end
plot(x,y,'b*');
xlabel('Times of run');
ylabel('Error rate');

