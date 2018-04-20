%% 齐次线性方程组的通解
A=[1 2 2 1;2 1 -2 -2;1 -1 -4 -3];
format rat
B=null(A,'r');%或者B=rref(A);
syms k1 k2
X=k1*B(:,1)+k2*B(:,2)
pretty(X)