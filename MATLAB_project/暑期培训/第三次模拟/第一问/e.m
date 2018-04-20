function e=e()
e=zeros(30,22);%三十中库存，20种需求
for i=0:size(e,1)-1%i是库存
    for j=0:size(e,2)-1%j是需求
        if i>=j
            e(i+1,j+1)=j*700-(i-j)*100;
        else
            e(i+1,j+1)=i*700;
        end
    end
end



