function pp=pp(a)%八个超市后半周期0-10的需求的概率
pp=zeros(length(a),25);
for i=1:length(a)
    %概率
    sum=0;
    for j=0:24
        pp(i,j+1)=poisspdf(j,a(i));
        sum=sum+pp(i,j+1);
    end
    pp(i,end)=1-sum;
end


