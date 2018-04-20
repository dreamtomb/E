function fcmplot(Data,U,P,Obj_Fcn)
% FCM 结果绘图函数
% See also: fuzzycm maxrowf ellipse
[C,S] = size(P); res = maxrowf(U);
str = 'po*x+d^v><.h'; 
% 目标函数绘图
figure(1),plot(Obj_Fcn)
title('目标函数值变化曲线','fontsize',8)
% 2D 绘图
if S==2 
    figure(2),plot(P(:,1),P(:,2),'rs'),hold on
    for i=1:C
        v=Data(find(res==i),:); 
        plot(v(:,1),v(:,2),str(rem(i,12)+1))      
        ellipse(max(v(:,1))-min(v(:,1)), ...
                max(v(:,2))-min(v(:,2)), ...
                [max(v(:,1))+min(v(:,1)), ...
                max(v(:,2))+min(v(:,2))]/2,'r:')    
    end
    grid on,title('2D 聚类结果图','fontsize',8),hold off
end
% 3D 绘图
if S>2 
    figure(2),plot3(P(:,1),P(:,2),P(:,3),'rs'),hold on
    for i=1:C
        v=Data(find(res==i),:);
        plot3(v(:,1),v(:,2),v(:,3),str(rem(i,12)+1))      
        ellipse(max(v(:,1))-min(v(:,1)), ...
                max(v(:,2))-min(v(:,2)), ...
                [max(v(:,1))+min(v(:,1)), ...
                max(v(:,2))+min(v(:,2))]/2, ...
                'r:',(max(v(:,3))+min(v(:,3)))/2)   
    end
    grid on,title('3D 聚类结果图','fontsize',8),hold off
end
