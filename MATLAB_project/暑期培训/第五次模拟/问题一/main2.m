%% SAX算法对八个时段的三个值分别寻找异常点
close;
clear
clc;
load data.mat;
close;
%% 第一时段高峰的三个指标
fhn1=res{1,1};
x=firstclasshighlow:firstclasshighhigh;
jiangweifhnhighnum=sax(x,fhn1);
fhn2=res{1,3};
jiangweifhn=sax(x,fhn2);
fhn3=res{1,5};
jiangweifhn=sax(x,fhn3);
%% 第一时段低峰的三个指标
fhn1=res{5,1};
x=[1:firstclasshighlow-1,firstclasshighhigh+1:1440];
jiangweifhnlownum=sax2(x,fhn1);
fhn2=res{5,3};
jiangweifhn=sax2(x,fhn2);
fhn3=res{5,5};
jiangweifhn=sax2(x,fhn3);
%% 第二时段高峰的三个指标
fhn1=res{2,1};
x=secondclasshighlow:secondclasshighhigh;
jiangweifhn=sax(x,fhn1);
fhn2=res{2,3};
jiangweifhn=sax(x,fhn2);
fhn3=res{2,5};
jiangweifhn=sax(x,fhn3);
%% 第二时段低峰的三个指标
fhn1=res{6,1};
x=[1:secondclasshighlow-1,secondclasshighhigh+1:1440];
jiangweifhn=sax2(x,fhn1);
fhn2=res{6,3};
jiangweifhn=sax2(x,fhn2);
fhn3=res{6,5};
jiangweifhn=sax2(x,fhn3);
%% 第三时段高峰的三个指标
fhn1=res{3,1};
x=thirdclasshighlow:thirdclasshighhigh;
jiangweifhn=sax(x,fhn1);
fhn2=res{3,3};
jiangweifhn=sax(x,fhn2);
fhn3=res{3,5};
jiangweifhn=sax(x,fhn3);
%% 第三时段低峰的三个指标
fhn1=res{7,1};
x=[1:thirdclasshighlow-1,thirdclasshighhigh+1:1440];
jiangweifhn=sax2(x,fhn1);
fhn2=res{7,3};
jiangweifhn=sax2(x,fhn2);
fhn3=res{7,5};
jiangweifhn=sax2(x,fhn3);
%% 第四时段高峰的三个指标
fhn1=res{4,1};
x=fourthclasshighlow:fourthclasshighhigh;
jiangweifhn=sax(x,fhn1);
fhn2=res{4,3};
jiangweifhn=sax(x,fhn2);
fhn3=res{4,5};
jiangweifhn=sax(x,fhn3);
%% 第四时段低峰的三个指标
fhn1=res{8,1};
x=[1:fourthclasshighlow-1,fourthclasshighhigh+1:1440];
jiangweifhn=sax2(x,fhn1);
fhn2=res{8,3};
jiangweifhn=sax2(x,fhn2);
fhn3=res{8,5};
jiangweifhn=sax2(x,fhn3);
















