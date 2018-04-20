% GA main
% using toolbox of GAOT version 5
clc
clf
clear
bounds=ones(12,2);

global r

xmin=0; ymin=0; xmax=200; ymax=150;
r=25; n=6;
bounds(:,1)=zeros(12,1) + r;
bounds(1:6,2)=ones(6,1).*xmax - r;
bounds(7:12,2)=ones(6,1).*ymax - r;

[x,endPop] = ga(bounds,'myfGAPLP',[],[],[1e-6 1 1]);

myfplotcircleGA(x,r,xmax,ymax);

