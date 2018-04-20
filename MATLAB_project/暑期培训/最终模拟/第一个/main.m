close;
clear;
clc;
format short;
%% 主题
%A1金融风险A2金融机遇A3经济机遇A4经济风险A5政治机遇A6政治风险
[num,txt,raw]=xlsread('data');%num15是14*9的矩阵
%低了得分高
num(:,11)=mean(num(:,11))./num(:,11);
for i=15:16
    num(:,i)=mean(num(:,i))./num(:,i);
end
%高了得分高
for i=1:4
    num(:,i)=num(:,i)./mean(num(:,i));
end
for i=5:10
    num(:,i)=num(:,i)./mean(num(:,i));
end
for i=12:14
    num(:,i)=num(:,i)./mean(num(:,i));
end
num(:,17)=num(:,17)/mean(num(:,17));
num(:,18)=num(:,18)/mean(num(:,18));
[p1,per1,p2,per2,p3,per3,p4,per4]=pca_test(num);
[A1,A2,A3,A4]=calA(num,p1,per1,p2,per2,p3,per3,p4,per4);
A1=A1+1;
A3=A3+1;
A5=num(:,19);
A6=num(:,20);
A1=A1./max(A1);
A2=A2./max(A2);
A3=A3./max(A3);
A4=A4./max(A4);
A5=A5./max(A5);
A6=A6./max(A6);
% A1=A1./max(mean(A1));
% A2=A2./max(mean(A2));
% A3=A3./max(mean(A3));
% A4=A4./max(mean(A4));
% A5=A5./max(mean(A5));
% A6=A6./max(mean(A6));
fprintf('%s\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n','三个国家的金融机遇评分分别是：',A2(1),A2(2),A2(3),A2(4),A2(5),A2(6),A2(7),A2(8),A2(9),A2(10),A2(11),A2(12),A2(13),A2(14),A2(15),A2(16),A2(17),A2(18),A2(19),A2(20),A2(21),A2(22),A2(23),A2(24),A2(25),A2(26),A2(27),A2(28),A2(29));
fprintf('%s\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n','三个国家的金融风险评分分别是：',A1(1),A1(2),A1(3),A1(4),A1(5),A1(6),A1(7),A1(8),A1(9),A1(10),A1(11),A1(12),A1(13),A1(14),A1(15),A1(16),A1(17),A1(18),A1(19),A1(20),A1(21),A1(22),A1(23),A1(24),A1(25),A1(26),A1(27),A1(28),A1(29));
fprintf('%s\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n','三个国家的经济机遇评分分别是：',A3(1),A3(2),A3(3),A3(4),A3(5),A3(6),A3(7),A3(8),A3(9),A3(10),A3(11),A3(12),A3(13),A3(14),A3(15),A3(16),A3(17),A3(18),A3(19),A3(20),A3(21),A3(22),A3(23),A3(24),A3(25),A3(26),A3(27),A3(28),A3(29));
fprintf('%s\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n','三个国家的经济风险评分分别是：',A4(1),A4(2),A4(3),A4(4),A4(5),A4(6),A4(7),A4(8),A4(9),A4(10),A4(11),A4(12),A4(13),A4(14),A4(15),A4(16),A4(17),A4(18),A4(19),A4(20),A4(21),A4(22),A4(23),A4(24),A4(25),A4(26),A4(27),A4(28),A4(29));
fprintf('%s\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n','三个国家的政治机遇评分分别是：',A5(1),A5(2),A5(3),A5(4),A5(5),A5(6),A5(7),A5(8),A5(9),A5(10),A5(11),A5(12),A5(13),A5(14),A5(15),A5(16),A5(17),A5(18),A5(19),A5(20),A5(21),A5(22),A5(23),A5(24),A5(25),A5(26),A5(27),A5(28),A5(29));
fprintf('%s\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n','三个国家的政治风险评分分别是：',A6(1),A6(2),A6(3),A6(4),A6(5),A6(6),A6(7),A6(8),A6(9),A6(10),A6(11),A6(12),A6(13),A6(14),A6(15),A6(16),A6(17),A6(18),A6(19),A6(20),A6(21),A6(22),A6(23),A6(24),A6(25),A6(26),A6(27),A6(28),A6(29));
[alpha1,alpha4,alpha6]=changealpha(A1,A4,A5);
[alpha2,alpha3,alpha5]=changealpha(A2,A3,A6);
jyg=alpha2*A2+alpha3*A3+alpha5*A5;
fxg=alpha1*A1+alpha4*A4+alpha6*A6;
fprintf('%s\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n','三个国家的机遇评分分别是：',jyg(1),jyg(2),jyg(3),jyg(4),jyg(5),jyg(6),jyg(7),jyg(8),jyg(9),jyg(10),jyg(11),jyg(12),jyg(13),jyg(14),jyg(15),jyg(16),jyg(17),jyg(18),jyg(19),jyg(20),jyg(21),jyg(22),jyg(23),jyg(24),jyg(25),jyg(26),jyg(27),jyg(28),jyg(29));
fprintf('%s\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n','三个国家的风险评分分别是：',fxg(1),fxg(2),fxg(3),fxg(4),fxg(5),fxg(6),fxg(7),fxg(8),fxg(9),fxg(10),fxg(11),fxg(12),fxg(13),fxg(14),fxg(15),fxg(16),fxg(17),fxg(18),fxg(19),fxg(20),fxg(21),fxg(22),fxg(23),fxg(24),fxg(25),fxg(26),fxg(27),fxg(28),fxg(29));
clear alpha1 alpha2 alpha3 alpha4 alpha5 alpha6 i num p1 p2 p3 p4 per1 per2 per3 per4 raw txt
save A.mat
X=[jyg fxg];
plot(X(1:29,1),X(1:29,2),'r*');
hold on;
title('研究样本散点分布图')
xlabel('机遇');
ylabel('风险');
[cidx2,cmeans2,sumd2,D2] = kmeans(X,4,'dist','sqEuclidean');
index1=find(cidx2==1);
plot(X(index1,1),X(index1,2),'r*');
index2=find(cidx2==2);
plot(X(index2,1),X(index2,2),'g*');
index3=find(cidx2==3);
plot(X(index3,1),X(index3,2),'b*');
index4=find(cidx2==4);
plot(X(index4,1),X(index4,2),'y*');
plot(cmeans2(:,1),cmeans2(:,2),'ko');
set(get(gca,'Children'),'LineWidth',2);%设置图中的图像的宽度
% P2 = figure;clf;
%下面的函数画的图横轴是分类的概率，纵轴是分类数。
% [silh2,h2] = silhouette(X,cidx2,'sqeuclidean');
%% 机遇聚类10.4分界
% X=[jyg zeros(29,1)];
% figure
% plot(X(1:29,1),X(1:29,2),'r*');
% hold on;
% title('研究样本散点分布图')
% [cidx2,cmeans2,sumd2,D2] = kmeans(X,2,'dist','sqEuclidean');
% index1=find(cidx2==1);
% plot(X(index1,1),X(index1,2),'r*');
% index2=find(cidx2==2);
% plot(X(index2,1),X(index2,2),'g*');
% index3=find(cidx2==3);
% plot(X(index3,1),X(index3,2),'b*');
% index4=find(cidx2==4);
% plot(X(index4,1),X(index4,2),'y*');
% plot(cmeans2(:,1),cmeans2(:,2),'ko');
% set(get(gca,'Children'),'LineWidth',2);%设置图中的图像的宽度
% P2 = figure;clf;
% %下面的函数画的图横轴是分类的概率，纵轴是分类数。
% [silh2,h2] = silhouette(X,cidx2,'sqeuclidean');
%% 风险聚类   分界
% X=[fxg zeros(29,1)];
% figure
% plot(X(1:29,1),X(1:29,2),'r*');
% hold on;
% title('研究样本散点分布图')
% [cidx2,cmeans2,sumd2,D2] = kmeans(X,2,'dist','sqEuclidean');
% index1=find(cidx2==1);
% plot(X(index1,1),X(index1,2),'r*');
% index2=find(cidx2==2);
% plot(X(index2,1),X(index2,2),'g*');
% index3=find(cidx2==3);
% plot(X(index3,1),X(index3,2),'b*');
% index4=find(cidx2==4);
% plot(X(index4,1),X(index4,2),'y*');
% plot(cmeans2(:,1),cmeans2(:,2),'ko');
% set(get(gca,'Children'),'LineWidth',2);%设置图中的图像的宽度
% P2 = figure;clf;
% %下面的函数画的图横轴是分类的概率，纵轴是分类数。
% [silh2,h2] = silhouette(X,cidx2,'sqeuclidean');