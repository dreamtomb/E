p0 =[123.46, 155.54, 204.38, 290.94, 462.71, 688.19, 988.85, 1342.04, 1773.29, 2431.21, 3330.82, 4792.7, 4556.26, 5695.8, 7019.79, 9712.29, 12028.54];  
  
a=max(p0);  
b=min(p0);  
for i=1:17  
p0(i) = (p0(i)-b)/(a-b);  
end  
%进行归一化  
  
  
for i = 1:11  
    p(:,i)=[p0(i); p0(i+1); p0(i+2); p0(i+3)];  
    t(i) = p0(i+4);  
end  
  
%输入输出的赋值  
net=newff(minmax(p),[8,1],{'logsig','purelin'},'trainlm'),%建立神经网络  
net.trainParam.show = 100,%练显示的间隔  
net.trainParam.epoch = 2000,%最大训练次数  
net.trainParam.goal= 1e-3,%训练的最小均方误差  
[net,tr]=train(net,p,t);  
  
%对神经网络进行训练  
  
ptest(:,1)=[p0(12) p0(13) p0(14) p0(15)]';  
ptest(:,2)=[p0(13) p0(14) p0(15) p0(16)]';  
ttest(1)=p0(16);  
ttest(2)=p0(17);  
%形成预测的数据和理想输出  
  
result_test = sim(net,p)  
result_test1 = sim(net,ptest)  
delta = result_test1-ttest%理想与预期的误差  
  
result = [result_test result_test1];