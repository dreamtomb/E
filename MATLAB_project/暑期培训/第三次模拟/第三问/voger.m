function step=voger(half,maxkucun,dis)
%% 路径最短
test=half-maxkucun;
outindex=find(test<0);%调运出去
inindex=find(test>0);%调运进来
dis=dis(:,outindex);
[temp,tempindex]=sort(dis);
d=temp(3,:)-temp(2,:);
[num,index]=sort(d,'descend');
firstenduse=outindex(index);%伏格尔法得到的用于填补的先后顺序
outnum=test(firstenduse);
innum=test(inindex);
i=1;j=1;
step=0;
while i<=length(outnum)&&j<=length(innum)
    if outnum(i)<innum(j)
        innum(j)=innum(j)+outnum(i);
        i=i+1;
    elseif outnum(i)==innum(j)
        i=i+1;
        j=j+1;
    else
        outnum(i)=outnum(i)+innum(j);
        j=j+1;
    end
    step=step+1;
end