function yfit=kyf1(a,x) %这个函数单独存成一个m文件
x=x(:);
yfit=a(1)+(a(2)-x)/a(2)*a(3).*x;
yfit=yfit';