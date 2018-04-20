ahp_main();
clear max;
%模糊综合评价B=A*R
load('matrix.mat');
A=wA';
%分配R
%打出的电话
p1=pres(:,1);
%电话比率
p2=pres(:,2);
p=p1./(p1+p2);
p2=p;
%打电话时长
p3=zeros(36,1);
for i=1:36
    p3(i)=sum(L(i,:));
end
%此时p1，p2，p3为三个指标
format long;
p1max=max(p1);
p1min=min(p1);
step1=(p1max-p1min)/5;
pp1=p1min:step1:p1max;

p2max=max(p2);
p2min=min(p2);
step2=(p2max-p2min)/5;
pp2=p2min:step2:p2max;

p3max=max(p3);
p3min=min(p3);
step3=(p3max-p3min)/5;
pp3=p3min:step3:p3max;

pj=zeros(36,3);
for i=1:36
    if p1(i)>=pp1(1)&&p1(i)<=pp1(2)
        pj(i,1)=1;
    end
    if p1(i)>pp1(2)&&p1(i)<=pp1(3)
        pj(i,1)=2;
    end
    if p1(i)>pp1(3)&&p1(i)<=pp1(4)
        pj(i,1)=3;
    end
    if p1(i)>pp1(4)&&p1(i)<=pp1(5)
        pj(i,1)=4;
    end
    if p1(i)>pp1(5)&&p1(i)<=pp1(6)
        pj(i,1)=5;
    end
    
    if p2(i)>=pp2(1)&&p2(i)<=pp2(2)
        pj(i,2)=1;
    end
    if p2(i)>pp2(2)&&p2(i)<=pp2(3)
        pj(i,2)=2;
    end
    if p2(i)>pp2(3)&&p2(i)<=pp2(4)
        pj(i,2)=3;
    end
    if p2(i)>pp2(4)&&p2(i)<=pp2(5)
        pj(i,2)=4;
    end
    if p2(i)>pp2(5)&&p2(i)<=pp2(6)
        pj(i,2)=5;
    end
    
    if p3(i)>=pp3(1)&&p3(i)<=pp3(2)
        pj(i,3)=1;
    end
    if p3(i)>pp3(2)&&p3(i)<=pp3(3)
        pj(i,3)=2;
    end
    if p3(i)>pp3(3)&&p3(i)<=pp3(4)
        pj(i,3)=3;
    end
    if p3(i)>pp3(4)&&p3(i)<=pp3(5)
        pj(i,3)=4;
    end
    if p3(i)>pp3(5)&&p3(i)<=pp3(6)
        pj(i,3)=5;
    end
end
pj=pj';
%至此得到36个人的三个指标的评价,作为对比，查看置信度
%5优秀 4良好 3中等 2较差 1差
R1 = [0.1,0.6,0.1,0.1,0.1;
         0.2,0.1,0.1,0.1,0.5;
         0.2,0.4,0.1,0.2,0.1];
R2 = [1,0,0,0,0;
    0,0.5,0.2,0.3,0;
    1,0,0,0,0];
R3 = [0.1,0.1,0,0.7,0.1;
    0.2,0.1,0.1,0.6,0;
    0,0.1,0.2,0.5,0.2];
R4 = [0.1,0.1,0.1,0.1,0.6;
    0.2,0.6,0.1,0.1,0;
    0.1,0,0,0.2,0.7];
R5 = [0.1,0,0,0.2,0.7;
    0.1,0,0.8,0,0.1;
    0.2,0,0,0.2,0.6];
R6 = [0.1,0,0,0.2,0.7;
    0.1,0.7,0.1,0,0.1;
    0.2,0,0,0.2,0.6];
R7 = [0.1,0,0,0.2,0.7;
    0.1,0.7,0.1,0,0.1;
    0.2,0,0.1,0.2,0.5];
R8 = [0.1,0,0,0.2,0.7;
    0.7,0,0.1,0.2,0;
    0.2,0,0,0.2,0.6];
R9 = [0.1,0,0,0.2,0.7;
    0,0,0.8,0.2,0;
    0.1,0.1,0,0.2,0.6];
R10 = [0.1,0,0,0.2,0.7;
     0,0,0.1,0.9,0;
     0.1,0.1,0,0.2,0.6];
R11 = [0.1,0,0,0.2,0.7;
     0,0.6,0.2,0.2,0;
     0.1,0.1,0,0.2,0.6];
R12 = [0.1,0,0,0.2,0.7;
     0,5,0.3,0.2,0;
     0.1,0,0,0.2,0.7];
R13 = [0.2,0,0,0.2,0.6;
     0.1,0.1,0.2,0,6;
     0.1,0.1,0,0.2,0.6];
R14 = [0.1,0.1,0.1,0.1,0.6;
     0,0.8,0.1,0.1,0;
     0.1,0,1,0.2,0.6];
