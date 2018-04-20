%记录中含有的人员名单
name={'毕婕靖' '蔡月' '曾帅' '陈斓' '高淼' '康芸晴' '柯雅芸' '李熹俊' '梁茵' '廖颜翠' '林礼琴' '凌慧雯' '刘菁芸' '刘松荷' '柳谓' '陆盈' '骆娴' '孟芳' '潘澜巧' '潘立' '彭荃' '孙锦' '孙怡毓' '孙翼茜' '童豫' '涂蕴知' '王蕴姣' '文芝' '吴霄' '吴宇晓' '谢斑尚' '易贞' '张荆' '张培芸' '张庭琪' '钟倩'};
%导入名单
[num,txt,raw]=xlsread('2017第十届华中地区数学建模邀请赛_经典赛B题_附件_通话记录');
%循环遍历
pres=zeros(36,2);
for i=1:36
    res1=strcmp(txt(:,3), name(i));
    out=find(res1==1);
    outnum=length(out);%打出的电话数目
    res2=strcmp(txt(:,5), name(i));
    in=find(res2==1);
    innum=length(in);%打入的电话数目
    pres(i,1)=outnum;
    pres(i,2)=innum;
end
%% 目标层对准则层的判断矩阵
a=[1 9/7 9/5;7/9 1 7/5;5/9 5/7 1];

%% 准则层打电话频率对方案层的判断矩阵
p=pres(:,1);
p=p';
b=[];
for i=1:36
    for j=1:36
        b(i,j)=p(i)/p(j);
    end
end;

%% 准则层打电话/打电话+接电话对方案层的判断矩阵
p1=pres(:,1);
p1=p1';
p2=pres(:,2);
p2=p2';
p=p1./(p1+p2);
c=[];
for i=1:36
    for j=1:36
        c(i,j)=p(i)/p(j);
    end
end;

%% 准则层电话时长对方案层的判断矩阵
p=[7,9,3,3,1,1,1,3,3,1,1,1,1,3,1,1,1,1,1,7,1,1,1,3,1,1,1,1,1,1,1,3,5,7,1,3];
d=[];
for i=1:36
    for j=1:36
        d(i,j)=p(i)/p(j);
    end
end;

%% 主程序
[max(1),wA]=ahp(a);
[max(2),wb]=ahp(b);
[max(3),wc]=ahp(c);
[max(4),wd]=ahp(d);

RIT=CalculationRI(36);%计算平均一致性指标

[RIA,CIA]=sglsortexamine(max(1),a,RIT);
[RIb,CIb]=sglsortexamine(max(2),b,RIT);
[RIc,CIc]=sglsortexamine(max(3),c,RIT);
[RId,CId]=sglsortexamine(max(4),d,RIT);

dw=zeros(36,3);
dw(1:36,1)=wb;
dw(1:36,2)=wc;
dw(1:36,3)=wd;

CIC=[CIb;CIc;CId];
RIC=[RIb;RIc;RId];
tw=tolsortvec(wA,dw,CIC,RIC)';
wA %输出准则层对目标层权重
dw %输出准则层对方案层权重
tw  %输出总排序权值
res=tw';%最后得到36个人的难度向量
[pro,pernum]=sort(res);
res=[pro,pernum];



