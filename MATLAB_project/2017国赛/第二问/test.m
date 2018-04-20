%% 检验直接得到的通过率和通过概率是否相同
close;
clear;
clc;
load ga.mat
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
pd=zeros(835,1);
q=[0.5385;    0.5067;    0.4466;    0.5556;    0.4737;    0.7391;    0.8333;    0.5455;    0.6316;    0.7500;    0.8021;    0.8182;    0.7500;    0.8000;    0.7000;    0.7778;    0.7000;    0.6000;    0.2000;    0.5000;    0.7564;    0.6923;    0.8889;];
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
    %flag是10行，fflag是23列
    p1=pxy(flag,:);
    
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
    %flag是10行，fflag是23列
    p2=pxy(flag,:);
    
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
    %flag是10行，fflag是23列
    p3=pxy(flag,:);
    
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
    %flag是10行，fflag是23列
    p4=pxy(flag,:);
    p=(p1+p2+p3+p4)/4;
    pd(i)=(p*q)/23;
end
mean(pd)













