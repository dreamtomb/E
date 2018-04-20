%% ÇóHuffmanÊ÷µÄMatlab³ÌÐò
function [h,l]=huffman(p)  
if (length(find(p<0))~=0)  
   error('Not a prob,negative component');  
end  
if (abs(sum(p)-1)>10e-10)  
   error('Not a prob.vector,component do not add to 1')  
end  
n=length(p);  
q=p;  
m=zeros(n-1,n);  
for i=1:n-1  
   [q,l]=sort(q);  
   m(i,:)=[l(1:n-i+1),zeros(1,i-1)];  
   q=[q(1)+q(2),q(3:n),1];  
end  
for i=1:n-1  
   c(i,:)=blanks(n*n);  
end  
c(n-1,n)='0';  
c(n-1,2*n)='1';  
for i=2:n-1  
   c(n-i,1:n-1)=c(n-i+1,n*(find(m(n-i+1,:)==1))...  
                -(n-2):n*(find(m(n-i+1,:)==1)));  
   c(n-i,n)='0';  
   c(n-i,n+1:2*n-1)=c(n-i,1:n-1);  
   c(n-i,2*n)='1';  
   for j=1:i-1  
      c(n-i,(j+1)*n+1:(j+2)*n)=c(n-i+1,...  
         n*(find(m(n-i+1,:)==j+1)-1)+1:n*find(m(n-i+1,:)==j+1));  
   end  
end   
 
   for i=1:n  
      h(i,1:n)=c(1,n*(find(m(1,:)==i)-1)+1:find(m(1,:)==i)*n);  
      ll(i)=length(find(abs(h(i,:))~=32));  
   end  
   l=sum(p.*ll);  
h
l 
