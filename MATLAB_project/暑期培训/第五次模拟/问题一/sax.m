function jiangweifhn=sax(x,fhn)
w=10;
%数据标准化
fhn=zscore(fhn);
%paa
n=length(fhn);
figure
plot(x,fhn,'LineWidth',2);
hold on;
meanlen=round(n/w);
len=[repmat(meanlen,1,w-1) n-meanlen*(w-1)];
llen=len;
for i=w:-1:1
    len(i)=sum(len(1:i));
end
len=[0 len];
for i=2:w+1
    m(i-1)=mean(fhn(len(i-1)+1:len(i)));
end
jiangweifhn=[repmat(m(1),1,llen(1)) repmat(m(2),1,llen(2)) repmat(m(3),1,llen(3))...
    repmat(m(4),1,llen(4)) repmat(m(5),1,llen(5)) repmat(m(6),1,llen(6))...
    repmat(m(7),1,llen(7)) repmat(m(8),1,llen(8)) repmat(m(9),1,llen(9)) repmat(m(10),1,llen(10))];
plot(x,jiangweifhn,'LineWidth',2);
fengedian=[-0.84 -0.25 0.25 0.84];
for i=1:w
    if m(i)<=-0.84
        plot(x(1)+len(i):x(1)+len(i+1)-1,jiangweifhn(len(i)+1:len(i+1)),'r','LineWidth',3);
        text(x(1)+(len(i)+len(i+1))/2,jiangweifhn((len(i)+1))-0.3,'a','FontSize',18);
    elseif m(i)>-0.84&m(i)<=-0.25
        plot(x(1)+len(i):x(1)+len(i+1)-1,jiangweifhn(len(i)+1:len(i+1)),'g','LineWidth',3);
        text(x(1)+(len(i)+len(i+1))/2,jiangweifhn((len(i)+1))-0.3,'b','FontSize',18);
    elseif m(i)>-0.25&m(i)<=0.25
        plot(x(1)+len(i):x(1)+len(i+1)-1,jiangweifhn(len(i)+1:len(i+1)),'b','LineWidth',3);
        text(x(1)+(len(i)+len(i+1))/2,jiangweifhn((len(i)+1))-0.3,'c','FontSize',18);
    elseif m(i)>0.25&m(i)<=0.84
        plot(x(1)+len(i):x(1)+len(i+1)-1,jiangweifhn(len(i)+1:len(i+1)),'y','LineWidth',3);
        text(x(1)+(len(i)+len(i+1))/2,jiangweifhn((len(i)+1))-0.3,'d','FontSize',18);
    else
        plot(x(1)+len(i):x(1)+len(i+1)-1,jiangweifhn(len(i)+1:len(i+1)),'k','LineWidth',3);
        text(x(1)+(len(i)+len(i+1))/2,jiangweifhn((len(i)+1))-0.3,'e','FontSize',18);
    end
end













