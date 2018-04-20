close;
clear;
clc;
p1=[1.24,1.27;1.36,1.74;1.38,1.64;1.38,1.82;1.38,1.90;
    1.40,1.70;1.48,1.82;1.54,1.82;1.56,2.08];
p2=[1.14,1.82;1.18,1.96;1.20,1.86;1.26,2.00
    1.28,2.00;1.30,1.96];
P=[p1;p2];%样本
T=[ones(length(p1),1);2*ones(length(p2),1)];%分类
N=length(T);
temp=randperm(N);
index=floor(2/3*N);
input_train=P(temp(1:index-1),:)';
output_train=T(temp(1:index-1),:)';
input_test=P(temp(index:end),:)';
output_test=T(temp(index:end),:)';
%% 
Tc_train = ind2vec(output_train);
% 创建网络
net_pnn = newpnn(input_train,Tc_train);
% 仿真测试
Tc_test = ind2vec(output_test)
t_sim_pnn = sim(net_pnn,input_test);
T_sim_pnn = vec2ind(t_sim_pnn)
%进行分类
x=[1.24 1.80;1.28 1.84;1.40 2.04]';
result=sim(net_pnn,x);
T_sim_pnn = vec2ind(result);
plot(p1(:, 1),p1(:,2),'ro');
hold on
plot(p2(:,1),p2(:,2),'b*');
plot(x(:,1),x(:,2),'k^');






