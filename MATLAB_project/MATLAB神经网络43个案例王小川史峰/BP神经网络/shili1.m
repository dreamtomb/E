p0=[11.9850 12.1121 12.2389 12.3626 12.4810 12.5768 12.6743 12.7627 12.8453 12.9227 12.9905 13.0756];  
  
for i =1:7  
    p(:,i)=[p0(i) p0(i+1) p0(i+2)]';  
    t(i)=p0(i+3);  
end  
p  
t  
  
net=newff(minmax(p),[5,1],{'logsig','purelin'},'trainlm'),  
net.trainParam.show = 100,  
net.trainParam.epoch = 2000,  
net.trainParam.goal= 1e-4,  
[net,tr]=train(net,p,t);  
  
ptest(:,1)=[p0(8) p0(9) p0(10)]';  
ptest(:,2)=[p0(9) p0(10) p0(11)]';  
ttest(1)=p0(11);  
ttest(2)=p0(12);  
  
result_test = sim(net,p)  
result_test1 = sim(net,ptest)  
delta = result_test1-ttest  
  
result = [result_test result_test1];  
plot([1997:2005],p0(4:12),'-r*',[1997:2005],result,'-o');