kucun=[6 5 8 6 6 6 4 4];
in=[5 4 6 5 5 5 3 3];
a=[4.1 3.2 5.0 4.0 3.7 3.5 2.3 2.1];
color=[' ' 'r' 'b' 'g' 'k' 'y' 'm' 'c'];
y=zeros(8,50);
de=zeros(8,25);
for i=1:8
    de(i,:)=poissrnd(a(i),1,25);
end
y(:,1)=kucun';
flag=1;
for i=2:50
    if flag==1
        y(:,i)=y(:,i-1)-de(:,i/2);
        flag=2;
    else
        for j=1:8
            if y(j,i)<in(j)
                y(j,i)=kucun(j);
            else
                y(j,i)=y(j,i-1);
            end
        end
        flag=1;
    end
end
y(find(y<0))=0;
for i=1:8
    subplot(4,2,i);
    plot(1:50,y(i,:),color(i));
    xlabel('x');
    ylabel('y');
    if i<4
        title(['³¬ÊÐ',num2str(i)]);
    else 
        title(['³¬ÊÐ',num2str(i+1)]);
    end
    axis([0 50 0 10]);
end
        









