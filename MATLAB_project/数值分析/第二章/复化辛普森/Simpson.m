%% 复化辛普森公式
function val=Simpson(f)
% f为被积函数
%% 算法实现
low=input('请输入积分下限:low=');
% f1=1;%sin(0)/0当做1
x=low;
f1=eval(f);
high=input('请输入积分上限:high=');
x=high;
f2=eval(f);
n=input('请输入等分的数目:n=');
h=(high-low)/n;
s1=0;
s2=0;
for i=1:n-1
    x=low+i*h;
    s1=s1+eval(f);
end
for i=0:n-1
    x=low+(i+0.5)*h;
    s2=s2+eval(f);
end
S=h/6*(f1+4*s2+2*s1+f2);
fprintf('%s%f\n','辛普森公式的结果为:S= ',S);