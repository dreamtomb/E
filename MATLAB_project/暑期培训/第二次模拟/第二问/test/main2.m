%% 一辆单班车的情况
% x=[24   54   19   22];120班车
% 0-120                   5                 80                    24
% 120-606               9                 70                    54
% 606-720               6                 80                    19
% 720-874               7                 75                    22
%% 一步步得到时刻表
%发车时刻表
time=[0:5:120 129:9:606 612:6:720 727:7:874];
%记录车的顺序
array=[1:16 zeros(1,104)];
index=16;
for i=17:32
    if time(i)-time(i-16)>=80;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=33:51
    if time(i)-time(i-15)>=70;
        array(i)=array(i-15);
    else
        index=index+1;
        array(i)=index;
    end
end
array(52)=1;
for i=53:63
     if time(i)-time(i-16)>=70;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
if time(64)-time(52)>=70;
    array(64)=array(52);
else
    index=index+1;
    array(i)=index;
end
for i=65:68
    if time(i)-time(i-17)>=70;
        array(i)=array(i-17);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=69:79
    if time(i)-time(i-16)>=70;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
if time(80)-time(65)>=70;
    array(80)=array(65);
else
    index=index+1;
    array(i)=index;
end
for i=81:99
    if time(i)-time(i-15)>=80;
        array(i)=array(i-15);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=100:120
    if time(i)-time(i-15)>=75;
        array(i)=array(i-15);
    else
        index=index+1;
        array(i)=index;
    end
end
array(110:120)=array(110:120)+4;
%% 检验满足上下午八小时工作
for i=37:47
    if time(i)-time(i-31)>480
        disp('时间超过八小时');
    end
end
for i=48:51
    if time(i)-time(i-46)>480
        disp('时间超过八小时');
    end
end
% 下午
for i=110:120
    if time(i)-time(i-58)>480
        disp('时间超过八小时');
    end
end
for i=95:98
    if time(i)-time(i-30)>480
        disp(array(i));
        disp('时间超过八小时');
    end
end

%% 计算每辆车上下午运行时间的评价参数
shangwu=zeros(1,16);
shangwu(1)=160;
shangwu(2:5)=time(48:51)-time(2:5);
shangwu(6:16)=time(37:47)-time(6:16);
xiawu=zeros(1,16);
xiawu(1)=160;
xiawu(2:5)=time(95:98)-time(65:68);
xiawu(6:16)=time(110:120)-time(53:63);
res=shangwu-xiawu;
res=res.^2;
res=sqrt(sum(res)/16);