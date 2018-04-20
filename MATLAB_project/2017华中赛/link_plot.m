%%  
function link_plot(point1,point2,r,control)  
%连接两点  
temp=point2-point1;  
if (~temp(1))&&(~temp(2))  
    return;  
    %不画子回路；  
end  
theta=cart2pol(temp(1),temp(2));  
[point1_x,point1_y]=pol2cart(theta,r);  
point_1=[point1_x,point1_y]+point1;  
[point2_x,point2_y]=pol2cart(theta+(2*(theta<pi)-1)*pi,r);  
point_2=[point2_x,point2_y]+point2;  
if control  
    arrow(point_1,point_2);  
else  
    plot([point_1(1),point_2(1)],[point_1(2),point_2(2)]);  
end  