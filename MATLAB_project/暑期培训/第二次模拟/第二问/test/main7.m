%% 六辆单班车的情况
% x=[24   54   19   22];120班车
% 0-120(26)                   5                 80                    24
% 120-606(80)               9                 70                    54
% 606-720(99)               6                 80                    19
% 720-874(120)             7                 75                    22
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
    if time(i)-time(i-10)>=70;
        array(i)=array(i-10);
    else
        index=index+1;
        array(i)=index;
    end
end
array(52)=1;
array(53)=2;
array(54)=3;
array(55)=4;
array(56)=5;
array(57)=6;
for i=58:67
    if time(i)-time(i-16)>=70;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
if time(68)-time(58)>=70;
    array(68)=array(58);
else
    index=index+1;
    array(68)=index;
end
for i=69:80
    if time(i)-time(i-10)>=70;
        array(i)=array(i-10);
    else
        index=index+1;
        array(i)=index;
    end
end
array(81:86)=1:6;
for i=87:94
    if time(i)-time(i-16)>=80;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
array(95:96)=7:8;
array(97:100)=1:4;
for i=101:108
     if time(i)-time(i-14)>=80;
        array(i)=array(i-14);
    else
        index=index+1;
        array(i)=index;
    end
end
array(109:110)=5:6;
for i=111:112
     if time(i)-time(i-16)>=75;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=113:120
     if time(i)-time(i-12)>=75;
        array(i)=array(i-12);
    else
        index=index+1;
        array(i)=index;
    end
end
%% 检验满足上下午八小时工作
% 下午
if time(120)-time(58)>480
    disp('时间超过八小时');
end
for i=111:119
    if time(i)-time(i-52)>480
        disp('时间超过八小时');
    end
end
%% 计算每辆车上下午运行时间的评价参数
shangwu=zeros(1,16);
shangwu(1:6)=160;
shangwu(7:15)=time(43:51)-time(7:15);
shangwu(16)=time(42)-time(16);
xiawu=zeros(1,16);
xiawu(1:6)=240;
xiawu(7:15)=time(111:119)-time(59:67);
xiawu(16)=time(120)-time(58);
res=shangwu-xiawu;
res=res.^2;
res=sqrt(sum(res)/16);