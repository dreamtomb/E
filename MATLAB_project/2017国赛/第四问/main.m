close;
clear;
clc;
%% 遗传算法最优化
load ga.mat
ga_main();
load model.mat
%% 处理数据
%num1格式:纬度，经度，任务标价，执行情况
[num1,txt1,raw1]=xlsread('1.xls');
%num2格式:纬度，经度，任务开始时间，信誉值
[num2,txt2,raw2]=xlsread('2.xlsx');
%num3格式:纬度，经度
[num3,txt3,raw3]=xlsread('3.xls');
%提取出任务纬度经度和会员经纬度
missionlatlon=num3(:,1:2);
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
%% 计算新的任务的四个指标(R是任务，RR是人物)
%信誉值
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
feature=[xy' js' rs' rw'];
%% 用模型得到每个任务的利润和通过率feature=[xy' js' rs' rw'];
%txy1是通过率，tpxy是利润
% q=[0.0093;    0.0017;    0.0062;    0.0177;    0.0016;    0.0270;    0.2202;    0.0032;    0.0047;    0.0136;    0.2148;    0.0554;    0.0066;    0.0076;    0.0887;    0.0015;    0.0079;    0.0023;    0.0009;    0.0039;    0.0089;    0.0454;   0.2510;  0.0756;
%     0.0582;    0.0823;   0.0411;    0.0845;   0.0795;    0.0099;    0.0543;   0.0632;    0.0041;    0.0023;    0.0147;    0.0211;   0.0580;    0.0470;    0.0289;    0.0118;    0.0519;    0.0208;
%     0.0798;   0.0353;    0.0467;    0.0293;    0.0861;    0.0649;    0.0801;    0.0731;    0.0451;    0.0802;    0.0041;    0.0718;    0.0898;   0.0753;    0.0314;   0.0201;    0.0032;    0.0097;    0.0812;    0.0195;    0.0457;    0.0118;
%     0.0264;   0.0038;    0.0233;    0.0181;    0.0354;    0.0208;    0.0211;    0.0634;    0.0625;    0.0287;    0.0684;    0.0473;    0.0372;    0.0083;    0.0402;    0.0830;    0.0032;    0.0459;    0.0052;    0.0564;    0.0820;    0.0369;    0.0212;    0.0146;    0.0804;    0.0772;    0.0339;    0.0622;];
tg=zeros(size(R,1),23);
restg=zeros(size(R,1),1);
lr=zeros(size(R,1),23);
reslr=zeros(size(R,1),1);
for i=1:size(R,1)
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
    xytg=txy1(flag,:);
    xylr=tpxy(flag,:);
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
    jstg=tjs1(flag,:);
    jslr=tpjs(flag,:);
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
    rstg=trs1(flag,:);
    rslr=tprs(flag,:);
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
    rwtg=trw1(flag,:);
    rwlr=tprw(flag,:);
    tg(i,:)=1/2*(xytg+jstg+rstg+rwtg);
    restg(i)=sum(tg(i,:));
    lr(i,:)=1/3*(xylr+jslr+rslr+rwlr);    
    reslr(i)=sum(lr(i,:));
end
disp(mean(restg));
disp(mean(reslr));








