%% 有季节性特点的时间序列预测
a=load('jijie.txt');
[m,n]=size(a);
a_mean=mean(mean(a));
aj_mean=mean(a);
bj=aj_mean/a_mean;
w=1:m;
yhat=w*sum(a,2)/sum(w);
yjmean=yhat/n;
yjhat=yjmean*bj;
