function yfit=kyf4(a,x) %这个函数单独存成一个m文件
x=x(:);
yfit=a(1).*exp(a(2).*x) + a(3).*exp(a(4).*x);
yfit=yfit';