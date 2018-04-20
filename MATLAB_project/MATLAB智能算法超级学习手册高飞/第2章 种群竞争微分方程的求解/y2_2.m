%绘的曲线向量解曲线
syms r1 r2 s1 s2 n1
r1=1;r2=1;s1=0.5;s2=2;n1=100;n2=100;
Xmin=0;
Xmax=140;
Ymin=0;
Ymax=100;
n=50;
% 计算切线矢量
[X,Y]=meshgrid(linspace(Xmin,Xmax,n),linspace(Ymin,Ymax,n));
Fx=r1.*X.*(1-X./n1-s1.*Y./n2);
Fy=r2.*Y.*(1- s2.*X./n1-Y./n2);
Fx=Fx./(sqrt(Fx.^2+Fy.^2+1));
Fy=Fy./(sqrt(Fx.^2+Fy.^2+1));
%求解微分方程
options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-5]);
[T1,Y1]=ode45(@zhongqun,[0 50],[10 10],options);
% 绘制斜率场
hold on
grid on
box on
axis([Xmin,Xmax,Ymin,Ymax])
quiver(X,Y,Fx,Fy,0.5);
% 绘制解曲线
plot(Y1(:,1),Y1(:,2),'g','LineWidth',2)
