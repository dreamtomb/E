function [alpha1,alpha2,alpha3]=changealpha(A1,A2,A3)
%% 变异系数法求三个一级指标的权重
% 求九个国家的A1，A2，A3的平均数
meana1=mean(A1);
meana2=mean(A2);
meana3=mean(A3);
% meana4=mean(A4);
% 求九个国家的A1，A2，A3的标准差
stda1=std(A1);
stda2=std(A2);
stda3=std(A3);
% stda4=std(A4);
% 标准差除以平均数得到1*3的行向量即为变异系数
% alpha=[stda1/meana1 stda2/meana2 stda3/meana3 stda4/meana4];
alpha=[stda1/meana1 stda2/meana2 stda3/meana3];
% 求三个变异系数的和
s=sum(alpha);
% 求每一个变异系数除以和的值即为权重
alpha1=alpha(1)/s;
alpha2=alpha(2)/s;
alpha3=alpha(3)/s;
% alpha4=alpha(4)/s;


