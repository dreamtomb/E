 %%  目标函数：100*(x2-x1^2)^2+(1-x1)^2;
 f=@ (x) 100*(x(2)-x(1)^2)^2+(1-x(1))^2;
 
 [xy,z]=fminunc(f,rand(2,1));
 fprintf('%s%f\n%s%f\n%s%f\n\n\n','极值点的x为：',xy(1),...
    '极值点的y为',xy(2),'极值点的z为',z);

 [xy,z]=fminsearch(f,rand(2,1));
 fprintf('%s%f\n%s%f\n%s%f\n','极值点的x为：',xy(1),...
    '极值点的y为',xy(2),'极值点的z为',z);
