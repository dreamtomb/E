%% 转化为三角形模糊数
num15=xlsread('第三问');
num15=num15';%num15的9行1到10列是精确数,11列是区间数，12列是模糊语言变量
num15(:,11:12);
num15(:,13:15);
%% 精确数的混合型决策数据规范化处理
sum=zeros(1,10);
for i=1:9
    sum=sum+num15(i,1:10).^2;
end
sum=sqrt(sum);
for i=1:10
    num15(:,i)=num15(:,i)./sum(i);
end
clear sum;
%% 区间数的混合型决策数据规范化处理
up=zeros(1,1);
for i=1:9
    up=up+num15(i,12).^2;
end
up=sqrt(up);
low=zeros(1,1);
for i=1:9
    low=low+num15(i,11).^2;
end
low=sqrt(low);
num15(:,11)=num15(:,11)/up;
num15(:,12)=num15(:,12)/low;
%% 模糊语言变量（三角形数）的混合型决策数据规范化处理
l=zeros(1,1);
for i=1:9
    l=l+num15(i,13).^2;
end
l=sqrt(l);
m=zeros(1,1);
for i=1:9
    m=m+num15(i,14).^2;
end
m=sqrt(m);
u=zeros(1,1);
for i=1:9
    u=u+num15(i,15).^2;
end
u=sqrt(u);
num15(:,13)=num15(:,13)/u;
num15(:,14)=num15(:,14)/m;
num15(:,15)=num15(:,15)/l;
R=num15;%R是规范化决策矩阵
%% 求混合型灰靶靶心
r01=max(R(:,1:10));
[r02max,r02maxindex]=max((R(:,11)+R(:,12))/2);
r02=R(r02maxindex,11:12);
[r03max,r03maxindex]=max(R(:,14));
r03=R(r03maxindex,13:15);
r0=[r01 r02 r03];
%% 求靶心距离
for i=1:10
    dm1(:,i)=abs(R(:,i)-r0(i));
end
dm2=sqrt(2)/2*sqrt((R(:,11)-r0(11)).^2+(R(:,12)-r0(12)).^2);
dm3=sqrt(3)/3*sqrt((R(:,13)-r0(13)).^2+(R(:,14)-r0(14)).^2+(R(:,15)-r0(15)).^2);
d=[dm1 dm2 dm3];
%权重
w=zeros(1,12);
xigmad=zeros(1,12);
for i=1:9
    xigmad=xigmad+d(i,:).^2;
end
xigma=sum(1./xigmad);
w=1./xigma./xigmad;
w=w(1,[12:-1:1]);
%求靶心距epsilon
epsilon=zeros(9,1);
epsilon=d*w';
[score,index]=sort(epsilon);















