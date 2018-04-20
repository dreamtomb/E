function yfit=kyf3(a,x) %这个函数单独存成一个m文件
x=x(:);
yfit=a(1).*x.^2+a(2).*x+a(3);
yfit=yfit';