clear;  
p0=[1258.02 1267.43 1294.54 1298.66 1334.43 1354.66 1392.62 1416.8 1542.83 ...  
    1635.86 1611.7 1660.15 1619.23 1548.22 1595.7 1651.22 1713.81 1708.22...  
    1666.55 1675.05 1597.08 1583.72 1597.37 1614.59 1650.4 1664.58 1694.19...  
    1733.39 1731.1];  
a=max(p0);  
b=min(p0);  
for i=1:29  
    p0(i)=(p0(i)-b)/(a-b);  
end  
for i = 1:22  
    p(:,i)=[p0(i); p0(i+1); p0(i+2); p0(i+3)];  
    t(i) = p0(i+4);  
end  
  
  
net=newff(minmax(p),[12,1],{'logsig','purelin'},'trainlm'),  
net.trainParam.show = 100,  
net.trainParam.epoch = 2000,  
net.trainParam.goal= 1e-4,  
[net,tr]=train(net,p,t);  
  
  
  
ptest(:,1)=[p0(23) p0(24) p0(25) p0(26)]';  
ptest(:,2)=[p0(24) p0(25) p0(26) p0(27)]';  
ptest(:,3)=[p0(25) p0(26) p0(27) p0(28)]';  
ttest(1)=p0(27);  
ttest(2)=p0(28);  
ttest(3)=p0(29);  
result_test = sim(net,p);  
result_test1 = sim(net,ptest)  
delta = result_test1-ttest  
result = [result_test result_test1];  
plot([1:25],p0(5:29),'-r*',[1:25],result,'-o');  