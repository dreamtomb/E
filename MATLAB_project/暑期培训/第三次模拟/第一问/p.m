function p=p(a)
p=zeros(length(a),22);
for i=1:length(a)
    %¸ÅÂÊ
    sum=0;
    for j=0:20
        p(i,j+1)=poisspdf(j,a(i));
        sum=sum+p(i,j+1);
    end
    p(i,end)=1-sum;
end


