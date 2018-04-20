%% 本例为无约束目标函数最大值遗传算法求解
clear
close all
clc

%目标函数
figure(1)
% x=[0:0.01:2];
x=[-10:0.01:10];
% f=200*exp(-0.05*x).*sin(x);
f=2.1*(1-x+2*x.^2).*exp(-x.^2/2);
plot(x,f);

%参数设置
NIND=30;
MAXGEN=30;
% PRECI=(2-(-2))/0.0001;%算出求满足精度的解至少要长度为多少
PRECI=40;
GGAP=0.95;
px=0.7;
pm=0.01;
trace=zeros(2,1);
%区域描述器以及初始种群的创建
% FieldD=[PRECI;0;2;1;0;1;1];
FieldD=[PRECI;-10;10;1;0;1;1];
[Chrom,BaseV]=crtbp(50,PRECI);
%% 优化阶段
%代数记录器
gen=0;
%解码
Phen=bs2rv(Chrom,FieldD);
%计算目标函数值
% ObjV=200*exp(-0.05*Phen).*sin(Phen);
ObjV=2.1*(1-Phen+2*Phen.^2).*exp(-Phen.^2/2);
%循环模拟遗传
while gen<MAXGEN
    FitnV=ranking(-ObjV);
    SelCh=select('sus',Chrom,FitnV,GGAP);
    newChrom=recombin('xovsp',SelCh,px);
    newChrom=mut(newChrom,pm);
    %计算子代函数值
    Phen=bs2rv(newChrom,FieldD);
%     ObjVSel=200*exp(-0.05*Phen).*sin(Phen);
ObjVSel=2.1*(1-Phen+2*Phen.^2).*exp(-Phen.^2/2);
    %将子代个体插入父代个体中
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
    Phen=bs2rv(Chrom,FieldD);
    gen=gen+1
    
    %记录函数值
    [Y,I]=max(ObjV);
    trace(1,gen)=Phen(I,:);
    trace(2,gen)=Y;
end

figure(2)
plot(trace(1,:),trace(2,:),'bo')
grid on;
figure(3)
plot(1:MAXGEN,trace(2,:));
grid on;
xlabel('遗传代数：');
ylabel('界的变化：');
title('进化过程：');


[bestY,num]=max(trace(2,:));
bestX=trace(1,num);

disp('最优解：X=');
disp(num2str(bestX));
disp('Y=');
disp(num2str(bestY));
