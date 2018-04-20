function pop=interthree(pop)
len=size(pop,1);
for i=1:len
    num1=randi(16);
    num2=randi(16);
    num3=randi(16);
    while num1==num2||num2==num3||num3==num1
        num1=randi(16);
        num2=randi(16);
        num3=randi(16);
    end
    ex=pop(i,num1);
    pop(i,num1)=pop(i,num2);
    pop(i,num2)=pop(i,num3);
    pop(i,num3)=ex;
end





