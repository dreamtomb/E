function val=hor(x)
%% 这是秦九韶算法的源程序
%函数形式为:val=hor(x)
%val为所得结果
%x为自变量的值

%% 算法实现
len=input('请输入多项式的最高项次数：');
p=zeros(1,len+1);%p存放系数
fprintf('%s\n','请按次数由低到高输入项的系数：');
for i=1:len+1
    p(i)=input('');
end
fprintf('%s','P=')
for i=1:len+1
    if i~=len+1
        fprintf('%s%f%s%f%s','(',p(i),')x^',i-1,'+')
    else
        fprintf('%s%f%s%f\n','(',p(i),')x^',i-1)
    end
end
index=find(p~=0);
index=sort(index,'descend');%系数不为0的项的下标
X=index-1;%系数不为0的项的次数
times=length(index)-1;%提出几个x^i
xi=p(index(1));
ci=X(1);
for ii=1:times
    ci=min(ci,X(ii+1));%合并的两项中次数较小的
    xi=xi*x^(X(ii)-ci)+p(index(ii+1));%两项的系数和
end
val=xi*x^(ci);
fprintf('%s%f%s%f\n','多项式在x=',x,'处的值为',val);