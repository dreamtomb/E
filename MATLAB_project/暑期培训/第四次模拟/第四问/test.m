close
clear
clc
[num,txt,raw]=xlsread('sh.xlsx');
for i=1:30
    data(i*16-15:i*16,:)=num(i*19-18:i*19-3,:);
end
%% 将30天的数据分别求和
res=[];
for i=1:30
    res(i,:)=sum(data(i*16-15:i*16,:));
end
x=res(:,1);
y=res(:,2);
x=sort(x)';
x=x(:,1:29);
y=sort(y,'descend')';
y=y(:,2:30);
plot(x,y,'*');
%% 拟合1
a0=[-0.001649 83.71 -8.524e+05];%与拟合参数a对应，这是初始猜测值
options=statset('Jacobian','on');
[a,r,J,~,msE]=nlinfit(x,y,@kyf3,a0,options);%拟合
[ypred,delta]=nlpredci(@kyf3,x,a,r,'Jacobian',J,'predopt','observation','simopt','on');%计算预测值和预测区间
figure(1)
subplot(2,1,1);
plot(x,y,'r*');hold on;
plot(x,ypred,'b--','LineWidth',1.5);
plot(x,ypred+delta,'b');
plot(x,ypred-delta,'b');
legend('输入值','计算值','预测区间');
subplot(2,1,2);
plot(x,y-ypred,'b.-');hold on;
stem(x,y-ypred,'g','Color','k')
legend('残差');
%计算残差
cancha=y-ypred;
%残差均值
meancancha=mean(cancha);
%样本方差
MSE=sum(cancha.^2)/(length(cancha)-2);
%ssr
SSR=sum((ypred-mean(y)).^2);
%sse
SSE=sum(cancha.^2);
%r^2
R2=SSR/(SSR+SSE);
fprintf('%s%f\n%s%f\n%s%f\n%s%f\n%s%f\n','残差均值是：',...
    meancancha,'样本方差是：',MSE,'SSR是：',SSR,...
    'SSE是：',SSE,'R^2是：',R2);
%t检验
[H,P,CI]=ttest2(y,ypred);
if H==0
    disp('假设在5%的置信度下被接受');
else
    disp('假设在5%的置信度下被拒绝');
end
%% 拟合2
a0=[1.953e+06 -7.859e-05 -4.036e+09 -0.0004401];%与拟合参数a对应，这是初始猜测值
options=statset('Jacobian','on');
[a,r,J,~,msE]=nlinfit(x,y,@kyf4,a0,options);%拟合
[ypred,delta]=nlpredci(@kyf4,x,a,r,'Jacobian',J,'predopt','observation','simopt','on');%计算预测值和预测区间
figure(2)
subplot(2,1,1);
plot(x,y,'r*');hold on;
plot(x,ypred,'b--','LineWidth',1.5);
plot(x,ypred+delta,'b');
plot(x,ypred-delta,'b');
legend('输入值','计算值','预测区间');
subplot(2,1,2);
plot(x,y-ypred,'b.-');hold on;
stem(x,y-ypred,'g','Color','k')
legend('残差');
%计算残差
cancha=y-ypred;
%残差均值
meancancha=mean(cancha);
%样本方差
MSE=sum(cancha.^2)/(length(cancha)-2);
%ssr
SSR=sum((ypred-mean(y)).^2);
%sse
SSE=sum(cancha.^2);
%r^2
R2=SSR/(SSR+SSE);
fprintf('%s%f\n%s%f\n%s%f\n%s%f\n%s%f\n','残差均值是：',...
    meancancha,'样本方差是：',MSE,'SSR是：',SSR,...
    'SSE是：',SSE,'R^2是：',R2);
%t检验
[H,P,CI]=ttest2(y,ypred);
if H==0
    disp('假设在5%的置信度下被接受');
else
    disp('假设在5%的置信度下被拒绝');
end










