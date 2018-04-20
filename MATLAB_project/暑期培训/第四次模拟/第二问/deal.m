%% 读取数据，其中7行一个周期，
% 第一行是自行车序号和出发区域
% 第二行到第七行是出发时间，到达时间，到达区域
function data=deal()
ffid = fopen('t.txt','r');
i = 1;
while feof(ffid) == 0
    tline = fgetl(ffid);
    tf = isspace(tline); % 空格判断
    dtf = diff(tf); % 差分
    dtf = [0 dtf]; % 对齐到向量
    ind = find(dtf~=0); % 找到空格起始位置
    tind = ~tf; % 取非零数值信息
    tind(ind) = 1; % 设置标记
    tline = tline(tind); % 过滤数据
    tdata{i,1} = tline;
    i = i+1;
end
ffid = fclose(ffid);
data=zeros(12649,5);
data=data-1;
for i=1:12649
    num=str2num(tdata{i});
    if size(num,2)==3
        data(i,2)=num(1);
        data(i,3)=num(2);
        data(i,5)=num(3);
    else
        data(i,1)=num(1);
        data(i,2)=num(2);
    end
end
[x,y]=find(data(:,1)~=-1);
for i=1:length(x)
    num=data(x(i),1);%自行车序号
    gonum=data(x(i),2);% 出发区域
    data(x(i)+1,1)=num;
    data(x(i)+1,4)=gonum;
end
for i=1:length(x)-1
    num=data(x(i),1);%自行车序号
    data(x(i)+1:x(i+1)-1,1)=num;
end
num=data(x(1000),1);
data(x(1000)+1:end,1)=num;
for i=1:length(x)-1
    data(x(i+1)-1:-1:x(i)+2,4)=data(x(i+1)-2:-1:x(i)+1,5);
end
for i=length(data(:,4)):-1:x(1000)+2
    data(i,4)=data(i-1,5);
end
index=find(data(:,5)==-1);
num1=length(find(data(index,2)==1));
num2=length(find(data(index,2)==2));
num3=length(find(data(index,2)==3));
num4=length(find(data(index,2)==4));
num5=length(find(data(index,2)==5));
num6=length(find(data(index,2)==6));
num7=length(find(data(index,2)==7));
num8=length(find(data(index,2)==8));
num9=length(find(data(index,2)==9));
num10=length(find(data(index,2)==10));
data(index,:)=[];
fprintf('%s%d\n','区域1的初始车辆数目：',num1);
fprintf('%s%d\n','区域2的初始车辆数目：',num2);
fprintf('%s%d\n','区域3的初始车辆数目：',num3);
fprintf('%s%d\n','区域4的初始车辆数目：',num4);
fprintf('%s%d\n','区域5的初始车辆数目：',num5);
fprintf('%s%d\n','区域6的初始车辆数目：',num6);
fprintf('%s%d\n','区域7的初始车辆数目：',num7);
fprintf('%s%d\n','区域8的初始车辆数目：',num8);
fprintf('%s%d\n','区域9的初始车辆数目：',num9);
fprintf('%s%d\n','区域10的初始车辆数目：',num10);