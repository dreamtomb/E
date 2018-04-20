close;
clear;
clc;
load data.mat
mon=unique(mon);
%% 计算第一问中误差范围
% figure;
% x1=65:80;
% y1=2.398*10^11*exp(-0.3522*x1);
% plot(x1,y1);
% hold on;
% x2=80:85;
% y2=4.46*10^9*exp(-0.2424*x2);
% plot(x2,y2);
% index=find(feature(:,5)==1);
% plot(num1(index,3),feature(index,3),'go');
% index=find(feature(:,5)==0);
% plot(num1(index,3),feature(index,3),'ro');
%% 各个区间每个利润的概率，feature=[xy' js' rs' rw' 0/1];
xyj=(max(feature(:,1))-min(feature(:,1)))/10;
jsj=(max(feature(:,2))-min(feature(:,2)))/10;
rsj=(max(feature(:,3))-min(feature(:,3)))/10;
rwj=(max(feature(:,4))-min(feature(:,4)))/10;
xyd=min(feature(:,1)):xyj:max(feature(:,1));
jsd=min(feature(:,2)):jsj:max(feature(:,2));
rsd=min(feature(:,3)):rsj:max(feature(:,3));
rwd=min(feature(:,4)):rwj:max(feature(:,4));
%xyd
xyqq=zeros(1,10);
pxy=zeros(10,23);
for i=1:10
    index=find(xy>xyd(i)&xy<xyd(i+1));%区间内的值
    xyqq(i)=length(index)/size(num1,1);
    for j=1:23
        jindex=find(num1(index,3)==mon(j));
        pxy(i,j)=length(jindex)/length(index);
    end
end
index=find(isnan(pxy)==1);
pxy(index)=0;
%jsd
pjs=zeros(10,23);
jsqq=zeros(1,10);
for i=1:10
    index=find(js>jsd(i)&js<jsd(i+1));%区间内的值
    for j=1:23
        jsqq(i)=length(index)/size(num1,1);
        jindex=find(num1(index,3)==mon(j));
        pjs(i,j)=length(jindex)/length(index);
    end
end
index=find(isnan(pjs)==1);
pjs(index)=0;
%rsd
prs=zeros(10,23);
rsqq=zeros(1,10);
for i=1:10
    index=find(rs>rsd(i)&rs<rsd(i+1));%区间内的值
    rsqq(i)=length(index)/size(num1,1);
    for j=1:23
        jindex=find(num1(index,3)==mon(j));
        prs(i,j)=length(jindex)/length(index);
    end
end
index=find(isnan(prs)==1);
prs(index)=0;
%rwd
prw=zeros(10,23);
rwqq=zeros(1,10);
for i=1:10
    index=find(rw>rwd(i)&rw<rwd(i+1));%区间内的值
    rwqq(i)=length(index)/size(num1,1);
    for j=1:23
        jindex=find(num1(index,3)==mon(j));
        prw(i,j)=length(jindex)/length(index);
    end
end
index=find(isnan(prw)==1);
prw(index)=0;
p=(pxy+prs+prw+pjs)/4;
%% 验证
%先做xy
resxy=zeros(23,835);
for i=1:835
    if xy(i)>xyd(1)&&xy(i)<=xyd(2)
        resxy(:,i)=pxy(1,:);
    elseif xy(i)>xyd(2)&&xy(i)<=xyd(3)
        resxy(:,i)=pxy(2,:);
    elseif xy(i)>xyd(3)&&xy(i)<=xyd(4)
        resxy(:,i)=pxy(3,:);
    elseif xy(i)>xyd(4)&&xy(i)<=xyd(5)
        resxy(:,i)=pxy(4,:);
    elseif xy(i)>xyd(5)&&xy(i)<=xyd(6)
        resxy(:,i)=pxy(5,:);
    elseif xy(i)>xyd(6)&&xy(i)<=xyd(7)
        resxy(:,i)=pxy(6,:);
    elseif xy(i)>xyd(7)&&xy(i)<=xyd(8)
        resxy(:,i)=pxy(7,:);
    elseif xy(i)>xyd(8)&&xy(i)<=xyd(9)
        resxy(:,i)=pxy(8,:);
    elseif xy(i)>xyd(9)&&xy(i)<=xyd(10)
        resxy(:,i)=pxy(9,:);
    else 
        resxy(:,i)=pxy(10,:);
    end
end
%做js
resjs=zeros(23,835);
for i=1:835
    if js(i)>jsd(1)&&js(i)<=jsd(2)
        resjs(:,i)=pjs(1,:);
    elseif js(i)>jsd(2)&&js(i)<=jsd(3)
        resjs(:,i)=pjs(2,:);
    elseif js(i)>jsd(3)&&js(i)<=jsd(4)
        resjs(:,i)=pjs(3,:);
    elseif js(i)>jsd(4)&&js(i)<=jsd(5)
        resjs(:,i)=pjs(4,:);
    elseif js(i)>jsd(5)&&js(i)<=jsd(6)
        resjs(:,i)=pjs(5,:);
    elseif js(i)>jsd(6)&&js(i)<=jsd(7)
        resjs(:,i)=pjs(6,:);
    elseif js(i)>jsd(7)&&js(i)<=jsd(8)
        resjs(:,i)=pjs(7,:);
    elseif js(i)>jsd(8)&&js(i)<=jsd(9)
        resjs(:,i)=pjs(8,:);
    elseif js(i)>jsd(9)&&js(i)<=jsd(10)
        resjs(:,i)=pjs(9,:);
    else
        resjs(:,i)=pjs(10,:);
    end
