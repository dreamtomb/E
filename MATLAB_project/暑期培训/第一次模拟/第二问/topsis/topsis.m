%% 利用topsis寻找建议的依据
function c=topsis(num15)
num15(2,:)=num15(2,:)/10;
num15(4,:)=num15(4,:)*10;
num15(7,:)=num15(7,:)*100;
num15(8,:)=num15(8,:)*100;
num15(9,:)=num15(9,:)/10;
num15(10,:)=num15(10,:)/10;
num15(12,:)=1./num15(12,:)*100;
num15(13,:)=num15(13,:)*1000;
num15(14,:)=num15(14,:)*1000;
zh=zeros(14,1);
for i=1:14
    for j=1:9
        zh(i)=zh(i)+num15(i,j)^2;
    end
end
for i=1:14
    for j=1:9
        num15(i,j)=num15(i,j)/sqrt(zh(i));
    end
end
maxval=zeros(14,1);
for i=1:14
    maxval(i)=max(num15(i,:));
end
minval=zeros(14,1);
for i=1:14
    minval(i)=min(num15(i,:));
end
dismax=zeros(9,1);
dismin=zeros(9,1);
for j=1:9
    for i=1:14
        dismax(j)=dismax(j)+(num15(i,j)-maxval(i))^2;
    end
    dismax(j)=sqrt(dismax(j));
end
for j=1:9
    for i=1:14
        dismin(j)=dismin(j)+(num15(i,j)-minval(i))^2;
    end
    dismin(j)=sqrt(dismin(j));
end
c=zeros(9,1);
for i=1:9
    c(i)=dismin(i)/(dismax(i)+dismin(i));
end







