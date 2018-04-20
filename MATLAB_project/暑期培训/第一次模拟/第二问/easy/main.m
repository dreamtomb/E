close;
clear;
clc;
%% 2015
num15=xlsread('2015');%14*9
maxval=zeros(14,1);
for i=1:14
    maxval(i)=max(num15(i,:));
end
minval=zeros(14,1);
for i=1:14
    minval(i)=min(num15(i,:));
end
res=zeros(14,9);
for i=1:9
    res(:,i)=(num15(:,i)-minval)./(maxval-minval);
end
res=1-res;
for i=1:9
    figure(i)
    x=1:14;
    y=res(:,i);
    y=y';
    bar(x,y);
    xlabel('城市');
    ylabel('急需发展程度');
    switch(i)
        case 1
            title('武汉市指标待发展程度直方图');
        case 2
            title('黄冈市指标待发展程度直方图');
        case 3
            title('黄石市指标待发展程度直方图');
        case 4
            title('鄂州市指标待发展程度直方图');
        case 5
            title('孝感市指标待发展程度直方图');
        case 6
            title('咸宁市指标待发展程度直方图');
        case 7
            title('仙桃市指标待发展程度直方图');
        case 8
            title('天门市指标待发展程度直方图');
        case 9
            title('潜江市指标待发展程度直方图');
    end;
    set(gca,'XTickLabel',{'年生产总值';'人均GDP';'规模以上工业总产值';...
    '全市财政收入';...
    '社会固定资产投资';'社会消费品零售总额';'进出口总额';...
    '公共预算总收入';...
    '城镇人均可支配收入';'农村人均可支配收入';...
    '卫生医疗机构（个）';'第一产业占比';...
    '第二产业占比';'第三产业占比'});
end

