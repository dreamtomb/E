a=load('cancerdata2.txt');
a(:,1)=[];

gind=find(a(:,1)==1);
bind=find(a(:,1)==-1);

traindata=a(1:500,2:end);
traindata=traindata';
trainres=a(1:500,1);
testdata=a(501:569,2:end);
testdata=testdata';

[train,ps]=mapstd(traindata);
test=mapstd('apply',testdata,ps);

s=svmtrain(train',trainres,'Method','SMO','Kernel_Function','quadratic');
sv_index=s.SupportVectorIndices;
sv_Alpha=s.Alpha;
sv_Bias=s.Bias;
mean_and_std_trains=s.ScaleData;
check=svmclassify(s,train');
err_rate=1-sum(check==trainres)/length(trainres);

solution=svmclassify(s,test');
gind=find(solution==1);
bind=find(solution==-1);

