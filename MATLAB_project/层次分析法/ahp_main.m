%% 目标层对准则层的判断矩阵
a=[1 2 4;1/2 1 2; 1/4 1/2 1];

%% 准则层年代对方案层的判断矩阵
p=[4 4 4 2 1 4 2 2 1 2 1 1 2 4 1 1 4 1 1 1];
b=[];
for i=1:20
    for j=1:20
        b(i,j)=p(i)/p(j);
    end
end;

%% 准则层歌手对方案层的判断矩阵
p=[4 1 4 4 1 2 4 1 4 1 1 2 1 4 2 4 2 1 4 1];
c=[];
for i=1:20
    for j=1:20
        c(i,j)=p(i)/p(j);
    end
end;

%% 准则层歌曲类型对方案层的判断矩阵
p=[4 4 4 4 1 4 4 4 1 4 1 1 4 4 2 1 4 2 2 1];
d=[];
for i=1:20
    for j=1:20
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

dw=zeros(7,3);
dw(1:20,1)=wb;
dw(1:20,2)=wc;
dw(1:20,3)=wd;

CIC=[CIb;CIc;CId];
RIC=[RIb;RIc;RId];
tw=tolsortvec(wA,dw,CIC,RIC)';
wA %输出准则层对目标层权重
dw %输出准则层对方案层权重
tw  %输出总排序权值
res=tw';%最后得到20首歌的难度向量
[diffcult,songnum]=sort(res);
[diffcult,songnum]