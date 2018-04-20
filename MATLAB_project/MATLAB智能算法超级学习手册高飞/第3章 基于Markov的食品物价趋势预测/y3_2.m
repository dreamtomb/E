%z1、z2、z3、z4、z5、z6为分类后的各食品的物价；且在workElace中载入
%z11、z22、z33、z44、z55、z66为分类的各食品的相邻价格差值；且在workElace中载入
%z111、z222、z333、z444、z555、z666为各种食品的相邻时间价格的增长率；且在workElace中载入
 
%第一类食品的增长率图
for i=1:39
       x2(i)=i;
end
for i=1:38
   for j=1:4
z111(i,j)=z11(i,j)/z1(i,j);
end
end
for i=1:4
    subplot(2,2,i);
    plot(x1,z111(:,i),x2,0.03*ones(1,39),'r--',x2,-0.03*ones(1,39),'r--',x2,0.05*ones(1,39),'r--',x2,-0.05*ones(1,39),'r--');hold on
end


%第二类食品的增长率图
>> for i=1:38
   for j=1:8
z222 (i,j)=z22(i,j)/z2(i,j);
end
end
for i=1:8
subplot(3,3,i);
plot(x1,z222(:,i),x2,0.03*ones(1,39),'r--',x2,-0.03*ones(1,39),'r--',x2,0.05*ones(1,39) ,'r--',x2,-0.05*ones(1,39) ,'r--');
hold on
end
>>
%第三类食品的增长率图
>> for i=1:38
   for j=1:3
z333 (i,j)=z33(i,j)/z3(i,j);
end
end
for i=1:3
subplot(1,3,i);
plot(x1,z333(:,i),x2,0.03*ones(1,39),'r--',x2,-0.03*ones(1,39),'r--',x2,0.05*ones(1,39),'r--',x2,-0.05*ones(1,39),'r--');hold on
end
>>
%第四类食品的增长率图
>> for i=1:38
   for j=1:15
z444 (i,j)=z44(i,j)/z4(i,j);
end
end
for i=1:15
subplot(4,4,i);
plot(x1,z444(:,i) ,x2,0.03*ones(1,39),'r--',x2,-0.03*ones(1,39),'r--',x2,0.05*ones(1,39) ,'r--',x2,-0.05*ones(1,39) ,'r--');hold on
end
>>
%第五类食品的增长率图
>> for i=1:38
   for j=1:4
z555 (i,j)=z55(i,j)/z5(i,j);
end
end
for i=1:4
subplot(2,2,i);
plot(x1,z555(:,i),x2,0.03*ones(1,39),'r--',x2,-0.03*ones(1,39),'r--',x2,0.05*ones(1,39),'r--',x2,-0.05*ones(1,39),'r--');hold on
end
>>
%第六类食品的增长率图
>> for i=1:38
   for j=1:7
z666(i,j)=z66 (i,j)/z6(i,j);
end
end
for i=1:7
subplot(2,4,i);
plot(x1,z666(:,i),x2,0.03*ones(1,39),'r--',x2,-0.03*ones(1,39),'r--',x2,0.05*ones(1,39),'r--',x2,-0.05*ones(1,39),'r--');
hold on
end
>>
%第七类食品的增长率图
>> for i=1:38
   for j=1
z777(i,j)=z77 (i,j)/z7(i,j);
end
end
for i=1
plot(x1,z777(:,i) ,x2,0.03*ones(1,39),'r--',x2,-0.03*ones(1,39),'r--',x2,0.05*ones(1,39),'r--',x2,-0.05*ones(1,39) ,'r--');hold on
end
>>
