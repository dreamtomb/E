% close
% clear
% clc
% % 对1月的数据进行处理
% data1=xlsread('1.xls');
% data2=xlsread('2.xls');
% data3=xlsread('3.xls');
% data4=xlsread('4.xls');
% data=[data1;data2;data3;data4];
% 归一化
% data(:,3)=mapminmax(data(:,3)',0,1)';
% data(:,4)=mapminmax(data(:,4)',0,1)';
% data(:,5)=mapminmax(data(:,5)',0,1)';
% figure(1);
% 以月为整体，以天为单位,6个指标
% days=unique(data(:,1));
% zhibiao=zeros(length(days),6);
% for i=1:length(days)
%     index=find(data(:,1)==days(i));
%     zhibiao(i,1)=mean(data(index,3));
%     zhibiao(i,2)=std(data(index,3));
%     zhibiao(i,3)=mean(data(index,4));
%     zhibiao(i,4)=std(data(index,4));
%     zhibiao(i,5)=mean(data(index,5));
%     zhibiao(i,6)=std(data(index,5));
% end
% plot(1:length(days),zhibiao(:,1)');
% hold on;
% plot(1:length(days),zhibiao(:,2)');
% plot(1:length(days),zhibiao(:,3)');
% plot(1:length(days),zhibiao(:,4)');
% plot(1:length(days),zhibiao(:,5)');
% plot(1:length(days),zhibiao(:,6)');
% legend('交易量均值','交易量标准差','交易成功率均值','交易成功率标准差','响应时间均值','响应时间标准差');
% xlabel('天');
% hold off;
% figure(2)
% [cidx,cmeans,sumd,D] = kmeans(zhibiao,2,'dist','sqEuclidean');
% index1=find(cidx==1);
% index2=find(cidx==2);
% index3=find(cidx==3);
% index4=find(cidx==4);
% index5=find(cidx==5);
% scatter3(zhibiao(index1,1)',zhibiao(index1,3)',zhibiao(index1,5)','r*');
% hold on;
% scatter3(zhibiao(index2,1)',zhibiao(index2,3)',zhibiao(index2,5)','g*');
% scatter3(zhibiao(index3,1)',zhibiao(index3,3)',zhibiao(index3,5)','b*');
% scatter3(zhibiao(index4,1)',zhibiao(index4,3)',zhibiao(index4,5)','y*');
% scatter3(zhibiao(index5,1)',zhibiao(index5,3)',zhibiao(index5,5)','m*');
% scatter3(cmeans(:,1)',cmeans(:,3)',cmeans(:,5)','ko');
% set(get(gca,'Children'),'LineWidth',2);%设置图中的图像的宽度
% hold off;
% figure(3);
% clf;
% 下面的函数画的图横轴是分类的概率，纵轴是分类数。
% [silh2,h2] = silhouette(zhibiao,cidx,'sqeuclidean');
% 以天为整体，以分钟为单位,3个指标
%% 正式代码
close
clear
clc
% 对数据进行处理
data1=xlsread('1.xls');
data2=xlsread('2.xls');
data3=xlsread('3.xls');
data4=xlsread('4.xls');
data=[data1;data2;data3;data4];
days=unique(data(:,1));
zhibiao=zeros(2,length(days));
for i=1:length(days)
    index=find(data(:,1)==days(i));
    zhibiao(1,i)=mean(data(index,3));
    zhibiao(2,i)=mean(data(index,5));
end
figure(1)
plot(1:length(days),zhibiao(1,:)');
% figure(2)
[cidx,cmeans,sumd,D] = kmeans(zhibiao(1,:)',4,'dist','sqEuclidean');
% index1=find(cidx==1);
% index2=find(cidx==2);
% index3=find(cidx==3);
% index4=find(cidx==4);
% index5=find(cidx==5);
% scatter(zhibiao(1,index1),zhibiao(2,index1),'r*');
% hold on;
% scatter(zhibiao(1,index2),zhibiao(2,index2),'g*');
% scatter(zhibiao(1,index3),zhibiao(2,index3),'b*');
% scatter(zhibiao(1,index4),zhibiao(2,index4),'y*');
% scatter(zhibiao(1,index5),zhibiao(2,index5),'m*');
% scatter(cmeans(:,1)',cmeans(:,2)','ko');
% set(get(gca,'Children'),'LineWidth',2);%设置图中的图像的宽度
% hold off;
figure(2);
clf;
% 下面的函数画的图横轴是分类的概率，纵轴是分类数。
[silh2,h2] = silhouette(zhibiao',cidx,'sqeuclidean');
dayclass1=find(cidx==1);
dayindex1=days(dayclass1);
dayclass2=find(cidx==2);
dayindex2=days(dayclass2);
dayclass3=find(cidx==3);
dayindex3=days(dayclass3);
dayclass4=find(cidx==4);
dayindex4=days(dayclass4);
% 以天为整体，以分钟为单位,3个指标
%第一类天
line1={};
for i=1:length(dayindex1)
    line1(i,:)={find(data(:,1)==dayindex1(i))};
end
figure
for i=1:size(line1,1)
    plot(1:size(line1{i}),data(line1{i},3));
    hold on;
end
line2={};
for i=1:length(dayindex2)
    line2(i,:)={find(data(:,1)==dayindex2(i))};
end
figure
for i=1:size(line2,1)
    plot(1:size(line2{i}),data(line2{i},3));
    hold on;
end
line3={};
for i=1:length(dayindex3)
    line3(i,:)={find(data(:,1)==dayindex3(i))};
end
figure
for i=1:size(line3,1)
    plot(1:size(line3{i}),data(line3{i},3));
    hold on;
end
line4={};
for i=1:length(dayindex4)
    line4(i,:)={find(data(:,1)==dayindex4(i))};
end
figure
for i=1:size(line4,1)
    plot(1:size(line4{i}),data(line4{i},3));
    hold on;
end
%% 四类天的每分钟的交易量求均值
%第一类
one=zeros(1440,size(line1,1));
for i=1:size(line1,1)
    one(1:size(line1{i},1),i)=data(line1{i},3);
end
onetotal=mean(one');
%第二类 
two=zeros(1440,size(line2,1));
for i=1:size(line2,1)
    two(1:size(line2{i},1),i)=data(line2{i},3);
end
twototal=mean(two');
%第三类
thr=zeros(1440,size(line3,1));
for i=1:size(line3,1)
    thr(1:size(line3{i},1),i)=data(line3{i},3);
end
thrtotal=mean(thr');
%第四类
fou=zeros(1440,size(line4,1));
for i=1:size(line4,1)
    fou(1:size(line4{i},1),i)=data(line4{i},3);
end
foutotal=mean(fou');
%% 对四类天数的时段高低峰进行聚类
%第一类
[cidx1,cmeans,sumd,D] = kmeans(one,2,'dist','sqEuclidean');
figure
clf;
[silh2,h2] = silhouette(one,cidx1,'sqeuclidean');
%第二类
[cidx2,cmeans,sumd,D] = kmeans(two,2,'dist','sqEuclidean');
figure
clf;
[silh2,h2] = silhouette(two,cidx2,'sqeuclidean');
%第三类
[cidx3,cmeans,sumd,D] = kmeans(thr,2,'dist','sqEuclidean');
figure
clf;
[silh2,h2] = silhouette(thr,cidx3,'sqeuclidean');
%第四类
[cidx4,cmeans,sumd,D] = kmeans(fou,2,'dist','sqEuclidean');
figure
clf;
[silh2,h2] = silhouette(fou,cidx4,'sqeuclidean');
%% 第一类高低峰共12个指标
oneindex=find(cidx1==1);
onefir=oneindex(1);
oneend=oneindex(end);
twoindex=find(cidx1==2);
twofir=twoindex(1);
twoend=twoindex(end);
if onefir<twofir&&oneend>twoend
    gaofeng=2;
else
    gaofeng=1;
end
%第一类高峰交易量
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
onehighnum=zeros(gaofenghigh-gaofenglow+1,size(line1,1));
for i=1:size(line1,1)
    onehighnum(1:gaofenghigh-gaofenglow+1,i)=data(line1{i}(gaofenglow:gaofenghigh),3);
end
onehighnummean=mean(onehighnum');
onehighnumstd=std(onehighnum');
%第一类高峰交易成功率
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
onehighp=zeros(gaofenghigh-gaofenglow+1,size(line1,1));
for i=1:size(line1,1)
    onehighp(1:gaofenghigh-gaofenglow+1,i)=data(line1{i}(gaofenglow:gaofenghigh),4);
end
onehighpmean=mean(onehighp');
onehighpstd=std(onehighp');
%第一类高峰响应时间
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
onehightime=zeros(gaofenghigh-gaofenglow+1,size(line1,1));
for i=1:size(line1,1)
    onehightime(1:gaofenghigh-gaofenglow+1,i)=data(line1{i}(gaofenglow:gaofenghigh),5);
end
onehightimemean=mean(onehightime');
onehightimestd=std(onehightime');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%第一类低峰交易量
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
onelownum=zeros(gaofenglow-1+1440-gaofenghigh,size(line1,1));
for i=1:size(line1,1)
    onelownum(1:gaofenglow-1+length(line1{i})-gaofenghigh,i)=data(line1{i}([1:gaofenglow-1,gaofenghigh+1:length(line1{i})]),3);
end
onelownummean=mean(onelownum');
onelownumstd=std(onelownum');
%第一类低峰交易成功率
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
onelowp=zeros(gaofenglow-1+1440-gaofenghigh,size(line1,1));
for i=1:size(line1,1)
    onelowp(1:gaofenglow-1+length(line1{i})-gaofenghigh,i)=data(line1{i}([1:gaofenglow-1,gaofenghigh+1:length(line1{i})]),4);
end
onelowpmean=mean(onelowp');
onelowpstd=std(onelowp');
%第一类低峰响应时间
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
onelowtime=zeros(gaofenglow-1+1440-gaofenghigh,size(line1,1));
for i=1:size(line1,1)
    onelowtime(1:gaofenglow-1+length(line1{i})-gaofenghigh,i)=data(line1{i}([1:gaofenglow-1,gaofenghigh+1:length(line1{i})]),5);
end
onelowtimemean=mean(onelowtime');
onelowtimestd=std(onelowtime');
firstclasshighlow=gaofenglow;
firstclasshighhigh=gaofenghigh;
%% 第二类高低峰共12个指标
oneindex=find(cidx2==1);
onefir=oneindex(1);
oneend=oneindex(end);
twoindex=find(cidx2==2);
twofir=twoindex(1);
twoend=twoindex(end);
if onefir<twofir&&oneend>twoend
    gaofeng=2;
else
    gaofeng=1;
end
%第一类高峰交易量
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
twohighnum=zeros(gaofenghigh-gaofenglow+1,size(line2,1));
for i=1:size(line2,1)
    twohighnum(1:gaofenghigh-gaofenglow+1,i)=data(line2{i}(gaofenglow:gaofenghigh),3);
end
twohighnummean=mean(twohighnum');
twohighnumstd=std(twohighnum');
%第一类高峰交易成功率
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
twohighp=zeros(gaofenghigh-gaofenglow+1,size(line2,1));
for i=1:size(line2,1)
    twohighp(1:gaofenghigh-gaofenglow+1,i)=data(line2{i}(gaofenglow:gaofenghigh),4);
end
twohighpmean=mean(twohighp');
twohighpstd=std(twohighp');
%第一类高峰响应时间
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
twohightime=zeros(gaofenghigh-gaofenglow+1,size(line2,1));
for i=1:size(line2,1)
    twohightime(1:gaofenghigh-gaofenglow+1,i)=data(line2{i}(gaofenglow:gaofenghigh),5);
end
twohightimemean=mean(twohightime');
twohightimestd=std(twohightime');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%第一类低峰交易量
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
twolownum=zeros(gaofenglow-1+1440-gaofenghigh,size(line2,1));
for i=1:size(line2,1)
    twolownum(1:gaofenglow-1+length(line2{i})-gaofenghigh,i)=data(line2{i}([1:gaofenglow-1,gaofenghigh+1:length(line2{i})]),3);
end
twolownummean=mean(twolownum');
twolownumstd=std(twolownum');
%第一类低峰交易成功率
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
twolowp=zeros(gaofenglow-1+1440-gaofenghigh,size(line2,1));
for i=1:size(line2,1)
    twolowp(1:gaofenglow-1+length(line2{i})-gaofenghigh,i)=data(line2{i}([1:gaofenglow-1,gaofenghigh+1:length(line2{i})]),4);
end
twolowpmean=mean(twolowp');
twolowpstd=std(twolowp');
%第一类低峰响应时间
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
twolowtime=zeros(gaofenglow-1+1440-gaofenghigh,size(line2,1));
for i=1:size(line2,1)
    twolowtime(1:gaofenglow-1+length(line2{i})-gaofenghigh,i)=data(line2{i}([1:gaofenglow-1,gaofenghigh+1:length(line2{i})]),5);
end
twolowtimemean=mean(twolowtime');
twolowtimestd=std(twolowtime');
secondclasshighlow=gaofenglow;
secondclasshighhigh=gaofenghigh;
%% 第三类高低峰共12个指标
oneindex=find(cidx3==1);
onefir=oneindex(1);
oneend=oneindex(end);
twoindex=find(cidx3==2);
twofir=twoindex(1);
twoend=twoindex(end);
if onefir<twofir&&oneend>twoend
    gaofeng=2;
else
    gaofeng=1;
end
%第一类高峰交易量
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
thrhighnum=zeros(gaofenghigh-gaofenglow+1,size(line3,1));
for i=1:size(line3,1)
    thrhighnum(1:gaofenghigh-gaofenglow+1,i)=data(line3{i}(gaofenglow:gaofenghigh),3);
end
thrhighnummean=mean(thrhighnum');
thrhighnumstd=std(thrhighnum');
%第一类高峰交易成功率
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
thrhighp=zeros(gaofenghigh-gaofenglow+1,size(line3,1));
for i=1:size(line3,1)
    thrhighp(1:gaofenghigh-gaofenglow+1,i)=data(line3{i}(gaofenglow:gaofenghigh),4);
end
thrhighpmean=mean(thrhighp');
thrhighpstd=std(thrhighp');
%第一类高峰响应时间
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
thrhightime=zeros(gaofenghigh-gaofenglow+1,size(line3,1));
for i=1:size(line3,1)
    thrhightime(1:gaofenghigh-gaofenglow+1,i)=data(line3{i}(gaofenglow:gaofenghigh),5);
end
thrhightimemean=mean(thrhightime');
thrhightimestd=std(thrhightime');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%第一类低峰交易量
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
thrlownum=zeros(gaofenglow-1+1440-gaofenghigh,size(line3,1));
for i=1:size(line3,1)
    thrlownum(1:gaofenglow-1+length(line3{i})-gaofenghigh,i)=data(line3{i}([1:gaofenglow-1,gaofenghigh+1:length(line3{i})]),3);
end
thrlownummean=mean(thrlownum');
thrlownumstd=std(thrlownum');
%第一类低峰交易成功率
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
thrlowp=zeros(gaofenglow-1+1440-gaofenghigh,size(line3,1));
for i=1:size(line3,1)
    thrlowp(1:gaofenglow-1+length(line3{i})-gaofenghigh,i)=data(line3{i}([1:gaofenglow-1,gaofenghigh+1:length(line3{i})]),4);
end
thrlowpmean=mean(thrlowp');
thrlowpstd=std(thrlowp');
%第一类低峰响应时间
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
thrlowtime=zeros(gaofenglow-1+1440-gaofenghigh,size(line3,1));
for i=1:size(line3,1)
    thrlowtime(1:gaofenglow-1+length(line3{i})-gaofenghigh,i)=data(line3{i}([1:gaofenglow-1,gaofenghigh+1:length(line3{i})]),5);
end
thrlowtimemean=mean(thrlowtime');
thrlowtimestd=std(thrlowtime');
thirdclasshighlow=gaofenglow;
thirdclasshighhigh=gaofenghigh;
%% 第四类高低峰共12个指标
oneindex=find(cidx4==1);
onefir=oneindex(1);
oneend=oneindex(end);
twoindex=find(cidx4==2);
twofir=twoindex(1);
twoend=twoindex(end);
if onefir<twofir&&oneend>twoend
    gaofeng=2;
else
    gaofeng=1;
end
%第一类高峰交易量
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
fouhighnum=zeros(gaofenghigh-gaofenglow+1,size(line4,1));
for i=1:size(line4,1)
    fouhighnum(1:gaofenghigh-gaofenglow+1,i)=data(line4{i}(gaofenglow:gaofenghigh),3);
end
fouhighnummean=mean(fouhighnum');
fouhighnumstd=std(fouhighnum');
%第一类高峰交易成功率
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
fouhighp=zeros(gaofenghigh-gaofenglow+1,size(line4,1));
for i=1:size(line4,1)
    fouhighp(1:gaofenghigh-gaofenglow+1,i)=data(line4{i}(gaofenglow:gaofenghigh),4);
end
fouhighpmean=mean(fouhighp');
fouhighpstd=std(fouhighp');
%第一类高峰响应时间
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
fouhightime=zeros(gaofenghigh-gaofenglow+1,size(line4,1));
for i=1:size(line4,1)
    fouhightime(1:gaofenghigh-gaofenglow+1,i)=data(line4{i}(gaofenglow:gaofenghigh),5);
end
fouhightimemean=mean(fouhightime');
fouhightimestd=std(fouhightime');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%第一类低峰交易量
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
foulownum=zeros(gaofenglow-1+1440-gaofenghigh,size(line4,1));
for i=1:size(line4,1)
    foulownum(1:gaofenglow-1+length(line4{i})-gaofenghigh,i)=data(line4{i}([1:gaofenglow-1,gaofenghigh+1:length(line4{i})]),3);
end
foulownummean=mean(foulownum');
foulownumstd=std(foulownum');
%第一类低峰交易成功率
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
foulowp=zeros(gaofenglow-1+1440-gaofenghigh,size(line4,1));
for i=1:size(line4,1)
    foulowp(1:gaofenglow-1+length(line4{i})-gaofenghigh,i)=data(line4{i}([1:gaofenglow-1,gaofenghigh+1:length(line4{i})]),4);
end
foulowpmean=mean(foulowp');
foulowpstd=std(foulowp');
%第一类低峰响应时间
if gaofeng==1
    gaofenglow=onefir;
    gaofenghigh=oneend;
else
    gaofenglow=twofir;
    gaofenghigh=twoend;
end
foulowtime=zeros(gaofenglow-1+1440-gaofenghigh,size(line4,1));
for i=1:size(line4,1)
    foulowtime(1:gaofenglow-1+length(line4{i})-gaofenghigh,i)=data(line4{i}([1:gaofenglow-1,gaofenghigh+1:length(line4{i})]),5);
end
foulowtimemean=mean(foulowtime');
foulowtimestd=std(foulowtime');
fourthclasshighlow=gaofenglow;
fourthclasshighhigh=gaofenghigh;
res={onehighnummean onehighnumstd onehighpmean onehighpstd onehightimemean onehightimestd;
twohighnummean twohighnumstd twohighpmean twohighpstd twohightimemean twohightimestd;
thrhighnummean thrhighnumstd thrhighpmean thrhighpstd thrhightimemean thrhightimestd;
fouhighnummean fouhighnumstd fouhighpmean fouhighpstd fouhightimemean fouhightimestd;
onelownummean onelownumstd onelowpmean onelowpstd onelowtimemean onelowtimestd;
twolownummean twolownumstd twolowpmean twolowpstd twolowtimemean twolowtimestd;
thrlownummean thrlownumstd thrlowpmean thrlowpstd thrlowtimemean thrlowtimestd;
foulownummean foulownumstd foulowpmean foulowpstd foulowtimemean foulowtimestd;
};
sk=zeros(8,6);
ku=sk;
for i=1:8
    for j=1:6
        sk(i,j)=skewness(res{i,j});%偏度
        ku(i,j)=kurtosis(res{i,j});%峰度
    end
end
jbt=zeros(8,3);
xg=jbt;
for i=1:8
    corr13=corrcoef(res{i,1},res{i,3});
    corr35=corrcoef(res{i,3},res{i,5});
    corr15=corrcoef(res{i,1},res{i,5});
    xg(i,1:3)=[corr13(1,2) corr35(1,2) corr15(1,2)];
end
save data.mat;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    