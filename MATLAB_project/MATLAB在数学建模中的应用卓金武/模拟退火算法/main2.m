clear
clc
a = 0.95;% 温度衰减函数的参数
k = [5;10;13;4;3;11;13;10;8;16;7;4];%重量
k = -k;	% 模拟退火算法是求解最小值，故取负数
d = [2;5;18;3;2;5;10;4;11;7;14;6];%价值
restriction = 46;%最大可以背负的重量
num = 12;%物品个数
sol_new = ones(1,num);         % 生成初始解
E_current = inf;
E_best = inf;
% E_current是当前解对应的目标函数值（即背包中物品总价值）；
% E_new是新解的目标函数值；
% E_best是最优解的
sol_current = sol_new;
sol_best = sol_new;
%sol_current和sol_best定义的是最后的结果集
t0=97; %冷却开始的温度
tf=3;%冷却终止的温度
t=t0;%t为温度
p=1;

while t>=tf%没有衰减到截止温度的时候
    for r=1:100
        %产生随机扰动
        tmp=ceil(rand.*num);%rand产生一个随机数，ceil向正无穷方向取整
        sol_new(1,tmp)=~sol_new(1,tmp);%这一位的元素取反
        
        %检查是否满足约束
        while 1
            q=(sol_new*d <= restriction);
            if ~q%如果超出了背负的极限
                p=~p;	%实现交错着逆转头尾的第一个1
                tmp=find(sol_new==1);
                if p
                    sol_new(1,tmp)=0;
                else
                    sol_new(1,tmp(end))=0;
                end
            else
                break
            end
        end
        
        % 计算背包中的物品价值
        E_new=sol_new*k;
        if E_new<E_current
            E_current=E_new;
            sol_current=sol_new;
            if E_new<E_best
                % 把冷却过程中最好的解保存下来
                E_best=E_new;
                sol_best=sol_new;
            end
        else
            if rand<exp(-(E_new-E_current)./t)
                E_current=E_new;
                sol_current=sol_new;
            else
                sol_new=sol_current;
            end
        end
    end
    t=t.*a;
end

disp('最优解为：')
sol_best
disp('物品总价值等于：')
val=-E_best;
disp(val)
disp('背包中物品重量是：')
disp(sol_best * d)
