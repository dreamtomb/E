function [U,P,Dist,Cluster_Res,Obj_Fcn,iter]=fuzzycm(Data,C,plotflag,M,epsm)
% 模糊 C 均值聚类 FCM: 从随机初始化划分矩阵开始迭代
% [U,P,Dist,Cluster_Res,Obj_Fcn,iter] = fuzzycm(Data,C,plotflag,M,epsm)
% 输入:
%     Data: N×S 型矩阵,聚类的原始数据,即一组有限的观测样本集,
%           Data 的每一行为一个观测样本的特征矢量,S 为特征矢量
%           的维数,N 为样本点的个数
%     C:    聚类数,1<C<N
%     plotflag: 聚类结果 2D/3D 绘图标记,0 表示不绘图,为缺省值        
%     M:    加权指数,缺省值为 2
%     epsm: FCM 算法的迭代停止阈值,缺省值为 1.0e-6
% 输出:
%     U:    C×N 型矩阵,FCM 的划分矩阵
%     P:    C×S 型矩阵,FCM 的聚类中心,每一行对应一个聚类原型
%     Dist: C×N 型矩阵,FCM 各聚类中心到各样本点的距离,聚类中
%           心 i 到样本点 j 的距离为 Dist(i,j)
%     Cluster_Res: 聚类结果,共 C 行,每一行对应一类
%     Obj_Fcn: 目标函数值
%     iter: FCM 算法迭代次数
% See also: fuzzydist maxrowf fcmplot
if nargin<5
    epsm=1.0e-6; 
end
if nargin<4
    M=2;
end
if nargin<3
    plotflag=0;
end
[N,S]=size(Data);m=2/(M-1);iter=0;
Dist(C,N)=0; U(C,N)=0; P(C,S)=0;
% 随机初始化划分矩阵
U0 = rand(C,N); 
U0=U0./(ones(C,1)*sum(U0));
% FCM 的迭代算法
while true 
    % 迭代计数器
    iter=iter+1; 
    % 计算或更新聚类中心 P
    Um=U0.^M;
    P=Um*Data./(ones(S,1)*sum(Um'))';   
    % 更新划分矩阵 U
    for i=1:C
        for j=1:N
            Dist(i,j)=fuzzydist(P(i,:),Data(j,:));
        end
    end         
    U=1./(Dist.^m.*(ones(C,1)*sum(Dist.^(-m))));          
    % 目标函数值: 类内加权平方误差和
    if nargout>4 | plotflag
        Obj_Fcn(iter)=sum(sum(Um.*Dist.^2));
    end
    % FCM 算法迭代停止条件
    if norm(U-U0,Inf)<epsm
        break
    end
    U0=U;   
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
