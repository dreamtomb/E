x=zeros(1,20);
y=x;
for i=1:10
    index=randperm(346,100);
index=[index index.*2 index.*3];
index=unique(index);
n=zeros(1,ssum-length(index));
temp=1;
for i=1:ssum
    if ismember(i,index)
    else
        n(temp)=i;
        temp=temp+1;
    end
end
n=[n index];
train_num=ssum-length(index);

for tree_num=10:10:200
attri_num=4;
[res3,rf_err_rate]=rf(n,attribute,res,train_num,tree_num,ssum,attri_num);
disp(['the error rate of Random forest algorithm £º',num2str(rf_err_rate*100),'%']);
x(tree_num/10)=tree_num;
y(tree_num/10)=y(tree_num/10)+rf_err_rate;
end
end
plot(x,y);
xlabel('Number of random forest decision trees');
ylabel('Error rate(%)');
title('The relationship between the number of random forest decision trees and the error rate');