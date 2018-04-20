% [0 30 90 210 690 810 1065]
% n1,n2,n3,n4,n5,n6是6个时期的车辆数目
% 4 10 29 80 30 30
% 9,6,4,6,4,8.5是四6个时期的间隔时间
% 0-30 30-90 90-210 210-690 690-810 810-1065
time=[0 9 18 27 36 42 48 54 60 66 72 78 84 90 94 98 102 106 110 114 118 122 126 130 134 138 142 146 150 154 158 162 166 170 174 178 182 186 190 194 198 202 206 210 216 222 228 234 240 246 252 258 264 270 276 282 288 294 300 306 312 318 324 330 336 342 348 354 360 366 372 378 384 390 396 402 408 414 420 426 432 438 444 450 456 462 468 474 480 486 492  498 504 510 516 522 528 534 540 546 552 558 564 570 576 582 588 594 600 606 612 618 624 630 636 642 648 654 660 666 672 678 684 690 694 698 702 706 710 714 718 722 726 730 734 738 742 746 750 754 758 762 766 770 774 778 782 786 790 794 798 802 806 810 818.5 827 835.5 844 852.5 861 869.5 878 886.5 895 903.5 912 920.5 929 937.5 946 954.5 963 971.5 980 988.5 997 1005.5 1014 1022.5 1031 1039.5 1048 1056.5 1065 1073.5 1082 1090.5 1099 1107.5 1116 1124.5 1133];
for i=63:66
    time(i:end)=time(i:end)-3;
end
time(156:end)=time(156:end)-5;
for i=157:176
    time(i:end)=time(i:end)-2.5;
end
array=[1:22 zeros(1,170)];
index=22;
for i=23:44
    if time(i)-time(i-22)>=80;
        array(i)=array(i-22);
    else
        index=index+1;
        array(i)=index;
    end
end
%此后周期是75，间隔是6，62-66的间隔改成3了；45一直到127,45-66可以吃饭
for i=45:47
    if time(i)-time(i-22)>=85;
        array(i)=array(i-22);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=48:53%4-9吃饭
    if time(i)-time(i-22)>=95;
        array(i)=array(i-22);
    else
        index=index+1;
        array(i)=index;
    end
end
if time(54)-time(32)>=95;%10吃饭
    array(54)=array(32);
else
    index=index+1;
    array(54)=index;
end
for i=55:63%11-19吃饭
    if time(i)-time(i-22)>=95;
        array(i)=array(i-22);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=64:66%1-3吃饭
    if time(i)-time(i-19)>=95;
        array(i)=array(i-19);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=67:82
    if time(i)-time(i-19)>=85;
        array(i)=array(i-19);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=83:101%换班
    if time(i)-time(i-19)>=95;
        array(i)=array(i-19);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=102:127%循环完到16:00了
    if time(i)-time(i-19)>=85;
        array(i)=array(i-19);
    else
        index=index+1;
        array(i)=index;
    end
end
%此后周期是75，间隔是4，128一直到156
array(128:130)=20:22;
for i=131:141
    if time(i)-time(i-22)>=85;
        array(i)=array(i-22);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=142:149
    if time(i)-time(i-22)>=85;
        array(i)=array(i-22);
    else
        index=index+1;
        array(i)=index;
    end
end
array(150:152)=20:22;
for i=153:157
    if time(i)-time(i-22)>=85;
        array(i)=array(i-22);
    else
        index=index+1;
        array(i)=index;
    end
end
%此后周期是70，间隔是8.5，157一直到189,158-176吃完饭
for i=158:164%13-19吃饭
    if time(i)-time(i-22)>=95;
        array(i)=array(i-22);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=165:171%1-7吃饭
    if time(i)-time(i-22)>=95;
        array(i)=array(i-22);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=172:176%8-12吃饭
    if time(i)-time(i-19)>=95;
        array(i)=array(i-19);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=176:192
    if time(i)-time(i-19)>=80;
        array(i)=array(i-19);
    else
        index=index+1;
        array(i)=index;
    end
end
%% 计算每辆车上下午运行时间的评价参数
shangwu=zeros(1,22);
shangwu(20:22)=150;
shangwu(1:19)=time(83:101)-time(1:19);
xiawu=zeros(1,22);
xiawu(20:22)=150;
xiawu(1:7)=time(184:190)-time(102:108);
xiawu(8:19)=time(172:183)-time(109:120);
res=shangwu-xiawu;
res=res.^2;
res=sqrt(sum(res)/16);




