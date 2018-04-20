function MST=normal_kruskal(G)
%G为邻接矩阵，格式和之前的全都一样
%MST输出的是对称的最小生成树，因此只看一半就好
%a =[Inf    50    60   Inf   Inf   Inf   Inf
%       50   Inf   Inf    65    40   Inf   Inf
%       60   Inf   Inf    52   Inf   Inf    45
%       Inf    65    52   Inf    50    30    42
%       Inf    40   Inf    50   Inf    70   Inf
%       Inf   Inf   Inf    30    70   Inf   Inf
%       Inf   Inf    45    42   Inf   Inf   Inf]
n=length(G);
T=zeros(n); %最小生成树的加权邻接矩阵 
GG=G;
   for i=1:n 
      for j=1:n
         if G(i,j)==inf  GG(i,j)=0; 
         end
      end
   end
m=((nnz(GG))/2);  %图的边线的数目
j=0; %最小生成树的边线的数目
%主要步骤
for i=1:m %被选择边线的数目
   if j<(n-1) %算法的终止条件是 |E|=|V|-1.
%步骤0: 挑选出权值最小的边 G(a,b)
      min=inf; a=0; b=0;     
      for k=1:n
         for l=(k+1):n
            if G(k,l)<=min  min=G(k,l); a=k; b=l; end 
         end
      end
%步骤0 结束
%步骤1
%T=T+e(a,b)
      T(a,b)=G(a,b); T(b,a)=G(a,b); 
%检查是否有环的出现 
      f=0; %没有环的出现
      P=zeros(2,m);  y=0; 
      for i=1:n
         for v=(i+1):n
            if T(i,v)~=0    y=y+1; P(1,y)=i; P(2,y)=v;  
            end
         end
      end
      for y=1:m
         if P(1,y)<P(2,y)
            for l=(y+1):m
               if P(1,l)==P(2,y)  P(1,l)=P(1,y);
               elseif P(2,l)==P(2,y)  P(2,l)=P(1,y);
               end
            end
            P(2,y)=P(1,y); 
         elseif P(2,y)<P(1,y)
            for l=(y+1):m
               if P(1,l)==P(1,y)  P(1,l)=P(2,y);
               elseif P(2,l)==P(1,y)  P(2,l)=P(2,y);
               end
            end
            P(1,y)=P(2,y);
         elseif (P(1,y)+P(2,y))~=0   f=1; %出现一个环
            break 
         end
      end
      if f==1   T(a,b)=0; T(b,a)=0; %转到 步骤2
      else j=j+1; %转到 步骤3
      end
      G(a,b)=inf;
   else %如果条件|E|=|V|-1成立
      MST=T;
      disp('这个图的最小生成树的加权邻接矩阵是:') 
      break
     end  
   end
if j<(n-1) %如果条件|E|<|V|-1成立
   disp('这个图没有最小生成树.')  
end
