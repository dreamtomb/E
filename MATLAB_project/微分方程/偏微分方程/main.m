m=0;
x=[0 0.005 0.01 0.05 0.1 0.2 0.5 0.7 0.9 0.95 0.99 0.995 1];
t=[0 0.005 0.01 0.05 0.1 0.5 1 1.5 2];
sol=pdepe(m,@ex20_2pdefun,@ex20_2ic,@ex20_2bc,x,t);
u1=sol(:,:,1); %第一个状态之数值解输出
u2=sol(:,:,2); %第二个状态之数值解输出
figure(1)
surf(x,t,u1)
title('u1 之数值解')
xlabel('x')
ylabel('t')
%
figure(2)
surf(x,t,u2)
title('u2 之数值解')
xlabel('x')
ylabel('t')