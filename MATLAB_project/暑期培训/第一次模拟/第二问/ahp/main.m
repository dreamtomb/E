%% 利用ahp_main得到的数据
res=[0.1681 0.1345 0.0672 0.1008 0.0672 0.0336 0.0179 0.0357...
    0.0893 0.0893 0.0536 0.0204 0.0612 0.0612];
%% 2015
num15=xlsread('2015');
% num15=mapminmax(num15,0.1,1);
s15=res*num15;
[score15,index15]=sort(s15,'descend');
%% 2014
num14=xlsread('2014');
% num14=mapminmax(num14,0.1,1);
s14=res*num14;
[score14,index14]=sort(s14,'descend');
%% 2013
num13=xlsread('2013');
% num13=mapminmax(num13,0.1,1);
s13=res*num13;s13(1)=s13(1)/2.5;
[score13,index13]=sort(s13,'descend');

%% 2010
num10=xlsread('2010');
% num10=mapminmax(num10,0.1,1);
s10=res*num10;
[score10,index10]=sort(s10,'descend');

%% 2009
num09=xlsread('2009');
% num09=mapminmax(num09,0.1,1);
s09=res*num09;
[score09,index09]=sort(s09,'descend');
[index15;index14;index13;index10;index09]

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


