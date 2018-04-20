function [sample,label]=readsample(address,ClassNum,data,rows,cols,image_fmt)
%这个函数用来读取样本。
%输入：
%address：要读取的样本的路径
%ClassNum：代表要读入样本的类别数
%data：数据
%rows：样本行数
%cols：样本列数
%image_fmt：图片格式

%输出：
%sample：样本矩阵，每行为一个样本，每列为一个特征
%label：标签向量

ImageSize=rows*cols;
sample_tol=ClassNum*length(data);%读入的样本总数
sample=zeros(sample_tol,ImageSize);
label=zeros(1,sample_tol);
m=1;
for i=1:ClassNum
    for j=data
        a=imread(strcat(address,num2str(i),'_',num2str(j),image_fmt));
        a=imresize(a,[rows cols]);
        b=double(reshape(a,1,ImageSize));
        sample(m,:)=b;
        label(m)=i;
        m=m+1;
    end
end