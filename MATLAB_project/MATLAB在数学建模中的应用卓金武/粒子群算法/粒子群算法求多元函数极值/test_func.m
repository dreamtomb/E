function fitness=test_func(individual)
x=individual(:,1);
y=individual(:,2);
for i=1:size(individual,1)
    fitness(i,:)=100*(x(i)-y(i)^2)^2+(y(i)-1)^2;
end