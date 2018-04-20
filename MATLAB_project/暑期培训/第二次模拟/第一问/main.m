for i=0:8
c=[1 1 1];%a11,a21,a22
intcon=[1 2 3];
A=[-10 -5 -10;1 0 1];
b=[-120;8];
[x,fval]=intlinprog(c,intcon,A,b,[],[],[0 0 0],[i 10 10]);
disp(x);
disp(fval);
end

