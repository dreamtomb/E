x0=[0 3 5 7 9 11 12 13 14 15];
y0=[0 1.2 1.7 2.0 2.1 2.0 1.8 1.2 1.2 1.6];
%% 画出图像
x=0:0.1:15;
%一次线性插值
y1=interp1(x0,y0,x);
%三次样条插值
y2=interp1(x0,y0,x,'spline');
%三次样条插值
pp1=csape(x0,y0);
y3=fnval(pp1,x);
%三次样条插值
pp2=csape(x0,y0,'second');
y4=fnval(pp2,x);
%三次样条插值
plot(x,y1,'k');
hold on
plot(x,y2,'r:');
plot(x,y3,'c--');
plot(x,y4,'g-.');
hold off
%% 求【13,15】内的ymin
index=find(y3==min(y3(131:151)));
xmin=x(index);
ymin=y3(index);