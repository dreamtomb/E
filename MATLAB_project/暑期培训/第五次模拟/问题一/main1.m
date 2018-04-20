%% LOF算法对八个时段的三个值分别寻找异常点
close;
clear
clc;
k=100;
load data.mat;
close;
%% 第一时段高峰的三个指标
fhn1=res{1,1};
x=firstclasshighlow:firstclasshighhigh;
plot(x,fhn1);
loffirsthighnum=lof(x,fhn1,k);
fhn2=res{1,3};
plot(x,fhn2);
loffirsthighp=lof(x,fhn2,k);
fhn3=res{1,5};
plot(x,fhn3);
loffirsthightime=lof(x,fhn3,k);
%% 第一时段低峰的三个指标
fhn1=res{5,1};
x=[1:firstclasshighlow-1,firstclasshighhigh+1:1440];
plot(x,fhn1);
loffirstlownum=lof(x,fhn1,k);
fhn2=res{5,3};
plot(x,fhn2);
loffirstlowp=lof(x,fhn2,k);
fhn3=res{5,5};
plot(x,fhn3);
loffirstlowtime=lof(x,fhn3,k);
%% 第二时段高峰的三个指标
fhn1=res{2,1};
x=secondclasshighlow:secondclasshighhigh;
plot(x,fhn1);
lofsecondhighnum=lof(x,fhn1,k);
fhn2=res{2,3};
plot(x,fhn2);
lofsecondhighp=lof(x,fhn2,k);
fhn3=res{2,5};
plot(x,fhn3);
lofsecondhightime=lof(x,fhn3,k);
%% 第二时段低峰的三个指标
fhn1=res{6,1};
x=[1:secondclasshighlow-1,secondclasshighhigh+1:1440];
plot(x,fhn1);
lofsecondlownum=lof(x,fhn1,k);
fhn2=res{6,3};
plot(x,fhn2);
lofsecondlowp=lof(x,fhn2,k);
fhn3=res{6,5};
plot(x,fhn3);
lofsecondlowtime=lof(x,fhn3,k);
%% 第三时段高峰的三个指标
fhn1=res{3,1};
x=thirdclasshighlow:thirdclasshighhigh;
plot(x,fhn1);
lofthirdhighnum=lof(x,fhn1,k);
fhn2=res{3,3};
plot(x,fhn2);
lofthirdhighp=lof(x,fhn2,k);
fhn3=res{3,5};
plot(x,fhn3);
lofthirdhightime=lof(x,fhn3,k);
%% 第三时段低峰的三个指标
fhn1=res{7,1};
x=[1:thirdclasshighlow-1,thirdclasshighhigh+1:1440];
plot(x,fhn1);
lofthirdlownum=lof(x,fhn1,k);
fhn2=res{7,3};
plot(x,fhn2);
lofthirdlowp=lof(x,fhn2,k);
fhn3=res{7,5};
plot(x,fhn3);
lofthirdlowtime=lof(x,fhn3,k);
%% 第四时段高峰的三个指标
fhn1=res{4,1};
x=fourthclasshighlow:fourthclasshighhigh;
plot(x,fhn1);
loffourhighnum=lof(x,fhn1,k);
fhn2=res{4,3};
plot(x,fhn2);
loffourhighp=lof(x,fhn2,k);
fhn3=res{4,5};
plot(x,fhn3);
loffourhightime=lof(x,fhn3,k);
%% 第四时段低峰的三个指标
fhn1=res{8,1};
x=[1:fourthclasshighlow-1,fourthclasshighhigh+1:1440];
plot(x,fhn1);
loffourlownum=lof(x,fhn1,k);
fhn2=res{8,3};
plot(x,fhn2);
loffourlowp=lof(x,fhn2,k);
fhn3=res{8,5};
plot(x,fhn3);
loffourlowtime=lof(x,fhn3,k);
close;
save lofdata.mat








