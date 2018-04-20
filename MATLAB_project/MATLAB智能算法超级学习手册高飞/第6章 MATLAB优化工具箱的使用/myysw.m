function [C,Ceq,K1,s] = myysw(X,s)
% 初始化样本间距：
if  isnan(s(1,1)),
   s = [2 2];
end
% 设置样本集
w1x = 1:s(1,1):100;
w1y = 1:s(1,2):100;
[wx, wy] = meshgrid(w1x,w1y);
% 计算半无限约束函数值 
K1 = sin(wx*X(1)).*cos(wx*X(2))-1/1000*(wx-50).^2 -sin(wx*X(3))-X(3)+sin(wy*X(2)).*cos(wx*X(1))-1/1000*(wy-50).^2-sin(wy*X(3))-X(3)-1.5;
% 无非线性约束
C = [ ]; Ceq=[ ];
%作约束曲面图形
m = surf(wx,wy,K1,'edgecolor','none','facecolor','interp');
camlight headlight
title('Semi-infinite constraint')
drawnow

