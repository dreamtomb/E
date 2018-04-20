%% 遗传算法+非线性规划求最值
%目标函数为minf(x)=exp(x1)*(4x1^2+2x2^2+4x1x2+2x2+1)
%约束条件为:1.5+x1x2-x1-x2<=0
%                   -x1x2<=10
clc
clear all
close all

%% 定义遗传算法参数
NIND=100;        %个体数目
MAXGEN=30;      %最大遗传代数
PRECI=20;       %变量的二进制位数
GGAP=0.95;      %代沟
px=0.6;         %交叉概率
pm=0.1;        %变异概率
trace=zeros(3,MAXGEN);                        %寻优结果的初始值

FieldD=[PRECI PRECI;0 0;10 10;1 1;0 0;1 1;1 1]; %区域描述器
Chrom=crtbp(NIND,PRECI*2);                      %初始种群
%% 优化
gen=0;                                  %代计数器
x=bs2rv(Chrom,FieldD);                 %计算初始种群的十进制转换
x1=x(:,1);x2=x(:,2);
ObjV=exp(x1).*(4*x1.^2+2*x2.^2+4*x1.*x2+2*x2+1);        %计算目标函数值
while gen<MAXGEN
   FitnV=ranking(ObjV);                              %分配适应度值
   SelCh=select('sus',Chrom,FitnV,GGAP);              %选择
   SelCh=recombin('xovsp',SelCh,px);                  %重组
   SelCh=mut(SelCh,pm);                               %变异
   x=bs2rv(SelCh,FieldD);               %子代个体的十进制转换
   x1=x(:,1);x2=x(:,2);
   ObjVSel= exp(x1).*(4*x1.^2+2*x2.^2+4*x1.*x2+2*x2+1);%计算子代的目标函数值
   [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %重插入子代到父代，得到新种群
   x=bs2rv(Chrom,FieldD);
   x1=x(:,1);x2=x(:,2);
   gen=gen+1                                      %代计数器增
   if mod(gen,10)==0
       for i=1:NIND
           X=x(i,:);         %X_init拿来装每次起始的自变量值，是个行向量
           %X_min=zeros(5,NIND);     %X_min拿来记录每次求出最小值对应的自变量。每列代表一次求出的自变量值们
           %Z_min=zeros(NIND,1);     %Z_min拿来记录每次求出的最小值
           [X_min(:,i),Z_min(i)]=fmincon('fun1',X,[],[],[],[],[-10 -10],[],'test_nonLcon');
       end
       [A,I]=min(Z_min);
       trace(1,gen)=A;
       trace(2,gen)=X_min(1,I);
       trace(3,gen)=X_min(2,I);
   else
        [A,I]=min(ObjV);
        trace(1,gen)=A;
        trace(2,gen)=x1(I);
        trace(3,gen)=x2(I);
   end
end

%% 画进化图
figure(1);
plot(1:MAXGEN,trace(1,:));
grid on
xlabel('遗传代数')
ylabel('解的变化')
title('进化过程')
bestZ=trace(1,end);
bestX1=trace(2,end);
bestX2=trace(3,end);
fprintf(['最优解:\nX1=',num2str(bestX1),'\nX2=',num2str(bestX2),'\nZ=',num2str(bestZ),'\n'])