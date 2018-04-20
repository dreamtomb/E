c1=[4 6 7 7 7 7];
c2=[2 4 6 8 9 10];
c3=[3 5 7 8 8 8];
c4=[4 5 6 6 6 6];
f=[c1(1) c1(2) c1(3) c1(4) c1(5) c1(6) c2(1) c2(2) c2(3) c2(4) c2(5) c2(6) c3(1) c3(2) c3(3) c3(4) c3(5) c3(6) c4(1) c4(2) c4(3) c4(4) c4(5) c4(6)];
%cj(i)
intcon=24;
a=-1*ones(1,24);
b=[-4];
p=ones(1,6);
aeq=diag(p);
aeq=[aeq aeq aeq aeq];
beq=[1;1;1;1;1;1];

x=intlinprog(f,intcon,a,b,aeq,beq,zeros(24,1),ones(24,1));