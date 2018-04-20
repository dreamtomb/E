%% ga优化
clc
clear
close
clc
load ga.mat
%参数设置
lbx=0;
ubx=2;

%%  函数主体开始     准备阶段
%定义算法的参数值
NIND=40;%种群大小
PRECI=50;%个体长度
MAXGEN=1000;%最大遗传代数
GGAP=0.95;%代沟
px=0.7;%交叉概率
pm=0.01;%变异概率
trace=zeros(3,MAXGEN);%用于存放寻优结果
res=trace;%存放最优值
p=zeros(92,MAXGEN);%存放最优解对应的概率

%区域描述器
FieldD=[rep(PRECI,[1 92]);rep(lbx,[1 92]);rep(ubx,[1 92]);ones(1,92);zeros(1,92);ones(1,92);ones(1,92)];
%FieldD的参数分别是个体长度，个体的上下界,个体的编码方式，
%使用的刻度以及是否包含两个边界

%NIND是种群个体数,PRECI是个体长度,Chrom中每一个个体前50位是x,后50位是Y.
[Chrom,Lind,BaseV]=crtbp(NIND,PRECI*92);

%% 优化阶段
gen=0;

%解码
XY=bs2rv(Chrom,FieldD);
XY=dealXY(XY);
a=[];
for i=1:23
    a=[a XY(:,i)];
end
b=[];
for i=1:23
    b=[b XY(:,i)];
end
c=[];
for i=1:23
    c=[c XY(:,i)];
end
d=[];
for i=1:23
    d=[d XY(:,i)];
end

%目标函数值
[ObjV,P,D]=cal(NIND,pxy,xy1,pjs,js1,prs,rs1,prw,rw1,a,b,c,d,xyqq,jsqq,rsqq,rwqq,mon);

while gen<MAXGEN
    gen
    %计算适应度
    FitnV=ranking(1./ObjV);%用十进制数来进行适应度评价
    %选择
    SelCh=select('sus',Chrom,FitnV,GGAP);
    %交叉
    SelCh=recombin('xovsp',SelCh,px);
    %变异
    SelCh=mut(SelCh,pm);
    %子代的目标函数值
    XY=bs2rv(SelCh,FieldD);
    XY=dealXY(XY);
    a=[];
    for i=1:23
        a=[a XY(:,i)];
    end
    b=[];
    for i=1:23
        b=[b XY(:,i)];
    end
    c=[];
    for i=1:23
        c=[c XY(:,i)];
    end
    d=[];
    for i=1:23
        d=[d XY(:,i)];
    end
    
    %子代的目标函数值
    [ObjVSel,P,D]=cal(size(XY,1),pxy,xy1,pjs,js1,prs,rs1,prw,rw1,a,b,c,d,xyqq,jsqq,rsqq,rwqq,mon);
    
    %将子代个体插入父代个体
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
    XY=bs2rv(Chrom,FieldD);
    XY=dealXY(XY);
    gen=gen+1;
    
    %获取最优解的代号及其值,其中y为最优解，i为序号
    [Y,I]=max(ObjV);
    [hh,ii]=max(ObjVSel);
    %记录
    trace(1,gen)=Y;
    trace(2,gen)=P(ii);
    trace(3,gen)=D(ii);
    res(1,gen)=max(trace(1,:));
    p(:,gen)=XY(I,:);
end
figure
plot(1:MAXGEN,trace(1,:));
grid on
xlabel('遗传代数：');
ylabel('解的变化：');
title('进化过程：');
figure
plot(1:MAXGEN,res(1,:));
grid on
xlabel('遗传代数：');
ylabel('最优解的变化：');
title('进化过程：');
[m,index]=max(trace(1,:));
fprintf('%s%f\n%s%f\n','最优解为：',m,'对应的通过率为',trace(2,index));
disp(p(:,index));