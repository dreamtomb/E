%% 例4.1 通过遗传算法求解如下多元函数：
%    max f（x1，x2）=21.5+x1sin（4πx1）+x2sin（20πx2）
%    其中     -3<x1<12.1
%               4.1<x2<5.8
clc
clear
close
clc
%参数设置
% lbx=-3;
% ubx=12.1;
% lby=4.1;
% uby=5.8;
 lbx=-2;
ubx=2;
lby=-2;
uby=2;
figure(1);
%ezmesh('21.5+x*sin(4*pi*x)+y*sin(20*pi*y)',[lbx,ubx,lby,uby],50);
ezmesh('y*sin(2*pi*x)+x*cos(2*pi*y)',[lbx,ubx,lby,uby],50);

%%  函数主体开始     准备阶段

%定义算法的参数值
NIND=40;%种群大小
PRECI=50;%个体长度
MAXGEN=20;%最大遗传代数
GGAP=0.95;%代沟
px=0.7;%交叉概率
pm=0.01;%变异概率
trace=zeros(3,MAXGEN);%用于存放寻优结果

%区域描述器
FieldD=[PRECI PRECI;lbx lby;ubx uby;1 1;0 0;1 1;1 1];
%FieldD的参数分别是个体长度，个体的上下界,个体的编码方式，
%使用的刻度以及是否包含两个边界

%NIND是种群个体数,PRECI是个体长度,Chrom中每一个个体前50位是x,后50位是Y.
[Chrom,Lind,BaseV]=crtbp(NIND,PRECI*2);

%% 优化阶段
gen=0;

%解码
XY=bs2rv(Chrom,FieldD);
X=XY(:,1);
Y=XY(:,2);

%目标函数值
% ObjV=21.5+X.*sin(4*pi*X)+Y.*sin(20*pi*Y);
ObjV=Y.*sin(2*pi*X)+X.*cos(2*pi*Y);

while gen<MAXGEN
    %计算适应度
    FitnV=ranking(ObjV);%用十进制数来进行适应度评价
    %选择
    SelCh=select('sus',Chrom,FitnV,GGAP);
    %交叉
    SelCh=recombin('xovsp',SelCh,px);
    %变异
    SelCh=mut(SelCh,pm);
    %子代的目标函数值
    XY=bs2rv(SelCh,FieldD);
    X=XY(:,1);
    Y=XY(:,2);

    %子代的目标函数值
    %ObjVSel=21.5+X.*sin(4*pi*X)+Y.*sin(20*pi*Y);
    ObjVSel=Y.*sin(2*pi*X)+X.*cos(2*pi*Y);
    
    %将子代个体插入父代个体
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
    XY=bs2rv(Chrom,FieldD);
    gen=gen+1;
   
    %获取最优解的代号及其值,其中y为最优解，i为序号
    [Y,I]=max(ObjV);
    %记录
    trace(1:2,gen)=XY(I,:);
    trace(3,gen)=Y;
end

figure(2);
plot3(trace(1,:),trace(2,:),trace(3,:),'bo');
hold on;
grid on;
plot3(XY(:,1),XY(:,2),ObjV,'r*');
hold off;

figure(3)
plot(1:MAXGEN,trace(3,:));
grid on
xlabel('遗传代数：');
ylabel('界的变化：');
title('进化过程：');

% bestZ=trace(3,end);
% bestX=trace(1,end);
% bestY=trace(2,end);
[bestZ,num]=max(trace(3,:));
bestX=trace(1,num);
bestY=trace(2,num);
disp('最优解：X=');
disp(num2str(bestX));
disp('Y=');
disp(num2str(bestY));
disp('Z=');
disp(num2str(bestZ));