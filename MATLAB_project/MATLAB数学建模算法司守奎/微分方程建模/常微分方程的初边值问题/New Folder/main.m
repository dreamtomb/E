%% 求解常微分方程的初边值问题
%y'''-y''=x,y(1)=8,y'(1)=7,y''(2)=4;
syms y(x)
dy=diff(y);
d2y=diff(y,2);
y=dsolve(diff(y,3)-diff(y,2)==x,y(1)==8,dy(1)==7,d2y(2)==4);
simplify(y)