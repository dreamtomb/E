%% Ä£ÐÍARMA(p,q)
randn('state',sum(clock));
elps=randn(1,10000);
x(1)=0;
for j=2:10000
    x(j)=0.8*x(j-1)+elps(j)-0.4*elps(j-1);
end
x=x';
for i=0:3
    for j=0:3
        if i==0&j==0
            continue;
        end
        m=armax(x,[i,j]);
        myaic=aic(m);
        fprintf('p=%d,q=%d,AIC=%f\n',i,j,myaic);
    end
end
