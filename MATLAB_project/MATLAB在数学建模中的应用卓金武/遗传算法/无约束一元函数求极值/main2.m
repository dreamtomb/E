%% 下求函数f(x)=xsin(10pix)+2的最大值   x∈【-1,2】
clear
clc
close all

figure(1)
x=[-1:0.01:2];
y=x.*sin(10*pi*x)+2;
plot(x,y);
grid on
legend('f(x)=xsin(10pix)+2');
xlabel('x');
ylabel('y');
hold on

NIND=40;
PRECI=20;
MAXGEN=25;
GGAP=0.9;
px=0.7;
pm=0.01;
trace=zeros(3,MAXGEN);

Chrom=crtbp(NIND,PRECI);
FieldD=[PRECI;-1;2;1;0;1;1];

Phen=bs2rv(Chrom,FieldD);
ObjV=Phen.*sin(10*pi*Phen)+2;

gen=0;

while gen<MAXGEN
    FitnV=ranking(ObjV);
    Selch=select('sus',Chrom,FitnV,GGAP);
    Selch=recombin('xovsp',Selch,px);
    Selch=mut(Selch,pm);
    
    Phen=bs2rv(Selch,FieldD);
    ObjVSel=Phen.*sin(10*pi*Phen)+2;
    
    [Chrom,ObjV]=reins(Chrom,Selch,1,1,ObjV,ObjVSel);
    Phen=bs2rv(Chrom,FieldD);
    gen=gen+1;
    
    [Y,I]=max(ObjV);
    trace(1,gen)=Phen(I,:);
    trace(2,gen)=Y;
    trace(3,gen)=sum(ObjV)/length(ObjV);
end

plot(trace(1,:),trace(2,:),'ro')
grid on;
figure(2)
plotyy(1:MAXGEN,trace(2,:),1:MAXGEN,trace(3,:));
grid on;
xlabel('遗传代数：');
ylabel('解的变化，种群均值：');
title('进化过程：');
legend('解的变化','种群均值')

[bestY,num]=max(trace(2,:));
bestX=trace(1,num);
disp('最优解：X=');
disp(num2str(bestX));
disp('Y=');
disp(num2str(bestY));
