%% 非齐次线性方程组的通解
% A=[1 -2 3 -1;3 -1 5 -3;2 1 2 -2];
% b=[1;2;3];
A=[1 1 -3 -1;3 -1 -3 4;1 5 -9 -8];
b=[1;4;0];
B=[A b];
n=4;
RA=rank(A)
RB=rank(B)
format rat
if RA==RB&RA==n
    X=A\b
elseif RA==RB&RA<n
    X=A\b
    C=null(A,'r')
else X='equition no solve'
end