clear
clc
a=[1 1.24 1.27;
     1 1.36 1.74;
     1 1.38 1.64;
     1 1.38 1.82;
     1 1.38 1.90;
     1 1.40 1.70;
     1 1.48 4.82;
     1 1.54 1.82;
     1 1.56 2.08;
     2 1.14 1.82;
     2 1.18 1.96;
     2 1.20 1.86;
     2 1.26 2.00;
     2 1.28 2.00;
     2 1.30 1.63;
     0 1.24 1.80;
     0 1.28 1.84;
     0 1.40 2.04];
 
 traindata=a(1:15,2:end);
 traindata=traindata';
 trainres=a(1:15,1);
 testdata=a(16:18,2:end);
 testdata=testdata';
 
 [train,ps]=mapstd(traindata);
 test=mapstd(testdata,ps);
 
 s=svmtrain(train',trainres,'Method','SMO','Kernel_Function','quadratic');
 sv_index=s.SupportVectorIndices;
 sv_Alpha=s.Alpha;
 sv_Bias=s.Bias;
 mean_and_std_trains=s.ScaleData;
 
 check=svmclassify(s,train');
 err_rate=sum(check~=trainres)/length(trainres);
 
 solution=svmclassify(s,test');
 