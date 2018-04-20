close;
clear;
clc;
%% 先画个图出来瞅瞅
figure;
num=xlsread('missioncoordinate.xlsx');
plot(num(:,1),num(:,2),'g*','linewidth',1);
hold on;
load distance.mat;
pdistance=distance;
for i=1:size(pdistance,1)
    pdistance(i,i)=0;
end
for i=1:size(pdistance,1)
    for j=1:size(pdistance,1)
        if pdistance(i,j)==1
            pdistance(j,i)=0;
        end
    end
end
for i=1:size(num,1)
    i
    for j=1:size(num,1)
        if pdistance(i,j)==1
            plot([num(i,1) num(j,1)],[num(i,2) num(j,2)]);
        end
    end
end
hold off;
xlabel('纬度转化坐标');
ylabel('经度转化坐标');
title('三公里内任务点连线图');
%% 所需数据准备
load data.mat
k=0.9;
P=0;
D=0;
%所得利润
dxy=pxy;djs=pjs;drs=prs;drw=prw;
%通过的期望
pxy=xy1;pjs=js1;prs=rs1;prw=rw1;
%所分得十个区间
xyj=(max(feature(:,1))-min(feature(:,1)))/10;
jsj=(max(feature(:,2))-min(feature(:,2)))/10;
rsj=(max(feature(:,3))-min(feature(:,3)))/10;
rwj=(max(feature(:,4))-min(feature(:,4)))/10;
xyd=min(feature(:,1)):xyj:max(feature(:,1));
jsd=min(feature(:,2)):jsj:max(feature(:,2));
rsd=min(feature(:,3)):rsj:max(feature(:,3));
rwd=min(feature(:,4)):rwj:max(feature(:,4));
%利润分点
mon=unique(mon);
%计算每个任务点所对应的p和d
pd=zeros(835,2);
for i=1:835
    if xy(i)>xyd(1)&&xy(i)<=xyd(2)
        flag=1;
    elseif xy(i)>xyd(2)&&xy(i)<=xyd(3)
        flag=2;
    elseif xy(i)>xyd(3)&&xy(i)<=xyd(4)
        flag=3;
    elseif xy(i)>xyd(4)&&xy(i)<=xyd(5)
        flag=4;
    elseif xy(i)>xyd(5)&&xy(i)<=xyd(6)
        flag=5;
    elseif xy(i)>xyd(6)&&xy(i)<=xyd(7)
        flag=6;
    elseif xy(i)>xyd(7)&&xy(i)<=xyd(8)
        flag=7;
    elseif xy(i)>xyd(8)&&xy(i)<=xyd(9)
        flag=8;
    elseif xy(i)>xyd(9)&&xy(i)<=xyd(10)
        flag=9;
    else
        flag=10;
    end
    fflag=find(num1(i,3)==mon);
    %flag是10行，fflag是23列
    p1=pxy(flag,fflag);
    d1=dxy(flag,fflag);
    
    if js(i)>jsd(1)&&js(i)<=jsd(2)
        flag=1;
    elseif js(i)>jsd(2)&&js(i)<=jsd(3)
        flag=2;
    elseif js(i)>jsd(3)&&js(i)<=jsd(4)
        flag=3;
    elseif js(i)>jsd(4)&&js(i)<=jsd(5)
        flag=4;
    elseif js(i)>jsd(5)&&js(i)<=jsd(6)
        flag=5;
    elseif js(i)>jsd(6)&&js(i)<=jsd(7)
        flag=6;
    elseif js(i)>jsd(7)&&js(i)<=jsd(8)
        flag=7;
    elseif js(i)>jsd(8)&&js(i)<=jsd(9)
        flag=8;
    elseif js(i)>jsd(9)&&js(i)<=jsd(10)
        flag=9;
    else
        flag=10;
    end
    fflag=find(num1(i,3)==mon);
    %flag是10行，fflag是23列
    p2=pxy(flag,fflag);
    d2=dxy(flag,fflag);
    
    if rs(i)>rsd(1)&&rs(i)<=rsd(2)
        flag=1;
    elseif rs(i)>rsd(2)&&rs(i)<=rsd(3)
        flag=2;
    elseif rs(i)>rsd(3)&&rs(i)<=rsd(4)
        flag=3;
    elseif rs(i)>rsd(4)&&rs(i)<=rsd(5)
        flag=4;
    elseif rs(i)>rsd(5)&&rs(i)<=rsd(6)
        flag=5;
    elseif rs(i)>rsd(6)&&rs(i)<=rsd(7)
        flag=6;
    elseif rs(i)>rsd(7)&&rs(i)<=rsd(8)
        flag=7;
    elseif rs(i)>rsd(8)&&rs(i)<=rsd(9)
        flag=8;
    elseif rs(i)>rsd(9)&&rs(i)<=rsd(10)
        flag=9;
    else
        flag=10;
    end
    fflag=find(num1(i,3)==mon);
    %flag是10行，fflag是23列
    p3=pxy(flag,fflag);
    d3=dxy(flag,fflag);
    
    if rw(i)>rwd(1)&&rw(i)<=rwd(2)
        flag=1;
    elseif rw(i)>rwd(2)&&rw(i)<=rwd(3)
        flag=2;
    elseif rw(i)>rwd(3)&&rw(i)<=rwd(4)
        flag=3;
    elseif rw(i)>rwd(4)&&rw(i)<=rwd(5)
        flag=4;
    elseif rw(i)>rwd(5)&&rw(i)<=rwd(6)
        flag=5;
    elseif rw(i)>rwd(6)&&rw(i)<=rwd(7)
        rflag=6;
    elseif rw(i)>rwd(7)&&rw(i)<=rwd(8)
        flag=7;
    elseif rw(i)>rwd(8)&&rw(i)<=rwd(9)
        flag=8;
    elseif rw(i)>rwd(9)&&rw(i)<=rwd(10)
        flag=9;
    else
        flag=10;
    end
    fflag=find(num1(i,3)==mon);
    %flag是10行，fflag是23列
    p4=pxy(flag,fflag);
    d4=dxy(flag,fflag);
    P=P+0.25;
    D=D+4;
    pd(i,1)=(p1+p2+p3+p4)/3;
    pd(i,2)=(d1+d2+d3+d4)/3;
