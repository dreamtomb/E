clear
clc
a=[4.1 3.2 5.0 4.0 3.7 3.5 2.3 2.1];
aa=a;
p=pp(aa);
for i=1:12
    p(:,i)=p(:,i*2-1)+p(:,i*2);
end
p=p(:,1:12);
e=e();
res=e*p';%12*8,12是12个库存，8是八个超市
%% d
x=0:11;
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


