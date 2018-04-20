y =[6     4     6     0     6     3     6     0     6     3;
    5     1     5     3     5     3     5     3     5     0;
    8     4     8     3     8     3     8     1     8     4;
    6     3     6     2     6     0     6     0     6     0;
    6     4     6     2     6     3     6     4     6     3;
    6     5     6     3     6     4     6     6     6     2;
    4     3     4     3     4     2     4     4     4     0;
    4     0     4     0     4     4     4     4     4     1];
out=zeros(8,5);
for i=1:5
    out(:,i)=y(:,2*i-1)-y(:,2*i);
end
outnum=sum(out');
outmoney=out*700;
outmoney=outmoney-100;
outmoney(6:8,4)=0;
outmoney(8,3)=0;
for i=1:5
    outmoney(:,i)=outmoney(:,i)-y(:,2*i)*100;
end
he=sum(outmoney);