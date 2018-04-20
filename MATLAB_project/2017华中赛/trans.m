load('matrix.mat');
res=zeros(193,3);
res(1,1)=777;
res(1,2)=888;
res(1,3)=999;
index=2;
for i=1:36
    for j=1:36
        if L(i,j)~=0
            res(index,1)=i;
            res(index,2)=j;
            res(index,3)=L(i,j);
            index=index+1;
        end
    end
end
res