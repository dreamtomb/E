function fitness=test_func(individual)
%% 计算粒子的适应度
%individual    粒子个体
%fitness    适应度值
x=individual(:,1);
y=individual(:,2);
for i=1:size(individual,1)
    fitness(i,:)=0.5*(x(i)-3)^2+0.2*(y(i)-5)^2-0.1;
end