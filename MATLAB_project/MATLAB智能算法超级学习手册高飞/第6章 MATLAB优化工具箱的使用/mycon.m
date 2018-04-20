function [C,Ceq,K1,K2,S] = mycon(X,S)
% 初始化样本间距：
if  isnan(S(1,1)),
   S = [0.2  0; 0.2  0];
end
% 产生样本集：
w1 = 1:S(1,1):100;
w2 = 1:S(2,1):100;
% 计算半无限约束：
K1 = sin(w1*X(1)).*cos(w1*X(2)) - 1/1000*(w1-50).^2 -sin(w1*X(3))-X(3)-1;
K2 = sin(w2*X(2)).*cos(w2*X(1)) - 1/1000*(w2-50).^2 -sin(w2*X(3))-X(3)-1;
% 无非线性约束：
C = [ ]; Ceq=[ ];
% 绘制半无限约束图形
plot(w1,K1,'-',w2,K2,':');
title('Semi-infinite constraints')
grid on
