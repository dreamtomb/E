%% 七辆单班车的情况
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
    if time(i)-time(i-9)>=70;
        array(i)=array(i-9);
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
for i=59:67
    if time(i)-time(i-16)>=70;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=68:80
    if time(i)-time(i-9)>=70;
        array(i)=array(i-9);
    else
        index=index+1;
        array(i)=index;
    end
end
array(81:87)=1:7;
for i=88:96
    if time(i)-time(i-16)>=80;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
array(97:100)=1:4;
for i=101:108
     if time(i)-time(i-13)>=80;
        array(i)=array(i-13);
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
if time(117)-time(67)>480
    disp('时间超过八小时');
end
for i=118:120
    if time(i)-time(i-52)>480
        disp('时间超过八小时');
    end
end
for i=112:116
    if time(i)-time(i-50)>480
        disp('时间超过八小时');
    end
end
%% 计算每辆车上下午运行时间的评价参数
shangwu=zeros(1,16);
shangwu(1:7)=160;
shangwu(8)=time(51)-time(8);
shangwu(9:16)=time(43:50)-time(9:16);
xiawu=zeros(1,16);
xiawu(1:7)=240;
xiawu(8)=time(117)-time(67);
xiawu(9:11)=time(118:120)-time(59:61);
xiawu(12:16)=time(112:116)-time(62:66);
res=shangwu-xiawu;
res=res.^2;
res=sqrt(sum(res)/16);