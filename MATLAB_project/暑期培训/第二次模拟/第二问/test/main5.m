%% 四辆单班车的情况
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
    if time(i)-time(i-12)>=70;
        array(i)=array(i-12);
    else
        index=index+1;
        array(i)=index;
    end
end
array(52)=1;
array(53)=2;
array(54)=3;
array(55)=4;
for i=56:60
    if time(i)-time(i-16)>=70;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
array(61)=1;
array(62)=2;
array(63)=3;
array(64)=4;
for i=65:71
    if time(i)-time(i-20)>=70;
        array(i)=array(i-20);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=72:76
    if time(i)-time(i-16)>=70;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=77:80
    if time(i)-time(i-12)>=70;
        array(i)=array(i-12);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=81:88
    if time(i)-time(i-12)>=80;
        array(i)=array(i-12);
    else
        index=index+1;
        array(i)=index;
    end
end
array(89)=1;
array(90)=2;
for i=91:99
    if time(i)-time(i-14)>=80;
        array(i)=array(i-14);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=100:102
     if time(i)-time(i-14)>=75;
        array(i)=array(i-14);
    else
        index=index+1;
        array(i)=index;
    end
end
array(103)=3;
array(104)=4;
for i=105:116
     if time(i)-time(i-14)>=75;
        array(i)=array(i-14);
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
% 下午
for i=112:116
    if time(i)-time(i-56)>480
        disp('时间超过八小时');
    end
end
for i=105:111
    if time(i)-time(i-40)>480
        disp(array(i));
        disp('时间超过八小时');
    end
end

%% 计算每辆车上下午运行时间的评价参数
shangwu=zeros(1,16);
shangwu(1:4)=160;
shangwu(5:11)=time(45:51)-time(5:11);
shangwu(12:16)=time(40:44)-time(12:16);
xiawu=zeros(1,16);
xiawu(1:4)=240;
xiawu(5)=time(105)-time(65);
xiawu(6:9)=time(117:120)-time(66:69);
xiawu(10:11)=time(110:111)-time(70:71);
xiawu(12:16)=time(112:116)-time(56:60);
res=shangwu-xiawu;
res=res.^2;
res=sqrt(sum(res)/16);