R15 = [0.1,0.1,0.1,0.1,0.6;
     0,0.8,0,0.1,0.1;
     0.1,0,1,0.2,0.5];
R16 = [0.1,0.1,0.1,0.1,0.6;
     0,0.1,0.7,0.1,0.1;
     0.1,0,1,0.2,0.5];
R17 = [0.1,0.1,0.1,0.1,0.6;
     0,0.1,0.1,0.1,0.7;
     0.1,0,1,0.2,0.5];
R18 = [0.1,0.1,0.1,0.1,0.6;
     0,0.1,0.7,0.1,0.1;
     0.1,0,1,0.2,0.5];
R19=[0 0 0.1 0.3 0.6;
         0.1 0.5 0.3 0.1 0;
         0 0 0.2 0.2 0.6];
R20=[0.2 0.5 0.3 0 0;
         1 0 0 0 0;
         0.1 0.6 0.3 0 0];
R21=[0 0 0 0.4 0.6;
         0 0 0.2 0.6 0.2;
         0 0 0 0.3 0.7];
R22=[0 0 0.1 0.3 0.6;
         0.5 0.5 0 0 0;
         0 0.1 0.1 0.3 0.5];
R23=[0 0 0 0.3 0.7;
         0 0 0.3 0.5 0.2;
         0 0 0 0.4 0.6];
R24=[0 0 0 0.4 0.6;
         0 0 0.2 0.5 0.3;
         0 0 0 0.4 0.6];
R25=[0 0 0 0.4 0.6;
         0.4 0.6 0 0 0;
         0 0 0.1 0.4 0.5];
R26=[0 0 0 0.4 0.6;
         0 0.2 0.5 0.3 0;
         0 0 0.1 0.4 0.5];
R27=[0 0 0 0.3 0.7;
         0 0.9 0.1 0 0;
         0 0 0 0.3 0.7];
R28=[0 0 0 0.3 0.7;
         0 0 0.1 0.9 0;
         0 0 0 0.3 0.7];
R29=[0 0 0 0.3 0.7;
         0.8 0.2 0 0 0;
         0 0 0 0.3 0.7];
R30=[0 0 0 0.3 0.7;
         0 0 0.3 0.6 0.1;
         0 0 0 0.3 0.7];
R31=[0 0 0 0.2 0.8;
         0 0.1 0.8 0.1 0;
         0 0 0 0.3 0.7];
R32=[0 0 0 0.2 0.8;
         0 0 0.9 0.1 0;
         0 0 0 0.1 0.9];
R33=[0 0.1 0.1 0.4 0.4;
         0.9 0 0 0 0;
         0 0 0 0.6 0.4];
R34=[0.2 0.6 0.2 0 0;
         0 0 0 0.8 0.2;
         0.1 0.7 0.2 0 0];
R35=[0 0 0 0.4 0.6;
         0 0 0 0.8 0.2;
         0 0 0 0.3 0.7];
R36=[0 0 0 0.4 0.6;
         0 0 0 0.8 0.2;
         0 0 0 0.1 0.9];
%开始计算B=A*R
B={};
B{1,1}=A*R1;
B{2,1}=A*R2;
B{3,1}=A*R3;
B{4,1}=A*R4;
B{5,1}=A*R5;
B{6,1}=A*R6;
B{7,1}=A*R7;
B{8,1}=A*R8;
B{9,1}=A*R9;
B{10,1}=A*R10;
B{11,1}=A*R11;
B{12,1}=A*R12;
B{13,1}=A*R13;
B{14,1}=A*R14;
B{15,1}=A*R15;
B{16,1}=A*R16;
B{17,1}=A*R17;
B{18,1}=A*R18;
B{19,1}=A*R19;
B{20,1}=A*R20;
B{21,1}=A*R21;
B{22,1}=A*R22;
B{23,1}=A*R23;
B{24,1}=A*R24;
B{25,1}=A*R25;
B{26,1}=A*R26;
B{27,1}=A*R27;
B{28,1}=A*R28;
B{29,1}=A*R29;
B{30,1}=A*R30;
B{31,1}=A*R31;
B{32,1}=A*R32;
B{33,1}=A*R33;
B{34,1}=A*R34;
B{35,1}=A*R35;
B{36,1}=A*R36;

result=zeros(36,3);
for i=1:36
    [result(i,1),result(i,2)]=max(B{i,1});
    if result(i,2)==1
        result(i,3)=0.9;
    end
    if result(i,2)==2
        result(i,3)=0.8;
    end
    if result(i,2)==3
        result(i,3)=0.7;
    end
    if result(i,2)==4
        result(i,3)=0.6;
    end
    if result(i,2)==5
        result(i,3)=0.5;
    end
