 x0=10;y0=10; 
options =odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-5]); 
[T,Y]=ode45('zhongqun',[0 50],[x0 y0],options); 
grid on
axis equal
plot(T,Y(:,1),'b-',T,Y(:,2),'r-') 
title('r1=1.2;r2=1.1;s1=0.5;s2=2;n1=200;n2=120;x0=10;y0=10;') 
h = legend('x(t)','y(t)',2);
