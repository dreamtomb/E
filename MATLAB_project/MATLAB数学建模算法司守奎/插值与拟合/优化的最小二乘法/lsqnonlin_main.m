x0=-10:0.01:10;
y0=normpdf(x0,0,1);
val=@(cs)1/sqrt(2*pi)/cs(2)*exp(-(x0-cs(1)).^2/cs(2)^2/2)-y0;
cs0=rand(2,1);
cs=lsqnonlin(val,cs0);