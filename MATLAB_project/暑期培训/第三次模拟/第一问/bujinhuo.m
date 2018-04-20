function in=bujinhuo(maxe,res,kucun)
border=maxe-100;
in=zeros(1,8);
res=res';
for i=1:8
    for j=1:kucun(i)
        if res(i,j)>border(i)
            in(i)=j-1;%不需要进货的最小库存数
            break;
        end
    end
end