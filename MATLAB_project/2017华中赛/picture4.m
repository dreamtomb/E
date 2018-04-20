load('matrix.mat');
% figure(1);
% graph(L);
num=SpectralClustering(L,0,4);
class1=find(num==1);
class2=find(num==2);
class3=find(num==3);
class4=find(num==4);
%% 求出同一子图的聚合程度和不同子图之间的离散程度
%聚合程度
len=length(class1);
sum1=zeros(len,1);
for i=1:len
    for j=1:len
        sum1(i,1)=sum1(i,1)+L(class1(i),class1(j));
    end
end
len=length(class2);
sum2=zeros(len,1);
for i=1:len
    for j=1:len
        sum2(i,1)=sum2(i,1)+L(class2(i),class2(j));
    end
end
len=length(class3);
sum3=zeros(len,1);
for i=1:len
    for j=1:len
        sum3(i,1)=sum3(i,1)+L(class3(i),class3(j));
    end
end
len=length(class4);
sum4=zeros(len,1);
for i=1:len
    for j=1:len
        sum4(i,1)=sum4(i,1)+L(class4(i),class4(j));
    end
end
%离散程度
len=length(class1);
di1=zeros(len,1);
for i=1:len
    for j=1:length(class2)
        di1(i,1)=di1(i,1)+L(class1(i),class2(j));
    end
    for j=1:length(class3)
        di1(i,1)=di1(i,1)+L(class1(i),class3(j));
    end
    for j=1:length(class4)
        di1(i,1)=di1(i,1)+L(class1(i),class4(j));
    end
end
len=length(class2);
di2=zeros(len,1);
for i=1:len
    for j=1:length(class1)
        di2(i,1)=di2(i,1)+L(class2(i),class1(j));
    end
    for j=1:length(class3)
        di2(i,1)=di2(i,1)+L(class2(i),class3(j));
    end
    for j=1:length(class4)
        di2(i,1)=di2(i,1)+L(class2(i),class4(j));
    end
end
len=length(class3);
di3=zeros(len,1);
for i=1:len
    for j=1:length(class4)
        di3(i,1)=di3(i,1)+L(class3(i),class4(j));
    end
    for j=1:length(class2)
        di3(i,1)=di3(i,1)+L(class3(i),class2(j));
    end
    for j=1:length(class1)
        di3(i,1)=di3(i,1)+L(class3(i),class1(j));
    end
end
len=length(class4);
di4=zeros(len,1);
for i=1:len
     for j=1:length(class3)
        di4(i,1)=di4(i,1)+L(class4(i),class3(j));
    end
    for j=1:length(class2)
        di4(i,1)=di4(i,1)+L(class4(i),class2(j));
    end
    for j=1:length(class1)
        di4(i,1)=di4(i,1)+L(class4(i),class1(j));
    end
end
% figure(2);
% plot(sum1,di1,'ro');
% hold on;
% plot(sum2,di2,'b*');
% plot(sum3,di3,'k^');
% plot(sum4,di4,'g+');
% grid on;
% hold off;
%对聚合程度进行排序找出五个类中的核心
p1=[class1 sum1 di1];
p2=[class2 sum2 di2];
p3=[class3 sum3 di3];
p4=[class4 sum4 di4];
p1=sortrows(p1,-2);
p2=sortrows(p2,-2);
p3=sortrows(p3,-2);
p4=sortrows(p4,-2);
%五个类的核心点
vi=[p1(1,1) p2(1,1) p3(1,1) p4(1,1)];
%寻找和核心点连通的点，产生一个0.1-0.5的...
...随机数x%,将连通点中权重排名最靠后的x%...
...个终止传播。其余继续。先定义已访问过数组
fg=zeros(1,100);
for ii=1:100
    visited=zeros(1,36);
    for i=1:length(vi)
        visited(vi(i))=1;
    end
    point1=find(L(vi(1),:)~=0);
    point1=point1';
    temp=L(vi(1),point1);
    temp=temp';
    point1=[point1 temp];
    len1=length(point1);
    rand1=0.1+(0.5-0.1)*rand(1);
    rest1=len1-round(len1*rand1);
    point1=sortrows(point1,-2);
    point1=point1(1:rest1,:);

    point2=find(L(vi(2),:)~=0);
    point2=point2';
    temp=L(vi(2),point2);
    temp=temp';
    point2=[point2 temp];
    len2=length(point2);
    rand2=0.1+(0.5-0.1)*rand(1);
    rest2=len2-round(len2*rand2);
    point2=sortrows(point2,-2);
    point2=point2(1:rest2,:);

    point3=find(L(vi(3),:)~=0);
    point3=point3';
    temp=L(vi(3),point3);
    temp=temp';
    point3=[point3 temp];
    len3=length(point3);
    rand3=0.1+(0.5-0.1)*rand(1);
    rest3=len3-round(len3*rand3);
    point3=sortrows(point3,-2);
    point3=point3(1:rest3,:);

    point4=find(L(vi(4),:)~=0);
    point4=point4';
    temp=L(vi(4),point4);
    temp=temp';
    point4=[point4 temp];
    len4=length(point4);
    rand4=0.1+(0.5-0.1)*rand(1);
    rest4=len4-round(len4*rand4);
    point4=sortrows(point4,-2);
    point4=point4(1:rest4,:);

    for i=1:length(point1)
        visited(point1(:,1))=1;
    end
    for i=1:length(point2)
        visited(point2(:,1))=1;
    end
    for i=1:length(point3)
        visited(point3(:,1))=1;
    end
    for i=1:length(point4)
        visited(point4(:,1))=1;
    end
    %一直传播，按照四舍五入的方案来，一直到...
    ...没有可以传播的点为止。
    point=[point1(:,1);point2(:,1);point3(:,1);...
    point4(:,1);vi(1);vi(2);vi(3);vi(4)];
    point=unique(point);
    for i=1:length(point)
       ppoint=find(L(point(i),:)~=0);
       ppoint=ppoint';
       temp=L(point(i),ppoint);
       temp=temp';
       ppoint=[ppoint temp];
       plen=length(ppoint);
       prand=0.1+(0.5-0.1)*rand(1);
       prest=plen-round(plen*prand);
       ppoint=sortrows(ppoint,-2);
       ppoint=ppoint(1:prest,:);
       for j=1:length(ppoint)
           visited(ppoint(:,1))=1;
       end
    end
    uv=find(visited==0);
    uvlen=length(uv);
    fgl=uvlen/36;
    fg(i)=fgl;
end
finalres=find(fg~=0);
finalres=length(finalres)/100;
finalres