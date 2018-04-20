function [output_fore,err_rate] = pnn(n,attribute,res,train_num,ssum)
%% 输入输出数据
res=res+1;%过程中不可以有0存在，要记得结束后回归
input=attribute;
output=res;
P_train=input(n(1:train_num),:)';
T_train=output(n(1:train_num),:)';
P_test=input(n(train_num+1:ssum),:)';
T_test=output(n(train_num+1:ssum),:)';
%% 模型建立 
result_pnn = [];
time_pnn = [];
for i = 1:20
    for j = i:20
        p_train = P_train(i:j,:);
        p_test = P_test(i:j,:);
       %% PNN创建及仿真测试
        t = cputime;
        Tc_train = ind2vec(T_train);
        % 创建网络
        net_pnn = newpnn(p_train,Tc_train);
        % 仿真测试
        Tc_test = ind2vec(T_test);
        t_sim_pnn = sim(net_pnn,p_test);
        T_sim_pnn = vec2ind(t_sim_pnn);
        t = cputime - t;
        time_pnn = [time_pnn t];
        result_pnn = [result_pnn T_sim_pnn'];
    end
end

%% 性能评价

% 正确率accuracy
accuracy_pnn = [];
time = [];
for i = 1:size(result_pnn,2)
    accuracy_2 = length(find(result_pnn(:,i) == T_test'))/length(T_test);
    accuracy_pnn = [accuracy_pnn accuracy_2];
end
%% 绘图
figure(1)
plot(1:ssum-train_num,T_test,'bo',1:ssum-train_num,result_pnn(:,20),'r*')
grid on
xlabel('测试集样本编号')
ylabel('测试集样本类别')
string = {'测试集预测结果';['正确率:' num2str(accuracy_pnn(20)*100) '%(PNN)']};
title(string)
legend('真实值','PNN预测值')
output_fore=result_pnn(:,20);
err_rate=1-accuracy_pnn(20);
