function yfit=kyf(a,x) %这个函数单独存成一个m文件
x=x(:);
yfit=a(1)*exp(-((x-a(2))/a(3)).^2)+a(4)*exp(-((x-a(5))/a(6)).^2);
yfit=yfit';