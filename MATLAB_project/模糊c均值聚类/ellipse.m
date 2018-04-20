function ellipse(a,b,center,style,c_3d)
% 绘制一个椭圆
% 调用: ellipse(a,b,center,style,c_3d)
% 输入:
%     a: 椭圆的轴长(平行于 x 轴)
%     b: 椭圆的轴长(平行于 y 轴)
%     center: 椭圆的中心 [x0,y0],缺省值为 [0,0]
%     style: 绘制的线型和颜色,缺省值为实线蓝色
%     c_3d:   椭圆的中心在 3D 空间中的 z 轴坐标,可缺省
if nargin<4
    style='b';
end
if nargin<3 | isempty(center)
    center=[0,0];
end
t=1:360;
x=a/2*cosd(t)+center(1);
y=b/2*sind(t)+center(2);
if nargin>4
    plot3(x,y,ones(1,360)*c_3d,style)
else
    plot(x,y,style)
end
