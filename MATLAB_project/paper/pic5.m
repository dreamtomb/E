x=1:10;
y=zeros(1,10);
for ii=1:10
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

tree_num=80;
attri_num=4;
[res3,rf_err_rate]=rf(n,attribute,res,train_num,tree_num,ssum,attri_num);
disp(['the error rate of Random forest algorithm £º',num2str(rf_err_rate*100),'%']);

y(ii)=rf_err_rate;
end
plot(x,y);
xlabel('Times of run');
ylabel('Error rate');
title('The relationship between the numbers of run and the error rate(Random Forest)');
