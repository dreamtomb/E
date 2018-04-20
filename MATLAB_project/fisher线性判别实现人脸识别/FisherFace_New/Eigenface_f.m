function [disc_set,disc_value,Mean_Image]=Eigenface_f(Train_SET,Eigen_NUM)
%输入：
%Train_SET：训练样本集，每列是一个样本，每行一类特征，mxn
%Eigen_NUM：投影维数

%输出：
%disc_set：特征向量
%disc_value：特征值
%Mean_Image：均值图像

%------------------------------------------------------------------------
% Eigenface computing function

[NN,Train_NUM]=size(Train_SET);

if NN<=Train_NUM % m<n时
    
    Mean_Image=mean(Train_SET,2);
    Train_SET=Train_SET-Mean_Image*ones(1,Train_NUM);
    R=Train_SET*Train_SET'/(Train_NUM-1);
    
    [V,S]=Find_K_Max_Eigen(R,Eigen_NUM);
    disc_value=S;
    disc_set=real(V);
    
else % m>n时
    
    Mean_Image=mean(Train_SET,2);
    Train_SET=Train_SET-Mean_Image*ones(1,Train_NUM);
    
    R=Train_SET'*Train_SET/(Train_NUM-1);
    
    [V,S]=Find_K_Max_Eigen(R,Eigen_NUM);
    disc_value=S;
    disc_set=zeros(NN,Eigen_NUM);
    clear R S;
    Train_SET=Train_SET/sqrt(Train_NUM-1);
    
    for k=1:Eigen_NUM
        a = Train_SET*V(:,k);
        b = (1/sqrt(disc_value(k)));
        disc_set(:,k)=b*a;
    end
    disc_set=real(disc_set);
end

function [Eigen_Vector,Eigen_Value]=Find_K_Max_Eigen(Matrix,Eigen_NUM)

[NN,NN]=size(Matrix);
[V,S]=eig(Matrix); %Note this is equivalent to; [V,S]=eig(St,SL); also equivalent to [V,S]=eig(Sn,St); %

S=diag(S);
[S,index]=sort(S);

Eigen_Vector=zeros(NN,Eigen_NUM);
Eigen_Value=zeros(1,Eigen_NUM);

p=NN;
for t=1:Eigen_NUM
    Eigen_Vector(:,t)=V(:,index(p));
    Eigen_Value(t)=S(p);
    p=p-1;
    if p==0
        break;
    end
end