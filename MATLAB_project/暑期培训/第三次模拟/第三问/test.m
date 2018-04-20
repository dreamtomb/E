clear
clc
a=[4.1 3.2 5.0 4.0 3.7 3.5 2.3 2.1];
begin=[6 5 8 6 6 6 4 4];
dis=[0 19.3 15.7 26.2 18.9 8.5 4.2 7.9;
       17.8 0 13.4 11.2 18.0 11.4 16.5 18.7;
       15.6 13.1 0 20.3 5.3 13.6 19.5 10.6;
       26.8 11.4 19.1 0 21.2 18.9 24.0 26.3;
       17.9 16.0 4.7 21.1 0 16.8 20.7 12.6;
       7.8 11.5 13.2 19.7 17.7 0 6.8 8.4;
       4.2 15.1 17.9 24.1 21.5 6.6 0 11.2;
       8.0 17.3 10.4 28.3 13.2 8.5 10.6 0;
        ];
poisswholesale=zeros(8,10);
for i=1:length(a)
    poisswholesale(i,:)=poissrnd(a(i),1,10);
end
half=begin-poisswholesale(:,1)';
half(find(half<0))=0;
%% 然后产生期望为原先泊松分布的1/2，算出后半个周期
%    库存一到十的利润期望，
%aa是期望为原先de1/2
%p是八哥超市后半个周期0-10以及>10的需求的概率
%res是12种库存，8个超市的期望利润
%maxe是八哥超市后半个周期的最大利润期望
%kucun是获得最大利润期望的库存数
% aa=a./2;
aa=a;
p=p(aa);
e=e();
res=e*p';%12*8,12是12个库存，8是八个超市
res=res(1:10,:);%10种库存，8个超市
%% 找到和为剩余产品数的利润的期望
%num是后半个周期剩余的总库存数 
num=floor(sum(half))+1;
max=0;
maxkucun=zeros(1,8);
for h=1:8
    disp(h)
    for i=1:8
        for j=1:8
            for k=1:8
                for l=1:8
                    for m=1:8
                        for n=1:8
                            for o=1:8
                                if h+i+j+k+l+m+n+o==num
                                    money=res(h,1)+res(i,2)+res(j,3)+...
                                        res(k,4)+res(l,5)+res(m,6)+res(n,7)+...
                                        res(o,8);
                                    compare=[h,i,j,k,l,m,n,o];
                                    rtest=half-compare;
                                    %num1是货物被送出的超市数
                                    num1=length(find(rtest<0));
                                    num2=length(find(rtest>0));
                                    if num1>num2%del是转移货物的次数
                                        del=num1;
                                    else
                                        del=num2;
                                    end
                                    money=money-del*100;
                                    if money>max
                                        max=money;
                                        maxkucun=[h,i,j,k,l,m,n,o];
                                    end
                                    step=voger(half,maxkucun,dis);
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
clc
% m1=16883;
% m2=max+money1;
% disp(m2-m1);








