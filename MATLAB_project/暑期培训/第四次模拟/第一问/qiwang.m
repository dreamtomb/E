close
clear 
clc
data=deal();
ddata=sortrows(data,2);
clc;
%% 360-519     519-647     647-1410
index1=find(ddata(:,2)==519.03);
index2=find(ddata(:,2)==647.02);
time1=[];time2=[];time3=[];
for i=1:10
    for j=1:10
    index=find(ddata(1:index1-1,4)==i&ddata(1:index1-1,5)==j);
    time1(i,j)=sum(ddata(index,3)-ddata(index,2))/length(index);
    end
end
for i=1:10
    for j=1:10
    index=find(ddata(index1:index2-1,4)==i&ddata(index1:index2-1,5)==j);
    time2(i,j)=sum(ddata(index,3)-ddata(index,2))/length(index);
    end
end
for i=1:10
    for j=1:10
    index=find(ddata(index2:length(ddata),4)==i&ddata(index2:length(ddata),5)==j);
    time3(i,j)=sum(ddata(index,3)-ddata(index,2))/length(index);
    end
end








