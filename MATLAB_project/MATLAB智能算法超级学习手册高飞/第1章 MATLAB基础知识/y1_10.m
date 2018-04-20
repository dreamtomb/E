%%
A=[1  -2  3  -1;3  -1  5  -3;2  1  2  -2];
b=[1  2  3]';
B=[A b];
n=4;
RA=rank(A)
RB=rank(B)
format rat
if RA==RB&RA==n      %判断是否有唯一解
   X=A\b
elseif RA==RB&RA<n    %判断是否有无穷解
   X=A\b      %求特解
   C=null(A,'r')    %求AX=0的基础解系
else X='equition no solve'     %判断无解
end
