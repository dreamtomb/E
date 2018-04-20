clear all
clc
close all
start=clock;
sample_class=1:40;%样本类别
sample_classnum=size(sample_class,2);%样本类别数
fprintf('程序运行开始....................\n\n');

for train_samplesize=3:8;
    train=1:train_samplesize;%每类训练样本
    test=train_samplesize+1:10;%每类测试样本
    
    train_num=size(train,2);%每类训练样本数
    test_num=size(test,2);%每类测试样本数
    
    address=[pwd '\ORL\s'];
    %读取训练样本
    allsamples=readsample(address,sample_class,train);
    
    %先使用PCA进行降维
    [newsample base]=pca(allsamples,0.9);
    %计算Sw,Sb
    [sw sb]=computswb(newsample,sample_classnum,train_num);
    
    %读取测试样本
    testsample=readsample(address,sample_class,test);
    best_acc=0;%最优识别率
    %寻找最佳投影维数
    for temp_dimension=1:1:length(sw)
        vsort1=projectto(sw,sb,temp_dimension);
        
        %训练样本和测试样本分别投影
        tstsample=testsample*base*vsort1;
        trainsample=newsample*vsort1;
        %计算识别率
        accuracy=computaccu(tstsample,test_num,trainsample,train_num);
        if accuracy>best_acc
            best_dimension=temp_dimension;%保存最佳投影维数
            best_acc=accuracy;
        end
    end
    %---------------------------------输出显示----------------------------------
    fprintf('每类训练样本数为：%d\n',train_samplesize);
    fprintf('最佳投影维数为：%d\n',best_dimension);
    fprintf('FisherFace的识别率为：%.2f%%\n',best_acc*100);
    fprintf('程序运行时间为：%3.2fs\n\n',etime(clock,start));
end
fprintf('程序运行结束....................\n\n');