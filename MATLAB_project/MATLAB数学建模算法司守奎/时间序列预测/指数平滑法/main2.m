%% 二次指数平滑法
yt=load('fadian.txt');
n=length(yt);
alpha=0.3;
st1=yt(1);
st2=yt(1);
for i=2:n
    st1(i)=alpha*yt(i)+(1-alpha)*st1(i-1);
    st2(i)=alpha*st1(i)+(1-alpha)*st2(i-1);
end
at=2*st1-st2;
bt=alpha/(1-alpha)*(st1-st2);
yhat=at+bt;