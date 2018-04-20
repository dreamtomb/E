function [res,attribute]=deal()
%% 导入数据
[num,txt,raw]=xlsread('统计数据.xlsx');%num是数据矩阵
%% 清理缺失数据
[m,n]=find(isnan(num));
num(m,:)=[];
%% 分出结果列和属性列
res=num(:,3);%结果列;
res=repmat(res,3,1);
attribute=num(:,10:29);%属性列
attribute=repmat(attribute,3,1);