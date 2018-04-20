clc,clear,close all
x=[129 140 103.5 88 185.5 195 105.5 157.5 107.5 77 81 162 162 117.5];
y=[7.5,141.5,23,147,22.5,137.5,85.5,-6.5,-81,3,56.5,-66.5,84,-33.5];
z=[4,8,6,8,6,8,8,9,9,8,8,9,4,9];
x1=75:0.5:200;
y1=-50:0.5:150;
[x2,y2]=meshgrid(x1,y1);
z2=griddata(x,y,z,x2,y2,'v4');   % 'v4'MATLAB 4 格点样条函数内插
subplot(131)
mesh(x2,y2,z2);
hold on
C=contour(x2,y2,z2);          %绘制等位线
clabel(C);
subplot(1,3,2)
C=contour(x2,y2,z2);          %绘制等位线
clabel(C);          % 等位线标识
[C,d] = contour(x2,y2,z2);
clabel(C,d,'manual');
grid on
hold on
subplot(133)
contour(x2,y2,z2,[4,4,4.5,4.5,5,5,5.5,5.5]); %绘制不同吨位的警示线
title('警示线图');
hold on 
xlabel('X'),ylabel('Y');
grid on
gtext('4吨的警戒线');
gtext('4.5吨的警戒线');
gtext('5吨的警戒线');
gtext('5.5吨的警戒线');