end
%做rs
resrs=zeros(23,835);
for i=1:835
    if rs(i)>rsd(1)&&rs(i)<=rsd(2)
        resrs(:,i)=prs(1,:);
    elseif rs(i)>rsd(2)&&rs(i)<=rsd(3)
        resrs(:,i)=prs(2,:);
    elseif rs(i)>rsd(3)&&rs(i)<=rsd(4)
        resrs(:,i)=prs(3,:);
    elseif rs(i)>rsd(4)&&rs(i)<=rsd(5)
        resrs(:,i)=prs(4,:);
    elseif rs(i)>rsd(5)&&rs(i)<=rsd(6)
        resrs(:,i)=prs(5,:);
    elseif rs(i)>rsd(6)&&rs(i)<=rsd(7)
        resrs(:,i)=prs(6,:);
    elseif rs(i)>rsd(7)&&rs(i)<=rsd(8)
        resrs(:,i)=prs(7,:);
    elseif rs(i)>rsd(8)&&rs(i)<=rsd(9)
        resrs(:,i)=prs(8,:);
    elseif rs(i)>rsd(9)&&rs(i)<=rsd(10)
        resrs(:,i)=prs(9,:);
    else 
        resrs(:,i)=prs(10,:);
    end
end
%做rw
resrw=zeros(23,835);
for i=1:835
    if rw(i)>rwd(1)&&rw(i)<=rwd(2)
        resrw(:,i)=prw(1,:);
    elseif rw(i)>rwd(2)&&rw(i)<=rwd(3)
        resrw(:,i)=prw(2,:);
    elseif rw(i)>rwd(3)&&rw(i)<=rwd(4)
        resrw(:,i)=prw(3,:);
    elseif rw(i)>rwd(4)&&rw(i)<=rwd(5)
        resrw(:,i)=prw(4,:);
    elseif rw(i)>rwd(5)&&rw(i)<=rwd(6)
        resrw(:,i)=prw(5,:);
    elseif rw(i)>rwd(6)&&rw(i)<=rwd(7)
        resrw(:,i)=prw(6,:);
    elseif rw(i)>rwd(7)&&rw(i)<=rwd(8)
        resrw(:,i)=prw(7,:);
    elseif rw(i)>rwd(8)&&rw(i)<=rwd(9)
        resrw(:,i)=prw(8,:);
    elseif rw(i)>rwd(9)&&rw(i)<=rwd(10)
        resrw(:,i)=prw(9,:);
    else 
        resrw(:,i)=prw(10,:);
    end
end
res=(resxy+resjs+resrs+resrw)/4;
res=sum(res');
for i=1:23
    ress(i)=length(find(num1(:,3)==mon(i)));
end
E=zeros(1,23);
for i=1:23
    E(i)=res(i)/sum(res)*mon(i);
end
%% 求各个定价下通过的期望
%xy
xy1=zeros(10,23);
for i=1:10
    index=find(feature(:,1)>xyd(i)&feature(:,1)<=xyd(i+1));
    for j=1:23
        pindex=find(num1(index,3)==mon(j));
        tindex=find(feature(index(pindex),5)==1);
        xy1(i,j)=length(tindex)/length(pindex);
    end
end
index=find(isnan(xy1)==1);
xy1(index)=0;
nnxy1=xy1;
for i=1:10
    nnxy1(i,:)=nnxy1(i,:).*E;
end
nnxy1=sum(nnxy1');
%js
js1=zeros(10,23);
for i=1:10
    index=find(feature(:,2)>jsd(i)&feature(:,2)<=jsd(i+1));
    for j=1:23
        pindex=find(num1(index,3)==mon(j));
        tindex=find(feature(index(pindex),5)==1);
        js1(i,j)=length(tindex)/length(pindex);
    end
end
index=find(isnan(js1)==1);
js1(index)=0;
nnjs1=js1;
for i=1:10
    nnjs1(i,:)=nnjs1(i,:).*E;
end
nnjs1=sum(nnjs1');
%rs
rs1=zeros(10,23);
for i=1:10
    index=find(feature(:,3)>rsd(i)&feature(:,3)<=rsd(i+1));
    for j=1:23
        pindex=find(num1(index,3)==mon(j));
        tindex=find(feature(index(pindex),5)==1);
        rs1(i,j)=length(tindex)/length(pindex);
    end
end
index=find(isnan(rs1)==1);
rs1(index)=0;
nnrs1=rs1;
for i=1:10
    nnrs1(i,:)=nnrs1(i,:).*E;
end
nnrs1=sum(nnrs1');
%rw
rw1=zeros(10,23);
for i=1:10
    index=find(feature(:,4)>rwd(i)&feature(:,4)<=rwd(i+1));
    for j=1:23
        pindex=find(num1(index,3)==mon(j));
        tindex=find(feature(index(pindex),5)==1);
        rw1(i,j)=length(tindex)/length(pindex);
    end
end
index=find(isnan(rw1)==1);
rw1(index)=0;
nnrw1=rw1;
for i=1:10
    nnrw1(i,:)=nnrw1(i,:).*E;
end
nnrw1=sum(nnrw1');
save ga.mat
%用835个数据做验证
%% 遗传算法最优化
ga_main();







