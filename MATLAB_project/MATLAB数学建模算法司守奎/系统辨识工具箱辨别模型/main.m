%% 辨识得到模型AR(2)
elps=randn(10000,1);
x(1:2)=0;
for i=3:10000
    x(i)=-0.6*x(i-1)-0/2*x(i-2)+elps(i);
end
x=x';
m=ar(x,2);
xhat=forecast(m,x,3);
%% AIC准则定阶的正确性
for i=1:3
    n{i}=ar(x,i);
    myaic(i)=aic(n{i});
end
myaic