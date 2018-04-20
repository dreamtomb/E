%% 散点图
close
clear
clc
x=[1000 1500 2000 2500 3000 3500 4000 4500 5000];
y=[17000 15960 14940 13120 12150 11200 10017 9875 9796];
a0=[1.069e+04 306.8 2738 4.869e+18 9.995e+05 1.708e+05];%与拟合参数a对应，这是初始猜测值
options=statset('Jacobian','on');
[a,r,J,~,msE]=nlinfit(x,y,@kyf,a0,options);%拟合
[ypred,delta]=nlpredci(@kyf,x,a,r,'Jacobian',J,'predopt','observation','simopt','on');%计算预测值和预测区间
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
x=[1000 1500 2000 2500 3000 3500 4000 4500 5000];
y=[17000 15960 14940 13120 12150 11200 10017 9875 9796];
a0=[100 1000 1];%与拟合参数a对应，这是初始猜测值
options=statset('Jacobian','on');
[a,r,J,~,msE]=nlinfit(x,y,@kyf1,a0,options);%拟合
[ypred,delta]=nlpredci(@kyf1,x,a,r,'Jacobian',J,'predopt','observation','simopt','on');%计算预测值和预测区间
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
%% 拟合3
x=[1000 1500 2000 2500 3000 3500 4000 4500 5000];
y=[17000 15960 14940 13120 12150 11200 10017 9875 9796];
a0=[-9.7007e-18 1.8638e-13 -1.4479e-09 5.9333e-06 -0.0134 13.0285 1.2720e+04];%与拟合参数a对应，这是初始猜测值
options=statset('Jacobian','on');
[a,r,J,~,msE]=nlinfit(x,y,@kyf2,a0,options);%拟合
[ypred,delta]=nlpredci(@kyf2,x,a,r,'Jacobian',J,'predopt','observation','simopt','on');%计算预测值和预测区间
figure(3)
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



