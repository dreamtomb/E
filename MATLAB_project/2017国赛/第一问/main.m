%% 第一问
close;
clear;
clc;
%% 处理数据
%num1格式:纬度，经度，任务标价，执行情况
[num1,txt1,raw1]=xlsread('1.xls');
%num2格式:纬度，经度，任务开始时间，信誉值
[num2,txt2,raw2]=xlsread('2.xlsx');
%num3格式:纬度，经度
[num3,txt3,raw3]=xlsread('3.xls');
%提取出任务纬度经度和会员经纬度
missionlatlon=num1(:,1:2);
memberlatlon=num2(:,1:2);
%将经纬度转化为直角坐标
axesm utm   %设置投影方式，
Z=utmzone(missionlatlon);%根据latlon里面的数据选择合适的投影区域
setm(gca,'zone',Z);
h = getm(gca);
R=zeros(size(missionlatlon));
for i=1:length(missionlatlon)
    [x,y]= mfwdtran(h,missionlatlon(i,1),missionlatlon(i,2)); %逐个进行转换
    x=x/1000;
    y=y/1000;
    R(i,:)=[x;y];
end
xlswrite('missioncoordinate.xlsx',R,1,'A1');
figure;
axesm utm   %设置投影方式，
ZZ=utmzone(missionlatlon);%根据latlon里面的数据选择合适的投影区域
setm(gca,'zone',ZZ);
hh = getm(gca);
RR=zeros(size(memberlatlon));
for i=1:length(memberlatlon)
    [xx,yy]= mfwdtran(hh,memberlatlon(i,1),memberlatlon(i,2)); %逐个进行转换
    xx=xx/1000;
    yy=yy/1000;
    RR(i,:)=[xx;yy];
end
xlswrite('membercoordinate.xlsx',RR,1,'A1');
%% 画图:会员和任务的分布图
%任务位置(R)是红色，会员位置(RR)是绿色；
figure;
plot(RR(:,1),RR(:,2),'go','linewidth',2); %在直角坐标下画出这些台站
xlabel('纬度转化坐标');
ylabel('经度转化坐标');
title('会员位置图');
figure;
plot(R(:,1),R(:,2),'r*','linewidth',1); %在直角坐标下画出这些台站
xlabel('纬度转化坐标');
ylabel('经度转化坐标');
title('任务位置图');
% axis([0 1200000 0 4000000]);
hold off;
figure;
plot(RR(:,1),RR(:,2),'mo','linewidth',2);
hold on;
plot(R(:,1),R(:,2),'c*','linewidth',1);
hold off;
axis([680 870 2450 2650]);
xlabel('纬度转化坐标');
ylabel('经度转化坐标');
title('任务、会员集群位置图');
legend('会员','任务');
close figure 1;
close figure 2;
%% 画三维图：任务的经度纬度，报酬，完成情况
figure;
indexfinished=find(num1(:,4)==1);
indexunfinished=find(num1(:,4)==0);
x=R(indexfinished,1);
y=R(indexfinished,2);
z=num1(indexfinished,3);
xx=R(indexunfinished,1);
yy=R(indexunfinished,2);
zz=num1(indexunfinished,3);%完成
scatter3(x,y,z,'go','linewidth',2);
hold on;
scatter3(xx,yy,zz,'ro','linewidth',2);%未完成
xlabel('纬度');
ylabel('经度');
zlabel('报酬');
title('任务位置、报酬及完成情况散点图');
legend('已完成','未完成');
%% 画图:价格与任务3公里内人数的关系
mon=unique(num1(:,3));
distance=zeros(size(R,1),size(RR,1));%行数是任务数
for i=1:size(R,1)
    for j=1:size(RR,1)
        distance(i,j)=sqrt((R(i,1)-RR(j,1))^2+(R(i,2)-RR(j,2))^2);
    end
end
path=0;
peo=zeros(1,length(mon));
for k=1:length(mon)
    pindex=find(num1(:,3)==mon(k));%每一类任务编号
    for i=1:size(pindex,1)
        index=find(distance(pindex(i),:)<3);%每一类任务3公里内人
        peo(k)=peo(k)+length(index);
    end
    peo(k)=peo(k)/length(pindex);
end
figure;
plot(mon,peo,'o');
title('价格与任务3公里内人数的关系(实际)');
xlabel('报酬');
ylabel('任务三公里内人数');
figure;
x1=65:80;
y1=2.398*10^11*exp(-0.3522*x1);
plot(x1,y1);
hold on;
x2=80:85;
y2=4.46*10^9*exp(-0.2424*x2);
plot(x2,y2);
hold off;
title('价格与任务3公里内人数的关系(拟合)');
xlabel('报酬');
ylabel('任务三公里内人数');
%% 价格与任务3公里内任务数的关系
mon=unique(num1(:,3));
ddistance=zeros(size(R,1),size(R,1));%行数是任务数
for i=1:size(R,1)
    for j=1:size(R,1)
        ddistance(i,j)=sqrt((R(i,1)-R(j,1))^2+(R(i,2)-R(j,2))^2);
    end
end
path=0;
peo=zeros(1,length(mon));
for k=1:length(mon)
    pindex=find(num1(:,3)==mon(k));%每一类任务编号
    for i=1:size(pindex,1)
        index=find(ddistance(pindex(i),:)<3);%每一类任务3公里内任务
        peo(k)=peo(k)+length(index);
    end
    peo(k)=peo(k)/length(pindex);
