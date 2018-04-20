%% 第一题：求总体均值u的置信度为0.95的置信区间
x0=[506 508 499 503 504 510 497 512 514 505 493 496 506 502 509 496];
x0=x0';
alpha=0.05;%置信度为0.95
mu=mean(x0);%mu是平均值
sig=std(x0);%sig是标准差
n=length(x0);
t=[mu-sig/sqrt(n)*tinv(1-alpha/2,n-1 ),mu+sig/sqrt(n)*tinv(1-alpha/2,n-1)];
%通过假设检验求的置信区间
[h,p,ci]=ttest(x0,mu,0.05);
%% 第二题：求总体均值u的置信度为0.95的置信区间
x0=[1050 1100 1120 1250 1280];
alpha=0.05;%置信度为0.95
mu=mean(x0);%mu是平均值
sig=std(x0);%sig是标准差
n=length(x0);
t=[mu-sig/sqrt(n)*tinv(1-alpha/2,n-1 ),mu+sig/sqrt(n)*tinv(1-alpha/2,n-1)];
%通过假设检验求的置信区间
[h,p,ci]=ttest(x0,mu,0.05);
%% 第三题：求两种情况下u和柯西的置信度为0.9的置信区间
x0=[6.683 6.681 6.676 6.678 6.679 6.672];
x1=[6.661 6.661 6.667 6.667 6.664];
alpha=0.1;%置信度为0.9
mu1=mean(x0);%mu是平均值
mu2=mean(x1);
sig1=std(x0);%sig是标准差
sig2=std(x1);
n1=length(x0);
n2=length(x1);
%通过假设检验求u的置信区间
[h1,p1,ci1]=ttest(x0,mu1,0.05);
[h2,p2,ci2]=ttest(x1,mu2,0.05);
%通过vartest求方差的置信区间
[h3,p3,ci3,st3]=vartest(x0,var(x0),'Alpha',0.1);
[h4,p4,ci4,st4]=vartest(x1,var(x1),'Alpha',0.1);
%求两个测定值形体的均值差的置信度为0.9的置信区间
[h,p,ci,st]=ttest2(x0,x1,'Alpha',0.1);