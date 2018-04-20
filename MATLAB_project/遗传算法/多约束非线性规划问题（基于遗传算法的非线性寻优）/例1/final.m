%% 遗传算法流程介绍
% 算法流程：
%
%1、清空环境变量 
%     close；clear；clc；
%
clear;
clc;
%2、定义遗传算法参数：
%     个体数目：NIND
%     最大遗传代数：MAXGEN
%     变量维数：NVAR优化的问题中有几个属性
%     变量长度：PRECI每个属性用多长的基因描述
%     代沟：GGAP
%     交叉概率：px
%     变异概率：pm
%     存放寻优结果：trace=zeros(MAXGEN,NVAR+1);
%     trace(:,1:NVAR)存放每一代的自变量，trace(:，NVAR+1)存放每一代的解
% 
lbx1=0;ubx1=2.8274; 
lbx2=0;ubx2=2.8274;
lbx3=0;ubx3=2.8274;
lbx4=0;ubx4=2.8274;
lbx5=0;ubx5=2.8274;
NIND=100;        %个体数目
NVAR=5;
MAXGEN=30;      %最大遗传代数
PRECI=20;       %变量的二进制位数
GGAP=0.95;      %代沟
px=0.6;         %交叉概率
pm=0.1;        %变异概率
trace=zeros(MAXGEN,NVAR+1);                        %寻优结果的初始值

% 3、建立区域描述器
%     FieldD=[   len:初始种群中每个子串的长度
%                     lb:每个变量的下界
%                     ub:每个变量的上界
%                     code:编码方式，1为二进制编码，0为格雷编码
%                     scale:每个子串的刻度，1是对数刻度，0是算数刻度
%                     lbin:下界是否包含边界，1包含，0不包含
%                     ubin:上界是否包含边界，1包含，0不包含
%                 ];
%     MatOut = rep(MatIn, REPN):函数rep完成矩阵MatIn的复制，
%     REPN指明复制次数,返回复制后的矩阵MatOut。
%     REPN包含每个方向复制的次数，REPN=[1,2];
%     REPN(1)表示纵向复制次数，REPN(2)表示水平方向复制次数
% 
FieldD=[PRECI PRECI PRECI PRECI PRECI;lbx1 lbx2 lbx3 lbx4 lbx5;ubx1 ubx2 ubx3 ubx4 ubx5;1 1 1 1 1;0 0 0 0 0;1 1 1 1 1;1 1 1 1 1];                      %区域描述器  
% 4、循环前准备：
%     ①创建种群：[Chrom,Lind,BaseV]=crtbp(Nind,Lind,Base)
%        创建一个大小为Nind,个体长度为Lind,各位进制分别是Base的种群
%        返回值Chrom是种群，Lind是个体长度，BaseV是各位进制数
%     ②初始种群十进制化：Phen=bs2rv(Chrom,FieldD)
%        将二进制转化为十进制。
%        Chrom是种群，FieldD是译码矩阵(区域描述器)
%        Phen是一个列向量，每个分量是对应的十进制数
%     ③初始化代计数器：gen=0
%     ④计算初始种群个体的目标函数值：ObjV=objfunction(Phen);
%         此处即是计算我们想要优化的函数的在当前的函数值的地方
% 
Chrom=crtbp(NIND,PRECI*NVAR); 
gen=0;                                  %代计数器
Phen=bs2rv(Chrom,FieldD);                 %计算初始种群的十进制转换
X1=Phen(:,1);X2=Phen(:,2);X3=Phen(:,3);X4=Phen(:,4);X5=Phen(:,5);
ObjV=-5*sin(X1).*sin(X2).*sin(X3).*sin(X4).*sin(X5)-sin(5*X1).*sin(5*X2).*sin(5*X3).*sin(5*X4).*sin(5*X5)+8;        %计算目标函数值
% 5、循环
%       while gen<MAXGEN
%                ①FitnV=ranking(ObjV或-ObjV或者1./ObjV);
%                   ranking按照由小到大的顺序赋予由高到低的适应度值
%                   FitnV是适应度值
%                   因此，要求最大值应用-ObjV，最小值用ObjV
%                ②SelCh=select(SEL_F,Chrom,FitnV,GGAP);
%                   SEL_F是一个选择函数名，如rws(轮盘赌)或sus(随机遍历抽样)
%                   Chrom是旧种群
%                ③SelCh=recombin(REC_F,Chrom，px);
%                   REC_F是一个重组函数名，如recdis(离散重组)或xovsp(单点交叉)
%                ④SelCh=mut(OldChrom,pm,BaseV)
%                   BaseV是变异的基本字符即编码方式
%                ⑤将变异后的种群转化为十进制，并重新计算目标函数值ObjVSel
%                ⑥[SelCh, ObjVCh] = reins(Chrom, SelCh, SUBPOP, InsOpt, ObjVCh, ObjVSel)
%                   Chrom是父代种群，SelCh是子代种群，
%                   SUBPOP指明前两者中子种群的个数
%                   InsOpt(1)指明用子代代替父代的选择方法，0为均匀选择，1为基于适应度的选择，默认为0
%                   InsOpt(2)指明在[0 1]间每个子种群中重插入的子代个体在整个子种群的中个体的比率，默认为1
%                   ObjVch包含Chorm中个体的目标值，对基于适应度的重插入是必需的
%                   ObjVSel包含Selch中个体的目标值，如子代数量大于重插入种群的子代数量是必需的

