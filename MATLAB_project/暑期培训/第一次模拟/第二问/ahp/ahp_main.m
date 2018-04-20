%% 目标层对准则层的判断矩阵
p=[4 2 1];
for i=1:3
    for j=1:3
        a(i,j)=p(i)/p(j);
    end
end;

%% 准则层产值对方案层的判断矩阵
p=[5 4 2 3 2 1];
b=[];
for i=1:6
    for j=1:6
        b(i,j)=p(i)/p(j);
    end
end;

%% 准则层收入对方案层的判断矩阵
p=[1 2 5 5 3];
c=[];
for i=1:5
    for j=1:5
        c(i,j)=p(i)/p(j);
    end
end;

%% 准则层产业结构对方案层的判断矩阵
p=[1 3 3];
d=[];
for i=1:3
    for j=1:3
        d(i,j)=p(i)/p(j);
    end
end;

%% 主程序
[max(1),wA]=ahp(a);
[max(2),wb]=ahp(b);
[max(3),wc]=ahp(c);
[max(4),wd]=ahp(d);

RIT=CalculationRI();%计算平均一致性指标

[RIA,CIA]=sglsortexamine(max(1),a,RIT);
[RIb,CIb]=sglsortexamine(max(2),b,RIT);
[RIc,CIc]=sglsortexamine(max(3),c,RIT);
[RId,CId]=sglsortexamine(max(4),d,RIT);

dw=zeros(14,1);
dw(1:6,1)=wb;
dw(7:11,1)=wc;
dw(12:14,1)=wd;

CIC=[CIb;CIc;CId];
RIC=[RIb;RIc;RId];
tw=tolsortvec(wA,dw,CIC,RIC)';
wA %输出准则层对目标层权重
dw %输出准则层对方案层权重
tw  %输出总排序权值
res=tw';%最后得到20首歌的难度向量
[score,songnum]=sort(res);
[score,songnum]