%自定义种群函数
function dy=zhongqun(t,y)
syms r1 r2 s1 s2 n1 
%r，n赋予不同的参数时，有不同的解 
r1=1.2;r2=1.1; 
n1=200;n2=120; 
s1=0.5;s2=2; 
dy=zeros(2,1); 
dy(1)=r1*y(1)*(1-y(1)/n1-s1*y(2)/n2); 
dy(2)=r2*y(2)*(1-s2*y(1)/n1- y(2)/n2);
