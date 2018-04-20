function z=fit(x,y)
%适应度函数
%x--40组按目标值的大小预分配的适应度
%y--40组自变量向量（y1,y2...y9）
for i=1:40
    if abs(sum(y(i,:))-500)>5
        x(i)=0.001*x(i);
    end
end
z=x;
