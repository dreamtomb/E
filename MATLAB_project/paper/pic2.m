x=zeros(1,10);
y=x;
x=1:10;
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

tree_num=80;
% attri_num=4;
for attri_num=1:1:10
[res3,rf_err_rate]=rf(n,attribute,res,train_num,tree_num,ssum,attri_num);
disp(['the error rate of Random forest algorithm £º',num2str(rf_err_rate*100),'%']);
y(attri_num)=y(attri_num)+rf_err_rate;
end
end
y=y./10;
plot(x,y);
xlabel('Number of attributes');
ylabel('Error rate(%)');
title('The relationship between the number of attributes and the error rate');
