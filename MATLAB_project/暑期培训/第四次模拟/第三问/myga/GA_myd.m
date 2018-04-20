close;
clear 
clc
NIND=100;       %种群大小
MAXGEN=1500;
Pc=0.9;         %交叉概率
Pm=0.05;        %变异概率
GGAP=0.95;      %代沟(Generation gap)
N=10;    %(34*34)
%% 初始化种群
Chrom=InitPop(NIND,N);
%% 输出随机解
disp('初始种群中的一个随机解:')
res1=val(Chrom(1,:));
disp(res1);
disp('其目标函数值：');
disp(val(Chrom(1,:)));
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
%% 优化
gen=0;
maxval=zeros(1,MAXGEN+1);
maxx=zeros(MAXGEN,10);
ObjV=val(Chrom);  
[maxObjV,maxInd]=max(ObjV);
maxval(1)=maxObjV;
maxx(1,:)=Chrom(maxInd,:);
preObjV=max(maxval);
while gen<MAXGEN
    disp(gen);
    %% 计算适应度
    ObjV=val(Chrom);  %计算路线长度
    line([gen-1,gen],[preObjV,max(maxval)]);
    pause(0.0001)
    preObjV=max(maxval);
    FitnV=Fitness(ObjV);
    %% 选择
    SelCh=Select(Chrom,FitnV,GGAP);
    %% 交叉操作
    SelCh=Recombin(SelCh,Pc);
    %% 重插入子代的新种群
    Chrom=Reins(Chrom,SelCh,ObjV);
    %% 记录最优解
    ObjV=val(Chrom);  
    [maxObjV,maxInd]=max(ObjV);
    maxval(gen+2)=maxObjV;
    maxx(gen+2,:)=Chrom(maxInd,:);
    %% 更新迭代次数
    gen=gen+1 ;
end
hold off;
%% 输出最优解
disp('最优解:')
[resval,resx]=max(maxval);
disp(['目标函数值：',num2str(resval)]);
disp(['车辆数:',num2str(maxx(resx,:))]);
disp('-------------------------------------------------------------')
