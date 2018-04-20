x=[41.5 42 40 42.5 42 42.2 42.7 42.1 41.4];
y=[41.2 41.8 42.4 41.6 41.7 41.3];
yx=[y,x];
yxr=tiedrank(yx);%计算秩
yr=sum(yxr(1:length(y)));
[p,h,s]=ranksum(y,x);%直接进行检验