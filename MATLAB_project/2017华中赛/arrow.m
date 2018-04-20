%%  
function arrow(start,stop,l)  
%start,stop分别为起点和终点  
%l为箭头的线长度，默认为主线长的1/10  
t=0.1;  
ang=15/180*pi;  
temp=stop(1)-start(1)+1i*(stop(2)-start(2));  
L=abs(temp);P=angle(temp);  
if nargin<3  
    l=t*L;  
end  
p1=P-ang;p2=P+ang;  
a=[stop(1)-l*cos(p1) stop(2)-l*sin(p1)];  
b=[stop(1)-l*cos(p2) stop(2)-l*sin(p2)];  
hold on  
plot([start(1) stop(1)],[start(2) stop(2)]);  
plot([a(1) stop(1)],[a(2) stop(2)]);  
plot([b(1) stop(1)],[b(2) stop(2)]);  