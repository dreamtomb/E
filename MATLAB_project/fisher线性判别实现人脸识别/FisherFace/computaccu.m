function accuracy=computaccu(testsample,num1,trainsample,num2)
%计算准确率的函数
%输入testsample表示经过投影后的测试样本,num1表示每一类测试样本的个数,
%trainsample代表经过投影后的训练样本,num2代表每一类训练样本的个数
%输出为正确率
accu=0;
testsampnum=size(testsample,1);
trainsampnum=size(trainsample,1);
for i=1:testsampnum
    for j=1:trainsampnum
        juli(j)=norm(testsample(i,:)-trainsample(j,:));
    end
    [temp index]=sort(juli);
    if ceil(i/num1)==ceil(index(1)/num2)
        accu=accu+1;
    end
end
accuracy=accu/testsampnum;
