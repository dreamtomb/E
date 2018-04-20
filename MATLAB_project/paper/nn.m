function [output_fore,err_rate] = nn(k,n,attribute,res,train_num,innum,midnum,outnum,xite,ssum)
%参数分别是属性矩阵，分类结果向量，训练数据数目，输入节点，
%中间节点，输出节点，学习率
%% 随机将数据排序
data=attribute;
%% 输入输出数据
input=data;
output1=res;
%把输出从1维变成4维
for i=1:ssum
    switch output1(i)
        case 0
            output(i,:)=[1 0];
        case 1
            output(i,:)=[0 1];
    end
end
%% 随机提取260个样本为训练样本，86个样本为预测样本
input_train=input(n(1:train_num),:)';
output_train=output(n(1:train_num),:)';
input_test=input(n(train_num+1:ssum),:)';
output_test=output(n(train_num+1:ssum),:)';
%% 输入数据归一化
[inputn,inputps]=mapminmax(input_train);
%% 权值初始化
w1=rands(midnum,innum);
b1=rands(midnum,1);
w2=rands(midnum,outnum);
b2=rands(outnum,1);
w2_1=w2;w2_2=w2_1;
w1_1=w1;w1_2=w1_1;
b1_1=b1;b1_2=b1_1;
b2_1=b2;b2_2=b2_1;
%% 网络训练
for ii=1:10
    E(ii)=0;
    for i=1:1:train_num
       %% 网络预测输出 
        x=inputn(:,i);
        % 隐含层输出
        for j=1:1:midnum
            I(j)=inputn(:,i)'*w1(j,:)'+b1(j);
            Iout(j)=1/(1+exp(-I(j)));
        end
        % 输出层输出
        yn=w2'*Iout'+b2;
       %% 权值阀值修正
        %计算误差
        e=output_train(:,i)-yn;     
        E(ii)=E(ii)+sum(abs(e));
        %计算权值变化率
        dw2=e*Iout;
        db2=e';
        for j=1:1:midnum
            S=1/(1+exp(-I(j)));
            FI(j)=S*(1-S);
        end      
        for k=1:1:innum
            for j=1:1:midnum
                dw1(k,j)=FI(j)*x(k)*(e(1)*w2(j,1)+e(2)*w2(j,2));
                db1(j)=FI(j)*(e(1)*w2(j,1)+e(2)*w2(j,2));
            end
        end
        w1=w1_1+xite*dw1';
        b1=b1_1+xite*db1';
        w2=w2_1+xite*dw2';
        b2=b2_1+xite*db2';
        w1_2=w1_1;w1_1=w1;
        w2_2=w2_1;w2_1=w2;
        b1_2=b1_1;b1_1=b1;
        b2_2=b2_1;b2_1=b2;
    end
end
%% 分类
inputn_test=mapminmax('apply',input_test,inputps);
for ii=1:1
    for i=1:(ssum-train_num)
        %隐含层输出
        for j=1:1:midnum
            I(j)=inputn_test(:,i)'*w1(j,:)'+b1(j);
            Iout(j)=1/(1+exp(-I(j)));
        end
        fore(:,i)=w2'*Iout'+b2;
    end
end
%% 结果分析
%根据网络输出找出数据属于哪类
for i=1:(ssum-train_num)
    output_fore(i)=find(fore(:,i)==max(fore(:,i)))-1;
end
%BP网络预测误差
error=output_fore-output1(n(train_num+1:ssum))';
err_num=length(find(error~=0));
err_rate=err_num/(ssum-train_num);