end
figure;
plot(mon,peo,'o');
title('价格与任务3公里内任务数的关系');
ylabel('任务三公里内任务数');
xlabel('报酬');
figure;
x1=65:80;
y1=7446000*exp(-0.206*x1);
plot(x1,y1);
hold on;
plot(mon,peo,'o');
x2=80:85;
y2=6556*exp(-0.08499*x2);
plot(x2,y2);
hold off;
title('价格与任务3公里内任务数的关系');
ylabel('任务三公里内任务数');
xlabel('报酬');
%% 价格与任务3公里内人的信誉度的关系
mon=unique(num1(:,3));
distance=zeros(size(R,1),size(RR,1));%行数是任务数
for i=1:size(R,1)
    for j=1:size(RR,1)
        distance(i,j)=sqrt((R(i,1)-RR(j,1))^2+(R(i,2)-RR(j,2))^2);
    end
end
path=0;
peo=zeros(1,length(mon));
for k=1:length(mon)
    pindex=find(num1(:,3)==mon(k));%每一类任务编号
    for i=1:size(pindex,1)
        index=find(distance(pindex(i),:)<3);%每一类任务3公里内人
        for j=1:length(index)
            peo(k)=peo(k)+num2(index(j),4);
        end
    end
    peo(k)=peo(k)/length(pindex);
end
figure;
plot(mon,peo,'o');
title('价格与任务3公里内人信誉值的关系');
xlabel('任务三公里内人信誉值');
ylabel('报酬');
figure;
x1=65:80;
y1=3.932*10^18*exp(-0.5188*x1);
plot(x1,y1);
hold on;
x2=80:85;
y2=3.591*10^23*exp(-0.579*x2);
plot(x2,y2);
hold off;
%% 价格与任务3公里内人的可接任务数的关系
mon=unique(num1(:,3));
distance=zeros(size(R,1),size(RR,1));%行数是任务数
for i=1:size(R,1)
    for j=1:size(RR,1)
        distance(i,j)=sqrt((R(i,1)-RR(j,1))^2+(R(i,2)-RR(j,2))^2);
    end
end
path=0;
peo=zeros(1,length(mon));
for k=1:length(mon)
    pindex=find(num1(:,3)==mon(k));%每一类任务编号
    for i=1:size(pindex,1)
        index=find(distance(pindex(i),:)<3);%每一类任务3公里内人
        for j=1:length(index)
            peo(k)=peo(k)+num2(index(j),5);
        end
    end
    peo(k)=peo(k)/length(pindex);
end
figure;
plot(mon,peo,'o');
title('价格与任务3公里内人可接任务数的关系');
xlabel('任务三公里内人的可接任务数');
ylabel('报酬');
% x1=mon(1:21);
% x2=mon(22:23);
% y1=peo(1:21);
% y2=peo(22:23);
figure;
x1=65:80;
y1=1.69*10^12*exp(-0.3529*x1);
plot(x1,y1);
hold on;
x2=80:85;
y2=1.594*10^9*exp(-0.2084*x2);
plot(x2,y2);
hold off;
%% 固定人数，任务数，两个难度阶段，分析影响因素
%信誉度
mon=unique(num1(:,3));
distance=zeros(size(R,1),size(RR,1));%行数是任务数
for i=1:size(R,1)
    for j=1:size(RR,1)
        distance(i,j)=sqrt((R(i,1)-RR(j,1))^2+(R(i,2)-RR(j,2))^2);
    end
end
xy=zeros(1,size(R,1));
for i=1:size(R,1)
    index=find(distance(i,:)<3);%每个任务3公里内人
    for j=1:length(index)
        xy(i)=xy(i)+num2(index(j),4);
    end
    xy(i)=xy(i)/length(index);
end
index=find(isnan(xy)==1);
xy(index)=0;
%接受数
mon=unique(num1(:,3));
distance=zeros(size(R,1),size(RR,1));%行数是任务数
for i=1:size(R,1)
    for j=1:size(RR,1)
        distance(i,j)=sqrt((R(i,1)-RR(j,1))^2+(R(i,2)-RR(j,2))^2);
    end
end
js=zeros(1,size(R,1));
for i=1:size(R,1)
    index=find(distance(i,:)<3);%每个任务3公里内人
    for j=1:length(index)
        js(i)=js(i)+num2(index(j),5);
    end
    js(i)=js(i)/length(index);
end
index=find(isnan(js)==1);
js(index)=0;
%范围内人数
mon=unique(num1(:,3));
distance=zeros(size(R,1),size(RR,1));%行数是任务数
for i=1:size(R,1)
    for j=1:size(RR,1)
        distance(i,j)=sqrt((R(i,1)-RR(j,1))^2+(R(i,2)-RR(j,2))^2);
    end
end
rs=zeros(1,size(R,1));
for i=1:size(R,1)
    index=find(distance(i,:)<3);%每个任务3公里内人
    rs(i)=length(index);
end
index=find(isnan(rs)==1);
rs(index)=0;
%范围内任务数
mon=unique(num1(:,3));
distance=zeros(size(R,1),size(R,1));%行数是任务数
for i=1:size(R,1)
    for j=1:size(R,1)
        distance(i,j)=sqrt((R(i,1)-R(j,1))^2+(R(i,2)-R(j,2))^2);
    end
end
rw=zeros(1,size(R,1));
for i=1:size(R,1)
    index=find(distance(i,:)<3);%每个任务3公里内人
    rw(i)=length(index);
end
index=find(isnan(rw)==1);
rw(index)=0;
feature=[xy' js' rs' rw' num1(:,4)];
figure;
plot(1:835,feature(:,1)','r');
figure;
plot(1:835,feature(:,2)','y');
figure;
plot(1:835,feature(:,3)','g');
figure;
plot(1:835,feature(:,4)','k');
figure;
plot(1:835,feature(:,5)','b');









