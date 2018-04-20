%% 这是利用粒子群算法求f（x）=2.1（1-x+2x^2）exp(-x^2/2)的最大值
clc
clear
close all;
%% 主程序
% 参数设定
tic;
E0=0.001;%允许误差
MaxNum=100;%例子最大迭代次数
narvs=1;%目标函数的自变量个数
particlesize=10;%粒子群规模
c1=2;%每个粒子的个体学习因子
c2=2;%每个粒子的社会学习因子
w=0.6;%惯性因子
vmax=0.8;%粒子的最大飞翔速度
x=-5+10*rand(particlesize,narvs);%粒子所在的位置   x=[-5,5]
v=2*rand(particlesize,narvs);%粒子的飞翔速度          v=[0,2]

%定义适应度函数
fitness=inline('1/(1+(2.1*(1-x+2*x.^2).*exp(-x.^2/2)))','x');

for  i=1:particlesize
    for j=1:narvs
        f(i)=fitness(x(i,j));
    end
end
personalbest_x=x;
personalbest_faval=f;
[globalbest_faval,i]=min(personalbest_faval);
globalbest_x=personalbest_x(i,:);
k=1;
while k<=MaxNum
    for i=1:particlesize
        for j=1:narvs
            f(i)=fitness(x(i,j));
        end
        if f(i)<personalbest_faval(i)
            personalbest_faval(i)=f(i);
            personalbest_x(i,:)=x(i,:);
        end
    end
    [globalbest_faval,i]=min(personalbest_faval);
    globalbest_x=personalbest_x(i,:);
    for i=1:particlesize
        v(i,:)=w*v(i,:)+c1*rand*(personalbest_x(i,:)-x(i,:))+c2*rand*(globalbest_x-x(i,:));
        for j=1:narvs
            if v(i,j)>vmax;
                v(i,j)=vmax;
            elseif v(i,j)<-vmax;
                v(i,j)=-vmax;
            end
        end
        x(i,:)=x(i,:)+v(i,:);
    end
    if abs(globalbest_faval)<E0;
        break;
    end
    k=k+1;
end
Value1=1/globalbest_faval-1;
Value1=num2str(Value1);
disp(strcat('最大值是','=',Value1));
Value2=globalbest_x;
Value2=num2str(Value2);
disp(strcat('相应的坐标是','=',Value2));
x=-5:0.01:5;
y=2.1*(1-x+2*x.^2).*exp(-x.^2/2);
plot(x,y,'m-','linewidth',3);
hold on;
plot(globalbest_x,1/globalbest_faval-1,'kp','linewidth',4);
legend('目标函数','搜索到的最大值');
xlabel('x');
ylabel('y');
grid on;
toc;