load matlab.mat
%取前面的122个作为初始种群，每16个一个个体
pop=zeros(7,16);
pop(1,:)=array(1:16);
pop(2,:)=array(17:32);
pop(3,:)=array(33:48);
pop(4,:)=array(49:64);
pop(5,:)=array(65:80);
pop(6,:)=array(81:96);
pop(7,:)=array(97:112);
maxgen=10;
chrom=zeros(maxgen,112);
for i=1:maxgen
    disp(i);
    %三交换
    pop=interthree(pop);
    disp('交换完成');
    %交叉(运用冲突召唤方法解决数字重复的问题)
    pop=recombin(pop,0.7);
    for j=1:7
        chrom(i,j*16-15:j*16)=pop(j,:);
    end
end
%成功产生了十组新的解，大致判断可行与否,
% 可行的接受，不可行的概率接受，得到的结果再修改main*函数判断
res=zeros(10,112);
for i=1:10
    for j=1:16
        a=find(chrom(i,:)==j);
        da=diff(a);
        if isempty(find(da<12))~=1
            if rand()>0.2
                if j==16
                    res(i,:)=chrom(i,:);
                else
                end
            else
                break;
            end
        else
            if j==16
                res(i,:)=chrom(i,:);
            else
            end
        end
    end
end
%基本上是3~4次产生一个新的可行解，再人工判断即可