%                ⑦将重新插入后的种群转化为十进制
%                ⑧代计数器加一，gen=gen+1
%                ⑨遗传算法性能跟踪
%                   trace(gen,NVAR+1)=max(ObjV);  
%                   trace(gen,1:NVAR)=Phen';
%         end
% 
while gen<MAXGEN
   FitnV=ranking(1./ObjV);                              %分配适应度值
   SelCh=select('sus',Chrom,FitnV,GGAP);              %选择
   SelCh=recombin('xovsp',SelCh,px);                  %重组
   SelCh=mut(SelCh,pm);                               %变异
   Phen=bs2rv(SelCh,FieldD);               %子代个体的十进制转换
   X1=Phen(:,1);X2=Phen(:,2);X3=Phen(:,3);X4=Phen(:,4);X5=Phen(:,5);
   ObjVSel= -5*sin(X1).*sin(X2).*sin(X3).*sin(X4).*sin(X5)-sin(5*X1).*sin(5*X2).*sin(5*X3).*sin(5*X4).*sin(5*X5)+8;             %计算子代的目标函数值
   [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %重插入子代到父代，得到新种群
   Phen=bs2rv(Chrom,FieldD);
   X1=Phen(:,1);X2=Phen(:,2);X3=Phen(:,3);X4=Phen(:,4);X5=Phen(:,5);
   gen=gen+1                                      %代计数器增
   if mod(gen,10)==0
       for i=1:NIND
           x=Phen(i,:);         %X_init拿来装每次起始的自变量值，是个行向量
           %X_min=zeros(5,NIND);     %X_min拿来记录每次求出最小值对应的自变量。每列代表一次求出的自变量值们
           %Z_min=zeros(NIND,1);     %Z_min拿来记录每次求出的最小值
           [X_min(:,i),Z_min(i)]=fmincon(inline('8-5*sin(x(1))*sin(x(2))*sin(x(3))*sin(x(4))*sin(x(5))-sin(5*x(1))*sin(5*x(2))*sin(5*x(3))*sin(5*x(4))*sin(5*x(5))'),x,[],[],[],[],[0 0 0 0 0],[2.8274 2.8274 2.8274 2.8274 2.8274]);
       end
       [A,I]=min(Z_min);trace(gen,1)=A;trace(gen,2)=X_min(1,I);trace(gen,3)=X_min(2,I);trace(gen,4)=X_min(3,I);trace(gen,5)=X_min(4,I);trace(gen,6)=X_min(5,I);
   else
        [A,I]=min(ObjV);trace(gen,1)=A;trace(gen,2)=X1(I);trace(gen,3)=X2(I);trace(gen,4)=X3(I);trace(gen,5)=X4(I);trace(gen,6)=X5(I);
   end
end
% 6、寻找最优解
%      index=find(ObjV==max(ObjV));
%      soluiton(1,1:NVAR)=trace(index,1:NVAR);
% 
% 7、输出
figure(1);
plot(1:MAXGEN,trace(:,1));
grid on
xlabel('遗传代数')
ylabel('解的变化')
title('进化过程')
index=find(trace(:,1)==min(trace(:,1)));
trace(index,:)