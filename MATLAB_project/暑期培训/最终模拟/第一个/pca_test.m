%% 进行主成分分析
function [p1,per1,p2,per2,p3,per3,p4,per4]=pca_test(num)
%第一类指标进行主成分分析
num1=num(:,1:4);
stdr=std(num1);                %求各变量的标准差；  
[n,m]=size(num1);               %矩阵的行与列  
sddata=num1./stdr(ones(n,1),:);         %标准化变换  
[p1,princ1,egenvalue1]=princomp(sddata);  %调用主成分  
p1=p1(:,1:3);                          %输出前3主成分系数；  
sc1=princ1(:,1:3);                       %前3主成分量；  
egenvalue1;                   %相关系数矩阵的特征值，即各主成分所占比例；  
per1=100*egenvalue1/sum(egenvalue1);       %各个主成分所占百分比；
%第二类指标
num2=num(:,5:9);
stdr=std(num2);                %求各变量的标准差；  
[n,m]=size(num2);               %矩阵的行与列  
sddata=num2./stdr(ones(n,1),:);         %标准化变换  
[p2,princ2,egenvalue2]=princomp(sddata);  %调用主成分  
p2=p2(:,1:3);                          %输出前3主成分系数；  
sc2=princ2(:,1:3);                       %前3主成分量；  
egenvalue2;                  %相关系数矩阵的特征值，即各主成分所占比例；  
per2=100*egenvalue2/sum(egenvalue2);       %各个主成分所占百分比； 
%第三类指标
num3=num(:,10:14);
stdr=std(num3);                %求各变量的标准差；  
[n,m]=size(num3);               %矩阵的行与列  
sddata=num3./stdr(ones(n,1),:);         %标准化变换  
[p3,princ3,egenvalue3]=princomp(sddata);  %调用主成分  
p3=p3(:,1:3);                          %输出前3主成分系数；  
sc3=princ3(:,1:3);                       %前3主成分量；  
egenvalue3;                   %相关系数矩阵的特征值，即各主成分所占比例；  
per3=100*egenvalue3/sum(egenvalue3);       %各个主成分所占百分比；
%第四类指标
num4=num(:,15:18);
stdr=std(num4);                %求各变量的标准差；  
[n,m]=size(num4);               %矩阵的行与列  
sddata=num4./stdr(ones(n,1),:);         %标准化变换  
[p4,princ4,egenvalue4]=princomp(sddata);  %调用主成分  
p4=p4(:,1:3);                          %输出前3主成分系数；  
sc4=princ4(:,1:3);                       %前3主成分量；  
egenvalue4;                   %相关系数矩阵的特征值，即各主成分所占比例；  
per4=100*egenvalue4/sum(egenvalue4);       %各个主成分所占百分比；