function [U,P,Dist,Cluster_Res,Obj_Fcn,iter]=fuzzycm2(Data,P0,plotflag,M,epsm)
% 模糊 C 均值聚类 FCM: 从指定初始聚类中心开始迭代
% [U,P,Dist,Cluster_Res,Obj_Fcn,iter] = fuzzycm2(Data,P0,plotflag,M,epsm)
% 输入: Data,plotflag,M,epsm: 见 fuzzycm.m
%       P0: 初始聚类中心
% 输出: U,P,Dist,Cluster_Res,Obj_Fcn,iter: 见 fuzzycm.m    
% See also: fuzzycm
if nargin<5
    epsm=1.0e-6; 
end
if nargin<4
    M=2;
end
if nargin<3
    plotflag=0;
end
[N,S] = size(Data); m = 2/(M-1); iter = 0;
C=size(P0,1);Dist(C,N)=0;U(C,N)=0;P(C,S)=0;
% FCM 的迭代算法
while true 
    % 迭代计数器
    iter=iter+1; 
    % 计算或更新划分矩阵 U
    for i=1:C
        for j=1:N
            Dist(i,j)=fuzzydist(P0(i,:),Data(j,:));
        end
    end         
    U=1./(Dist.^m.*(ones(C,1)*sum(Dist.^(-m))));      
    % 更新聚类中心 P
    Um=U.^M;
    P=Um*Data./(ones(S,1)*sum(Um'))';   
    % 目标函数值: 类内加权平方误差和
    if nargout>4 | plotflag
        Obj_Fcn(iter)=sum(sum(Um.*Dist.^2));
    end
    % FCM 算法迭代停止条件
    if norm(P-P0,Inf)<epsm
        break
    end
    P0=P;
end
% 聚类结果
if nargout > 3
    res = maxrowf(U);
    for c = 1:C
        v = find(res==c);
        Cluster_Res(c,1:length(v))=v;
    end
end
% 绘图
if plotflag
    fcmplot(Data,U,P,Obj_Fcn);
end
