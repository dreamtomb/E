clear
close 
clc
load lastpic.mat
scatter3(R(:,1),R(:,2),pri);
xlabel('纬度转化坐标')
ylabel('经度转化坐标')
zlabel('定价')
title('任务位置及定价散点图')