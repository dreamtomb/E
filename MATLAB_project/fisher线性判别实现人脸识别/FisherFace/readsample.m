function sample=readsample(address,classnum,num)
%这个函数用来读取样本。
%输入：address就是要读取的样本的地址,classnum代表要读入样本的类别,num是每类的样本；
%输出为样本矩阵
allsamples=[];
image=imread([pwd '\ORL\s1_1.bmp']);%读入第一幅图像
[rows cols]=size(image);%获得图像的行数和列数
for i=classnum
    for j=num
        a=imread(strcat(address,num2str(i),'_',num2str(j),'.bmp'));
        b=a(1:rows*cols);
        b=double(b);
        allsamples=[allsamples;b];
    end
end
sample=allsamples;