end
%% 计算每个圆心聚类的评价指数c,删除小于0的，c为权值
[xindex,yindex]=find(pdistance==1);%有连线的两个点的编号
delcc=zeros(size(xindex,1),1);
for i=1:size(xindex,1)
    beoc=0.9*(1-pd(xindex(i),1))+0.1/100*pd(xindex(i),2)+...
        0.9*(1-pd(yindex(i),1))+0.1/100*pd(yindex(i),2);
    behc=0.9*(1-(pd(xindex(i),1)+pd(yindex(i),1))/2)+...
        0.1/100*(pd(xindex(i),2)+pd(yindex(i),2))*(1-k);
    delcc(i)=behc-beoc;
end
smaindex=find(delcc<0);%小于0的边的编号
bigindex=find(delcc>0);%大于0的边的编号
%将所有小于0的边覆盖掉
figure;
plot(num(:,1),num(:,2),'g*','linewidth',1);
hold on;
for i=1:length(bigindex)
    plot([num(xindex(bigindex(i)),1),num(yindex(bigindex(i)),1)],...
        [num(xindex(bigindex(i)),2),num(yindex(bigindex(i)),2)],'k','Linewidth',1);
end
xlabel('纬度转化坐标');
ylabel('经度转化坐标');
title('三公里内任务点聚包后变优连线图');
%更新拥有连线的点
xindex(smaindex)=[];
yindex(smaindex)=[];
delcc(smaindex)=[];
smaindex=[];
bigindex=[];
%% 开始聚包
% 找出权值最大的线段，将其聚为一类，
% 以其中一点为圆中心，考察中心与其他点相连线段，
% 若权值为该点最大权值，将该点进行聚类，否则不聚类，
% 考察所有其他点，并将权值相加，同时考量另一个点，
% 取权值相加概率较大的点为中心。
% 并断除另一个点中心相连线段中超出该区域的点的线段;
bagnum=1;
inbag=[];
cishu=1;
tttttt=1;
while 1
    cishu=cishu+1;
    [m,mindex]=max(delcc);
    left=xindex(mindex);%中心包左面点
    right=yindex(mindex);%中心包右面点
    llindex=find(yindex==left);%左面点的连接点编号
    rrindex=find(xindex==right);%右面点的连接点编号
    lllindex=[];
    rrrindex=[];
    for i=1:length(llindex)
        tlllindex=find(yindex==llindex(i));
        lllindex=[llindex' tlllindex'];
    end
    for i=1:length(rrindex)
        trrrindex=find(xindex==rrindex(i));
        rrrindex=[rrrindex' trrrindex'];
    end
    %这些点聚包得到新包的P和D
    bag=[left right llindex' rrindex'];
    if ~(ismember(left,inbag)&&ismember(right,inbag))
        disp([num2str(num(left,1)) num2str(num(left,2))]);
        rectangle('Position',[761-3,2557-3,6,6],'Curvature',[1,1],'Linewidth',2,'Edgecolor','m');
        rectangle('Position',[num(left,1)-3,num(left,2)-3,6,6],'Curvature',[1,1],'Linewidth',2,'Edgecolor','m');
    end
    inbag=[inbag bag];
    for i=1:length(bag)
        [dx,dy]=find([xindex,yindex]==bag(i));
        xindex(dx,:)=[];
        yindex(dx,:)=[];
        delcc(dx,:)=[];
    end
    bagnumber(bagnum)=length(bag);
    bagP(bagnum)=max(pd(bag,1));
    bagD(bagnum)=(1-k)*sum(pd(bag,2));
    %断开间接链接的点
    for i=1:length(rrrindex)
        index=find(xindex==rrrindex(i));
        xindex(index)=[];
        yindex(index)=[];
        delcc(index)=[];
    end
    for i=1:length(lllindex)
        index=find(yindex==lllindex(i));
        xindex(index)=[];
        yindex(index)=[];
        delcc(index)=[];
    end
    bagnum=bagnum+1;
    if isempty(xindex)
        break;%跳出循环
    end
end
for i=1:835
    if ~ismember(i,inbag)
        P=P+pd(i,1);
        D=D+pd(i,2);
    end
end
P=P+sum(bagP);
P=P/(835-length(inbag)+36);
D=D+sum(bagD);
D=D/(36+835-length(inbag));
disp(P);
disp(D);











