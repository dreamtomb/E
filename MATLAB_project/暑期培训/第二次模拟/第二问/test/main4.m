%% 三辆单班车的情况
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
    if time(i)-time(i-13)>=70;
        array(i)=array(i-13);
    else
        index=index+1;
        array(i)=index;
    end
end
array(52)=1;
array(53)=2;
array(54)=3;
for i=55:62
    if time(i)-time(i-16)>=70;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
if time(62)-time(52)>=70;
    array(62)=array(52);
else
    index=index+1;
    array(i)=index;
end
if time(63)-time(53)>=70;
    array(63)=array(53);
else
    index=index+1;
    array(i)=index;
end
if time(64)-time(54)>=70;
    array(64)=array(54);
else
    index=index+1;
    array(i)=index;
end
for i=65:70
    if time(i)-time(i-19)>=80;
        array(i)=array(i-19);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=71:77
    if time(i)-time(i-16)>=80;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=78:80
    if time(i)-time(i-13)>=80;
        array(i)=array(i-13);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=81:91
    if time(i)-time(i-13)>=80;
        array(i)=array(i-13);
    else
        index=index+1;
        array(i)=index;
    end
end
array(92)=1;
for i=93:99
    if time(i)-time(i-14)>=80;
        array(i)=array(i-14);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=100:105
    if time(i)-time(i-14)>=75;
        array(i)=array(i-14);
    else
        index=index+1;
        array(i)=index;
    end
end
array(106)=2;
for i=107:120
    if time(i)-time(i-14)>=75;
        array(i)=array(i-14);
    else
        index=index+1;
        array(i)=index;
    end
end
array(120)=3;
%% 检验满足上下午八小时工作
for i=39:45
    if time(i)-time(i-30)>480
        disp('时间超过八小时');
    end
end
for i=46:51
    if time(i)-time(i-42)>480
        disp('时间超过八小时');
    end
end
% 下午
if time(119)-time(65)>480
        disp('时间超过八小时');
    end
for i=112:118
    if time(i)-time(i-57)>480
        disp('时间超过八小时');
    end
end
for i=107:111
    if time(i)-time(i-41)>480
        disp(array(i));
        disp('时间超过八小时');
    end
end

%% 计算每辆车上下午运行时间的评价参数
shangwu=zeros(1,16);
shangwu(1:3)=160;
shangwu(4:9)=time(46:51)-time(4:9);
shangwu(10:16)=time(39:45)-time(10:16);
xiawu=zeros(1,16);
xiawu(1:3)=240;
xiawu(4)=time(119)-time(65);
xiawu(5:9)=time(107:111)-time(66:70);
xiawu(10:16)=time(112:118)-time(55:61);
res=shangwu-xiawu;
res=res.^2;
res=sqrt(sum(res)/16);