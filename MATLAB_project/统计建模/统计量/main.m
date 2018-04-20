load data.txt
%% 画频率直方图
high=data(:,1:2:9);
high=high(:);
weight=data(:,2:2:10);
weight=weight(:);
[n1,x1]=hist(high);
[n2,x2]=hist(weight);
subplot(1,2,1);
hist(high)
subplot(1,2,2);
hist(weight)
%% 平均数，中位数，标准差，方差，极差，中心距，偏度，峰度
shuju=[high weight];
jun_zhi=mean(shuju);
zhong_wei_shu=median(shuju);
biao_zhun_cha=std(shuju);
fang_cha=var(shuju);
ji_cha=range(shuju);
zhong_xin_jv=moment(shuju,2);%第二个参数是中心矩的阶数
pian_du=skewness(shuju);
feng_du=kurtosis(shuju);
%% 分布函数(第一行的四种可以和二三行的五种互相搭配)
%norm 正态分布;chi2  χ^2 分布;t       t 分布;f       F 分布;
% pdf 概率密度； cdf 分布函数； inv 分布函数的反函数；
% stat 均值与方差； rnd 随机数生成
x=-6:0.01:6;y=normpdf(x);z=normpdf(x,0,2);
plot(x,y,x,z),gtext('N(0,1)'),gtext('N(0,2^2)');
%% 参数估计
[mu,sigma,muci,sigmaci]=normfit(x,alpha);
%% 假设检验




