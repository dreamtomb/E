clear;
clc
%% 数据
a=[4.1 3.2 5.0 4.0 3.7 3.5 2.3 2.1];
%% 计算需求量0-20时的概率
p=p(a);%8*22
%% 计算库存0-30时，不同需求下的利润
e=e();
%% 利润乘以概率求和得到期望利润找到最大利润
[res,kucun,maxe]=findkc(e,p);
%% 查找什么时候需要进货什么时候不需要进货
in=bujinhuo(maxe,res,kucun);
disp(sum(maxe));



