%% 多目标线性规划
% max z1=100x1+90x2+80x3+70x4
% min z1=3x2+2x4
% x1+x2 ≥30
% x3+x4≤ 30
% 3x1+2x3≤ 120
% 3x2+2x4≤ 48
% xi≥0
a=[-1 -1 0 0;0 0 1 1;3 0 2 0;0 3 0 2];
b=[-30 30 120 48]';
c1=[-100 -90 -80 -70];
c2=[0 3 0 2];
[x1,fval1]=linprog(c1,a,b,[],[],zeros(4,1));
[x2,fval2]=linprog(c2,a,b,[],[],zeros(4,1));
g3=[fval1;fval2];
[x,fval]=fgoalattain('Fun',rand(4,1),g3,abs(g3),a,b,[],[],zeros(4,1));