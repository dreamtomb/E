close;
clear
clc;
load data.mat
load jiangwei.mat
load data.mat
close;
time=119512:120933;
fenjie=[515 1191];
wd=data(time,4);
high=wd(515:1191)';
low=[wd(1:514);wd(1192:length(wd))]';
k=100;
highlofres=lof(515:1191,high,k);
jiangweihigh=sax(515:1191,high);
lowlofres=lof([1:514 1191:1422],low,k);
jiangweilow=sax2([1:513 1191:1422],low);
%% 开始对两个符号序列进行检测
%高峰
ph=jiangweihigh;
ph=unique(ph);
qh=jiangweifhnhighnum;
qh=unique(qh);
disth=zeros(1,length(high));
for i=1:length(ph)
    if abs(ph(i)-qh(i))<=1
        disth(i)=0;
    else
        if ph(i)>qh(i)
            disth(i)=ph(i)-qh(i);
        else
            disth(i)=qh(i)-ph(i);
        end
    end
end
symboldisthigh=sqrt(length(high)/10)*sqrt(sum(disth.^2));
%低峰
pl=jiangweilow;
pl=unique(pl);
ql=jiangweifhnlownum;
ql=unique(ql);
distl=zeros(1,length(low));
for i=1:length(pl)
    if abs(pl(i)-ql(i))<=1
        distl(i)=0;
    else
        if pl(i)>ql(i)
            distl(i)=pl(i)-ql(i);
        else
            distl(i)=ql(i)-pl(i);
        end
    end
end
symboldistlow=sqrt(length(low)/10)*sqrt(sum(distl.^2));










