%% 求单源最短路径的Dijkstra算法的Matlab程序
function [d index1 index2]=Dijkf(a)
M=max(max(a));
pb(1:length(a))=0;
pb(1)=1;
index1=1;
index2=ones(1,length(a));
d(1:length(a))=M;d(1)=0;temp=1;
while sum(pb)<length(a)
    tb=find(pb==0);
    d(tb)=min(d(tb),d(temp)+a(temp,tb));
    tmpb=find(d(tb)==min(d(tb)));
    temp=tb(tmpb(1));
    pb(temp)=1;
    index1=[index1,temp];
    index=index1(find(d(index1)==d(temp)-a(temp,index1)));
    if length(index)>=2
        index=index(1);
    end
    index2(temp)=index;
end
d;
index1;
index2;