end
%% 加入三个指标验证第四问的模型
load('matrix.mat');
figure(1);
graph(L);
num=SpectralClustering(L,0,5);
class1=find(num==1);
class2=find(num==2);
class3=find(num==3);
class4=find(num==4);
class5=find(num==5);
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
len=length(class5);
sum5=zeros(len,1);
for i=1:len
    for j=1:len
        sum5(i,1)=sum5(i,1)+L(class5(i),class5(j));
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
    for j=1:length(class5)
        di1(i,1)=di1(i,1)+L(class1(i),class5(j));
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
    for j=1:length(class5)
        di2(i,1)=di2(i,1)+L(class2(i),class5(j));
    end
end
len=length(class3);
di3=zeros(len,1);
for i=1:len
    for j=1:length(class5)
        di3(i,1)=di3(i,1)+L(class3(i),class5(j));
    end
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
    for j=1:length(class5)
        di4(i,1)=di4(i,1)+L(class4(i),class5(j));
    end
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
len=length(class5);
di5=zeros(len,1);
for i=1:len
    for j=1:length(class4)
        di5(i,1)=di5(i,1)+L(class5(i),class4(j));
    end
     for j=1:length(class3)
        di5(i,1)=di5(i,1)+L(class5(i),class3(j));
    end
    for j=1:length(class2)
        di5(i,1)=di5(i,1)+L(class5(i),class2(j));
    end
    for j=1:length(class1)
        di5(i,1)=di5(i,1)+L(class5(i),class1(j));
    end
end
figure(2);
plot(sum1,di1,'ro');
hold on;
plot(sum2,di2,'b*');
plot(sum3,di3,'k^');
plot(sum4,di4,'g+');
plot(sum5,di5,'mx');
grid on;
hold off;
%对聚合程度进行排序找出五个类中的核心
p1=[class1 sum1 di1];
p2=[class2 sum2 di2];
p3=[class3 sum3 di3];
p4=[class4 sum4 di4];
p5=[class5 sum5 di5];
p1=sortrows(p1,-2);
p2=sortrows(p2,-2);
p3=sortrows(p3,-2);
p4=sortrows(p4,-2);
p5=sortrows(p5,-2);
%五个类的核心点
vi=[p1(1,1) p2(1,1) p3(1,1) p4(1,1) p5(1,1)];
%寻找和核心点连通的点，产生一个0.1-0.5的...
...随机数x%,将连通点中权重排名最靠后的x%...
...个终止传播。其余继续。先定义已访问过数组

%% 在这里对后面的模拟传播过程模拟100次，计算每次的覆盖率
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
    rand1=1-result(vi(1),3);
    rest1=len1-round(len1*rand1);
    point1=sortrows(point1,-2);
    point1=point1(1:rest1,:);

    point2=find(L(vi(2),:)~=0);
    point2=point2';
    temp=L(vi(2),point2);
    temp=temp';
    point2=[point2 temp];
    len2=length(point2);
    rand2=1-result(vi(2),3);
    rest2=len2-round(len2*rand2);
    point2=sortrows(point2,-2);
    point2=point2(1:rest2,:);

    point3=find(L(vi(3),:)~=0);
    point3=point3';
    temp=L(vi(3),point3);
    temp=temp';
    point3=[point3 temp];
    len3=length(point3);
    rand3=1-result(vi(3),3);
    rest3=len3-round(len3*rand3);
    point3=sortrows(point3,-2);
    point3=point3(1:rest3,:);

    point4=find(L(vi(4),:)~=0);
    point4=point4';
    temp=L(vi(4),point4);
    temp=temp';
    point4=[point4 temp];
    len4=length(point4);
    rand4=1-result(vi(4),3);
    rest4=len4-round(len4*rand4);
    point4=sortrows(point4,-2);
    point4=point4(1:rest4,:);

    point5=find(L(vi(5),:)~=0);
    point5=point5';
    temp=L(vi(5),point5);
    temp=temp';
    point5=[point5 temp];
    len5=length(point5);
    rand5=1-result(vi(5),3);
    rest5=len5-round(len5*rand5);
    point5=sortrows(point5,-2);
    point5=point5(1:rest5,:);
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
    for i=1:length(point5)
        visited(point5(:,1))=1;
    end
    %一直传播，按照四舍五入的方案来，一直到...
    ...没有可以传播的点为止。
    point=[point1(:,1);point2(:,1);point3(:,1);...
    point4(:,1);point5(:,1);vi(1);vi(2);vi(3);vi(4);vi(5)];
    point=unique(point);
    for i=1:length(point)
       ppoint=find(L(point(i),:)~=0);
       ppoint=ppoint';
       temp=L(point(i),ppoint);
       temp=temp';
       ppoint=[ppoint temp];
       plen=length(ppoint);
       prand=1-result(point(i),3);
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

