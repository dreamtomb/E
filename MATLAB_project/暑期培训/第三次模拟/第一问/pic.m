load res.mat
x=0:14;
figure(1);
plot(x,res(:,1));
hold on
plot(x,res(:,2),'r');
plot(x,res(:,3),'b');
plot(x,res(:,4),'m');
plot(x,res(:,5),'y');
plot(x,res(:,6),'c');
plot(x,res(:,7),'g');
plot(x,res(:,8),'k');
legend('超市1','超市2','超市3','超市5','超市6','超市7','超市8','超市9');
title('八个超市库存-利润折线图');
xlabel('库存');
ylabel('利润');
grid on
hold off


