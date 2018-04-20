clear all
clc
close all

address=[pwd,'\ORL','\s'];

rows=112;
cols=92;
ClassNum=40;
tol_num=10;
image_fmt='.bmp';
train_samplesize=5;

%--------------------------------------------------------------------------
%------------------------PCA降维
train=1:train_samplesize;
test=train_samplesize+1:tol_num;
%PCA维数
Eigen_NUM=40;

%每类训练样本、测试样本个数
train_num=length(train);
test_num=length(test);

%读入训练样本，测试样本
[train_sample,train_label]=readsample(address,ClassNum,train,rows,cols,image_fmt);
[test_sample,test_label]=readsample(address,ClassNum,test,rows,cols,image_fmt);

%训练样本总数、测试样本总数
train_tol=length(train_label);
test_tol=length(test_label);

%PCA降维
Train_SET=train_sample';
[disc_set,disc_value,Mean_Image]=Eigenface_f(Train_SET,Eigen_NUM);

%训练样本、测试样本第一次投影
train_pro=disc_set'*train_sample';
test_pro=disc_set'*test_sample';

%训练样本总体均值及每类均值
total_mean=mean(train_pro,2);
EachClassMean=zeros(Eigen_NUM,ClassNum);
EachClassNum=zeros(1,ClassNum);
for i=1:ClassNum
    temp=train_pro(:,(i==train_label));
    EachClassMean(:,i)=mean(temp,2);
    EachClassNum(i)=sum((i==train_label));
end

%构造Fai_b、Fai_w，以便计算Sb和Sw
Fai_b=zeros(Eigen_NUM,ClassNum);
Fai_w=zeros(Eigen_NUM,train_tol);
for i=1:ClassNum
    temp=EachClassMean(:,i)-total_mean;
    Fai_b(:,i)=sqrt(EachClassNum(i))*temp;
end
for i=1:train_tol
    Fai_w(:,i)=train_pro(:,i)-EachClassMean(:,train_label(i));
end
Sb=Fai_b*Fai_b';
Sw=Fai_w*Fai_w';

%广义特征值分解，得到LDA的投影矩阵
LDA_dim=ClassNum-1;
% LDA_dim=12;
[eig_vec,eig_val]=eig(Sb,Sw);
d=diag(eig_val)';
[sorted_d,ind]=sort(d,'descend');
sorted_vec=eig_vec(:,ind);
W_LDA=sorted_vec(:,1:LDA_dim);

%训练样本、测试样本再次投影
train_final=W_LDA'*train_pro;
test_final=W_LDA'*test_pro;

%调用最近邻分类器对测试样本分类
Sample=test_final';
Training=train_final';
Group=train_label';
k=1;
distance='euclidean';
Class = knnclassify(Sample, Training, Group, k, distance);
accuracy=sum(test_label==Class')/test_tol;

%---------------------------------输出显示----------------------------------
fprintf('每类训练样本数为：%d\n',train_samplesize);
fprintf(2,'FisherFace的识别率为：%.2f%%\n\n',accuracy*100);
