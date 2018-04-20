%
clc,clear,close all
load data.mat
P=datay;
n0=size(P);
max=max(P(:))';
min=min(P(:))';

if min==0
    P1=zeros(max+1,n0(1,2));
end
if min==0
    for i=1:n0(1,1)
        for j=1:n0(1,2)
            P1(P(i,j)+1,j)=1;
        end
    end
end

if min~=0
    P1=zeros(max-min+1,n0(1,2));
end
if min~=0
    for i=1:n0(1,1)
        for j=1:n0(1,2)
            P1(P(i,j),j)=1;
        end
    end
end

P=P1;
%%
[R,Q] = size(P); 
S = 10;							% 选择初始输出节点
W0 = ones(S,R);					% 网络初始权值
lr = 1; 							% 选择学习速率
r = 0.85;							% 选择相似度	
disp('Pass 1');						 
W = sima1(W0,P,lr,r,1);				% 第一次运行ART1网络训练程序
% disp('Pass 2');						% 将运行结果W作为初始权值，
% W = sima1(W,P,lr,r,1);				% 进行第二次运行ART1网络训练程序
% disp('Pass 3');						
% W = sima1(W,P,lr,r,1);				% 进行第三次运行ART1网络训练程序
% W1 = W'						
% pause
% W2=(normc(W1))'