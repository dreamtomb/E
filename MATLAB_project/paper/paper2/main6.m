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

rbf='polynomial';
[res2,svm_err_rate] = svm(n,attribute,res,train_num,rbf,ssum);
disp(['支持向量机算法的错误率是：',num2str(svm_err_rate*100),'%']);

y(ii)=svm_err_rate;
end
plot(x,y);
xlabel('Times of run');
ylabel('Error rate');
