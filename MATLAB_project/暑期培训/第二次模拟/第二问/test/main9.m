%% 八辆单班车的情况
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
    if time(i)-time(i-8)>=70;
        array(i)=array(i-8);
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
array(58)=7;
array(59)=8;
for i=60:67
    if time(i)-time(i-16)>=70;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=68:79
    if time(i)-time(i-8)>=70;
        array(i)=array(i-8);
    else
        index=index+1;
        array(i)=index;
    end
end
array(80:81)=1:2;
array(82)=16;
array(83:86)=3:6;
for i=87:94
    if time(i)-time(i-14)>=80;
        array(i)=array(i-14);
    else
        index=index+1;
        array(i)=index;
    end
end
array(95:96)=7:8;
array(97:101)=1:5;
for i=102:109
     if time(i)-time(i-15)>=80;
        array(i)=array(i-15);
    else
        index=index+1;
        array(i)=index;
    end
end
array(110:112)=6:8;
for i=113:120
     if time(i)-time(i-11)>=75;
        array(i)=array(i-11);
    else
        index=index+1;
        array(i)=index;
    end
end
%% 检验满足上下午八小时工作
% 下午
for i=113:114
    if time(i)-time(i-55)>480
        disp('时间超过八小时');
    end
end
for i=115:116
    if time(i)-time(i-50)>480
        disp('时间超过八小时');
    end
end
if time(117)-time(67)>480
    disp('时间超过八小时');
end
for i=118:120
    if time(i)-time(i-58)>480
        disp('时间超过八小时');
    end
end
for i=111:112
    if time(i)-time(i-48)>480
        disp('时间超过八小时');
    end
end
%% 计算每辆车上下午运行时间的评价参数
shangwu=zeros(1,16);
shangwu(1:8)=160;
shangwu(9:11)=time(49:51)-time(9:11);
shangwu(12:16)=time(44:48)-time(12:16);
xiawu=zeros(1,16);
xiawu(1:8)=240;
xiawu(9:10)=time(115:116)-time(65:66);
xiawu(11)=time(117)-time(67);
xiawu(12:14)=time(118:120)-time(60:62);
xiawu(15:16)=time(111:112)-time(63:64);
res=shangwu-xiawu;
res=res.^2;
res=sqrt(sum(res)/16);