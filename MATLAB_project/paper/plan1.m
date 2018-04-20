function rate= plan1( n,res,res1,res2,res3,train_num,sum )
res3=res3-1;
solution=[res1,res2,res3];
last=zeros(size(solution,1),1);
for i=1:size(solution,1)
    num=length(find(solution(i,:)==1));
    if num>=2
        last(i)=1;
    else
        last(i)=0;
    end
end
lastres=res(n(train_num+1:sum),:);
%last是算出的结果，lastres是标准的结果
rate=1-length(find(last==lastres))/length(last);
end

