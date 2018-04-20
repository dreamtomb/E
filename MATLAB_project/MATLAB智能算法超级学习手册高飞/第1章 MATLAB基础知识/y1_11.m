A=[1  1  -3  -1;3  -1  -3  4;1  5  -9  -8];
b=[1 4 0]';
B=[A b];
n=4;
R_A=rank(A)
R_B=rank(B)
format rat
if R_A==R_B&R_A==n
   X=A\b
elseif R_A==R_B&R_A<n
   X=A\b
   C=null(A,'r')
else X='Equation has no solves'
end
