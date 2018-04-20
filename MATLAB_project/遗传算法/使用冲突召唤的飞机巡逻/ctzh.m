function [chrom1 chrom2]=ctzh(a,b,r)
tempa=a(r:end);
tempb=b(r:end);
yuana=a(1:r-1);
yuanb=b(1:r-1);
%% 冲突召唤a
while length(unique(a))~=size(a,2)
    indexmjh=[];
    indexjh=[];
    for i=1:length(tempa);
        if ~isempty(find(yuana==tempa(i),1))
            indexmjh(i)=find(yuana==tempa(i));
        end
    end
    indexmjh=nonzeros(indexmjh)';%冲突基因在没交换基因段的位置
    chongtu=yuana(indexmjh);%冲突的基因
    for i=1:length(chongtu)
        if ~isempty(find(tempa==chongtu(i),1))
            indexjh(i)=find(tempa==chongtu(i));
        end
    end
    indexjh=nonzeros(indexjh)';%冲突基因在交换基因段的位置
    yuana(indexmjh)=tempb(indexjh);
    a=[yuana tempa];
end
%% 冲突召唤b
tempa=a(r:end);
tempb=b(r:end);
yuana=a(1:r-1);
yuanb=b(1:r-1);
while length(unique(b))~=size(b,2)
    indexmjh=[];
    indexjh=[];
    for i=1:length(tempb);
        if ~isempty(find(yuanb==tempb(i),1))
            indexmjh(i)=find(yuanb==tempb(i));
        end
    end
    indexmjh=nonzeros(indexmjh)';%冲突基因在没交换基因段的位置
    chongtu=yuanb(indexmjh);%冲突的基因
    for i=1:length(chongtu)
        if ~isempty(find(tempb==chongtu(i),1))
            indexjh(i)=find(tempb==chongtu(i));
        end
    end
    indexjh=nonzeros(indexjh)';%冲突基因在交换基因段的位置
    yuanb(indexmjh)=tempa(indexjh);
    b=[yuanb tempb];
end
chrom1=a;
chrom2=b;





