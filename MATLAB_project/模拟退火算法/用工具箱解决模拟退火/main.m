options=saoptimset('MaxIter',3000,'InitialTemperature',100);
[x,fval]=simulannealbnd(@ras,[0,0],[],[],options);
fprintf('%s%f%f%s%f\n','最优解是：(',x(1),x(2),')对应的函数值为：',fval);