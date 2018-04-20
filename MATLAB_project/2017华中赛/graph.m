function graph(rel,control)  
%由邻接矩阵画图  
%输入为邻接矩阵，必须为方阵；  
%第二个输入为控制量，0表示无向图，1表示有向图。默认值为0  
r_size=size(rel);%获取矩阵大小  
if nargin<2 %如果参数小于2，默认无向图  
    control=0;  
end  
if r_size(1)~=r_size(2)  
    disp('Wrong Input! The input must be a square matrix!');%输入为邻接矩阵，必须为方阵  
    return;  
end  
len=r_size(2);  
!echo len;  
disp(len);  
  
rho=10;%限制图尺寸的大小  
r=1/1.05^len;%点的半径  
theta=0:(2*pi/len):2*pi*(1-1/len);%以0开始，步长2*pi/len，结束2*pi*(1-1/len)，相当于有len个点  
[pointx,pointy]=pol2cart(theta',rho);  
theta=0:pi/36:2*pi;%73个点  
!echo theta:  
disp(theta);  
[tempx,tempy]=pol2cart(theta',r);%73个坐标  
point=[pointx,pointy];%6个坐标点  
!echo point;  
disp(point);  
hold on  
for i=1:len  
    temp=[tempx,tempy]+[point(i,1)*ones(length(tempx),1),point(i,2)*ones(length(tempx),1)];%73行1列的1矩阵与point每个坐标相乘  
    plot(temp(:,1),temp(:,2),'r');%plot(x,y),画出圆圈  
     %plot(point(:,1),point(:,2),'r');%plot(x,y)  
    text(point(i,1)-0.3,point(i,2),num2str(i));  
    %画点  
end  
for i=1:len  
    for j=1:len  
        if rel(i,j)%如果邻接矩阵rel中该点是1，代表相连  
            link_plot(point(i,:),point(j,:),r,control);  
            %连接有关系的点  
        end  
    end  
end  
set(gca,'XLim',[-rho-r,rho+r],'YLim',[-rho-r,rho+r]);  
axis off  

