%% 数据准备
close
clear
clc
load pp.mat%pp是一整天10*10的骑行人数矩阵
load infor.mat
load statu.mat
data=deal();
clc
data=sortrows(data,2);%data是11649*5的信息矩阵
index1=find(data(:,2)==519.03);%第二时段的起始点
index2=find(data(:,2)==647.02);%第三时段的起始点
%% 求进入高峰前的时刻的车辆分布
begin=[100 109 90 99 106 102 90 120 91 93];
status=begin+sum(pp1)-sum(pp1');
status=status+statu;
status=status./2;
%% 遗传算法求初始解
resx=zeros(1,10);
resx=GA_myd();
%% 求出需要调运的车辆数
disp(['实际货物量为：',num2str(status)]);
disp(['需求货物量为：',num2str(resx)]);
need=resx-status;
outindex=find(need<0);
outnum=need(outindex);
inindex=find(need>0);
innum=need(inindex);
%% 求出各个区域之间运行的时间作为路程
time=zeros(10,10);
for i=1:10
    for j=1:10
        pindex=find(data(:,4)==i&data(:,5)==j);
        ptime=sum(data(pindex,3)-data(pindex,2))/length(pindex);
        time(i,j)=ptime;
    end
end
% time=time+diag(-diag(time));
time=tril(time,-1)+triu(time,1);%对角线赋值为0
time=round(time);
disp(['调出的货物量为：',num2str(outnum)]);
disp(['调出的区域为：',num2str(outindex)]);
disp(['调入的货物量为：',num2str(innum)]);
disp(['调入的区域为：',num2str(inindex)]);
%% 求最优解
disp('---------------------------------------------------------------------')
disp('调配方案如下：')
i=1;j=1;
while i<=length(outnum)&&j<=length(innum)
    if outnum(i)+innum(j)<0
        disp([num2str(outindex(i)),'->',num2str(inindex(j)),'(',num2str(abs(innum(j))),')']);
        outnum(i)=outnum(i)+innum(j);
        j=j+1;
    elseif outnum(i)+innum(j)==0
        disp([num2str(outindex(i)),'->',num2str(inindex(j)),'(',num2str(abs(innum(j))),')']);
        i=i+1;
        j=j+1;
    else
        disp([num2str(outindex(i)),'->',num2str(inindex(j)),'(',num2str(abs(outnum(i))),')']);
        innum(j)=outnum(i)+innum(j);
        i=i+1;
    end
end



