%% 遗传算法流程介绍
% 算法流程：
%
%1、清空环境变量 
%     close；clear；clc；
%
%2、定义遗传算法参数：
%     个体数目：NIND
%     最大遗传代数：MAXGEN
%     变量维数：NVAR优化的问题中有几个属性
%     变量长度：PRECI每个属性用多长的基因描述
%     代沟：GGAP
%     交叉概率：px
%     变异概率：pm
%     存放寻优结果：trace=zeros(MAXGEN,2);
%     trace(1,:)存放解的变化，trace(2,:)存放均值的变化
% 
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
%                   trace(gen,1)=max(ObjV);    
%                   trace(gen,2)=sum(ObjV)/length(ObjV);
%         end
% 
% 6、寻找最优解
% for i=1:NIND
%     if ObjV(i)==max(ObjV)
%         value=Phen(i,:);
%         break
%     end
% end
% 7、输出
% objvalue=max(ObjV);
% plot(trace(:,1));hold on;
% plot(trace(:,2),'-.');grid;
% legend('解的变化','种群均值的变化')

%% 遗传算法实例开始
%% 清空变量
clear;
clc;

%% 定义遗传算法参数
NIND=40;    %个体数目（Number of individuals）
MAXGEN=200;    %最大遗传代数(Maximum number. of generations)
NVAR=9;    %变量的维数
PRECI=20;    %变量的二进制位数(Precision of variables)
GGAP=0.9;    %代沟（Generation gap）
px=0.7;     %交叉概率
pm=0.01;    %变异概率
trace=zeros(MAXGEN,2);    %寻优结果的初始值
 
%% 建立区域描述器(Build field descriptor)
vlb=0.5*[110 66 222 118 72 76 30 40 40];
vub=[69 44 155 79 50 42 17 25 22];
ub=[vlb;vub];
FieldD=[rep(PRECI,[1,NVAR]);ub;rep([1;0;1;1],[1,NVAR])];
 
%% 循环前准备
Chrom=crtbp(NIND,NVAR*PRECI);    %创建初始种群（2进制）
Phen=bs2rv(Chrom,FieldD);    %初始种群的10进制化
gen=0;                      %代计数器
ObjV=objfunction(Phen);%计算初始种群个体的目标函数值

%% 开始循环
while gen<MAXGEN
    
    f=ranking(-ObjV);    %分配适应度值（Assign fitness values
    FitnV=fit(f,Phen);
    SelCh=select('sus',Chrom,FitnV,GGAP);    %选择
    SelCh=recombin('xovsp',SelCh,px);    %重组
    SelCh=mut(SelCh);    %变异  
    Phen=bs2rv(SelCh,FieldD);
    ObjVSel=objfunction(Phen);
    %重插入子代的新种群
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);    
    Phen=bs2rv(Chrom,FieldD);
    gen=gen+1;    %代计数器增加
    trace(gen,1)=max(ObjV);    %遗传算法性能跟踪
    trace(gen,2)=sum(ObjV)/length(ObjV);
end

%% zhoa
for i=1:NIND
    if ObjV(i)==max(ObjV)
        value=Phen(i,:);
        break
    end
end

%%
objvalue=max(ObjV);
plot(trace(:,1));hold on;
plot(trace(:,2),'-.');grid;
legend('解的变化','种群均值的变化')


