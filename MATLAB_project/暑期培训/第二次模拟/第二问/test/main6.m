%% 五辆单班车的情况
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
    if time(i)-time(i-11)>=70;
        array(i)=array(i-11);
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
for i=57:59
    if time(i)-time(i-16)>=70;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
array(60)=1;
array(61)=2;
array(62)=3;
array(63)=4;
array(64)=5;
for i=65:72
    if time(i)-time(i-21)>=80;
        array(i)=array(i-21);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=73:75
    if time(i)-time(i-16)>=80;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=76:80
    if time(i)-time(i-11)>=80;
        array(i)=array(i-11);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=81:85
    if time(i)-time(i-11)>=80;
        array(i)=array(i-11);
    else
        index=index+1;
        array(i)=index;
    end
end
array(86)=1;
array(87)=2;
for i=88:91
    if time(i)-time(i-13)>=80;
        array(i)=array(i-13);
    else
        index=index+1;
        array(i)=index;
    end
end
array(92)=3;
array(93)=4;
for i=94:99
    if time(i)-time(i-15)>=80;
        array(i)=array(i-15);
    else
        index=index+1;
        array(i)=index;
    end
end
if time(100)-time(85)>=80;
        array(100)=array(85);
    else
        index=index+1;
        array(100)=index;
end
if time(101)-time(88)>=80;
        array(101)=array(88);
    else
        index=index+1;
        array(101)=index;
end
for i=102:104
    if time(i)-time(i-13)>=75;
        array(i)=array(i-13);
    else
        index=index+1;
        array(i)=index;
    end
end
array(105)=5;
for i=106:116
    if time(i)-time(i-12)>=75;
        array(i)=array(i-12);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=117:120
    if time(i)-time(i-11)>=75;
        array(i)=array(i-11);
    else 
        index=index+1;
        array(i)=index;
    end
end
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
shangwu(1:5)=160;
shangwu(6:13)=time(44:51)-time(6:13);
shangwu(14:16)=time(41:43)-time(14:16);
xiawu=zeros(1,16);
xiawu(1:5)=240;
xiawu(6:12)=time(114:120)-time(65:71);
xiawu(13)=time(110)-time(72);
xiawu(14:16)=time(111:113)-time(57:59);
res=shangwu-xiawu;
res=res.^2;
res=sqrt(sum(res)/16);