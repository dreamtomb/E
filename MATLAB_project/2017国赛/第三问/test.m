close;clear;clc;
%% 以每个任务为中心画圈
num=xlsread('missioncoordinate.xlsx');
for i=1:size(num,1)
    rectangle('Position',[num(i,1)-3,num(i,2)-3,6,6],'Curvature',[1,1],'FaceColor','m');
    hold on;
end
plot(num(:,1),num(:,2),'g.','linewidth',5);
hold off;
xlabel('纬度转化坐标');
ylabel('经度转化坐标');
title('各任务三公里覆盖效果图');
%% 每一个圈内的任务之间连线
figure;
num=xlsread('missioncoordinate.xlsx');
plot(num(:,1),num(:,2),'g*','linewidth',1);
hold on;
distance=zeros(size(num,1),size(num,1));
n=0;
for i=1:size(num,1)
    for j=1:size(num,1)
        i
        if sqrt((num(i,1)-num(j,1))^2+(num(i,2)-num(j,2))^2)<=3
            %             plot([num(i,1) num(j,1)],[num(i,2) num(j,2)]);
            distance(i,j)=1;
            n=n+1;
        end
    end
end
xlabel('纬度转化坐标');
ylabel('经度转化坐标');
title('三公里内任务点连线图');












