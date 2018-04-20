%% 一次指数平滑法
yt=load('dianqi.txt');
n=length(yt);
alpha=[0.2 0.5 0.8];%不同的alpha值做对比
m=length(alpha);
yhat(1,1:m)=(yt(1)+yt(2))/2;%前两期数据的平均值作为初始值
for i=2:n
    yhat(i,:)=alpha*yt(i-1)+(1-alpha).*yhat(i-1,:);
end
error=sqrt(mean((repmat(yt,1,m)-yhat).^2));
yhat1998=alpha*yt(n)+(1-alpha).*yhat(n,:);


