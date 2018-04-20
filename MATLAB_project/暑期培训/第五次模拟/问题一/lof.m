function lof=lof(x,fhn,k)
%求两点间的距离
x=x/10000;
distance=zeros(length(fhn),length(fhn));
for i=1:length(fhn)
    for j=1:length(fhn)
        distance(i,j)=sqrt((x(i)-x(j))^2+(fhn(i)-fhn(j))^2);
    end
end
%求第k距离
distancek=zeros(length(fhn),1);
for i=1:length(fhn)
    temp=sort(distance(i,:));
    distancek(i)=temp(k+1);
end
%求可达距离
reachdistance=zeros(length(fhn),length(fhn));
for i=1:length(fhn)
    for j=1:length(fhn)
        if distance(i,j)<=distancek(i)
            reachdistance(i,j)=distancek(i);
        else
            reachdistance(i,j)=distance(i,j);
        end
    end
end
%求局部可达密度
lrdk=zeros(length(fhn),1);
for i=1:length(fhn)
    index=find(distance(i,:)<distancek(i));
    s=sum(reachdistance(index,i));
    s=s/k;
    lrdk(i)=1/s;
end
%求局部离群因子
lof=zeros(length(fhn),1);
for i=1:length(fhn)
    index=find(distance(i,:)<distancek(i));
    s=sum(lrdk(index));
    s=s/lrdk(i);
    lof(i)=s/k;
end