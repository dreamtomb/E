close;
clear;
clc;
%% 2015年
[num15,txt,raw]=xlsread('2015');%num15是14*9的矩阵
num=deal(num15);
[p151,per151,p152,per152,p153,per153]=pca_test(num);
[A151,A152,A153]=calA(num15,p151,per151,p152,per152,p153,per153);
[alpha1,alpha2,alpha3]=changealpha(A151,A152,A153);
s15=(alpha1*A151+alpha2*A152+alpha3*A153)/10000;
%% 2014年
[num14,txt,raw]=xlsread('2014');%num15是14*9的矩阵
num=deal(num14);
[p141,per141,p142,per142,p143,per143]=pca_test(num);
[A141,A142,A143]=calA(num14,p141,per141,p142,per142,p143,per143);
[alpha1,alpha2,alpha3]=changealpha(A141,A142,A143);
s14=(alpha1*4*A141+alpha2*4*A142+alpha3*4*A143)/10000;
%% 2013年
[num13,txt,raw]=xlsread('2013');
num=deal(num13);
[p131,per131,p132,per132,p133,per133]=pca_test(num);
[A131,A132,A133]=calA(num13,p131,per131,p132,per132,p133,per133);
[alpha1,alpha2,alpha3]=changealpha(A131,A132,A133);
s13=(alpha1*A131+alpha2*A132+alpha3*A133)/10000;
%% 2010年
[num10,txt,raw]=xlsread('2010');
num=deal(num10);
[p101,per101,p102,per102,p103,per103]=pca_test(num);
[A101,A102,A103]=calA(num10,p101,per101,p102,per102,p103,per103);
[alpha1,alpha2,alpha3]=changealpha(A101,A102,A103);
s10=(alpha1*A101+alpha2*A102+alpha3*A103)/10000;
%% 2009年
[num09,txt,raw]=xlsread('2009');%num15是14*9的矩阵
num=deal(num09);
[p091,per091,p092,per092,p093,per093]=pca_test(num);
[A091,A092,A093]=calA(num09,p091,per091,p092,per092,p093,per093);
[alpha1,alpha2,alpha3]=changealpha(A091,A092,A093);
s09=(alpha1*A091+alpha2*A092+alpha3*A093)/10000;
%% 每年排名
[score15,index15]=sort(s15,'descend');index15=index15';
[score14,index14]=sort(s14,'descend');index14=index14';
[score13,index13]=sort(s13,'descend');index13=index13';
[score10,index10]=sort(s10,'descend');index10=index10';
[score09,index09]=sort(s09,'descend');index09=index09';
[index09;index10;index13;index14;index15]
%% 画出5年来9个城市的最终得分曲线
x=[2009 2010 2013 2014 2015];
plot(x,[s09(1)  s10(1)  s13(1)  s14(1) s15(1) ],'r');
hold on;
plot(x,[s09(2)  s10(2)  s13(2)  s14(2)  s15(2) ],'g');
plot(x,[s09(3)  s10(3)  s13(3)  s14(3)  s15(3) ],'b');
plot(x,[s09(4)  s10(4)  s13(4)  s14(4)  s15(4) ],'y');
plot(x,[s09(5)  s10(5)  s13(5)  s14(5)  s15(5) ],'m');
plot(x,[s09(6)  s10(6)  s13(6)  s14(6)  s15(6) ],'c');
plot(x,[s09(7)  s10(7)  s13(7)  s14(7)  s15(7) ],'k');
plot(x,[s09(8)  s10(8)  s13(8)  s14(8)  s15(8) ],'r');
plot(x,[s09(9)  s10(9)  s13(9)  s14(9)  s15(9) ],'g');
xlabel('年份');
ylabel('评分');
title('九座城市在2009-2015年间的经济发展评分变化折线图');
legend('武汉','黄冈','黄石','鄂州','孝感','咸宁','仙桃','天门','潜江');
plot(2015,s15(1),'ko');
text(2015,s15(1),'武汉');
plot(2015,s15(2),'ko');
text(2015,s15(2),'黄冈');
plot(2015,s15(3),'ko');
text(2015,s15(3),'黄石');
plot(2015,s15(4),'ko');
text(2015,s15(4),'鄂州');
plot(2015,s15(5),'ko');
text(2015,s15(5),'孝感');
plot(2015,s15(6),'ko');
text(2015,s15(6),'咸宁');
plot(2015,s15(7),'ko');
text(2015,s15(7),'仙桃');
plot(2015,s15(8),'ko');
text(2015,s15(8),'天门');
plot(2015,s15(9),'ko');
text(2015,s15(9),'潜江');


