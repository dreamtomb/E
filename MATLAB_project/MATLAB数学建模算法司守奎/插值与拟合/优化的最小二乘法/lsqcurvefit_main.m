x0=-10:0.01:10;
y0=normpdf(x0,0,1);
val=@(cs,x0)1/sqrt(2*pi)/cs(2)*exp(-(x0-cs(1)).^2/cs(2)^2/2);
cs=lsqcurvefit(val,rand(2,1),x0,y0);