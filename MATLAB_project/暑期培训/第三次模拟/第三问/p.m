function p=p(a)%八个超市0-10的需求的概率
p=zeros(length(a),12);
for i=1:length(a)
    %概率
    sum=0;
    for j=0:11
        p(i,j+1)=poisspdf(j,a(i));
        sum=sum+p(i,j+1);
    end
    p(i,end)=1-sum;
end


