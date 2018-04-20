%% 模拟退火求解背包问题
%% 参数设置
clear
clc
a = 0.95;%退火系数
k = [5;10;13;4;3;11;13;10;8;16;7;4];%价格/元
k = -k;	% 模拟退火算法是求解最小值，故取负数
d = [2;5;18;3;2;5;10;4;11;7;14;6];%重量/磅
restriction = 46;%重量上限/磅
num = 12;
%sol_new是初始解
%sol_current是当前解决策略
%sol_best是最优解决策略
sol_new = ones(1,num);         % 生成初始解
sol_current = sol_new; 
sol_best = sol_new;
% E_current是当前解对应的目标函数值（即背包中物品总价值）
% E_new是新解的目标函数值；
% E_best是最优解的目标函数值
E_current = inf;
E_best = inf;  
%t0是初始温度
t0=97; 
%tf是截止温度
tf=3; 
t=t0;
%p是一个标志
p=1;
%% 模拟退火
while t>=tf
	for r=1:100
		%产生随机扰动
        %ceil函数产生一个大于括号内数值的最小整数
		tmp=ceil(rand.*num);
		sol_new(1,tmp)=~sol_new(1,tmp);
		%检查是否满足约束
		while 1
			q=(sol_new*d <= restriction);
			if ~q
                p=~p;	%实现交错着逆转头尾的第一个1
                tmp=find(sol_new==1);
                if p
                    sol_new(1,tmp(1))=0;
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
%% 最优解输出
disp('最优解为：')
disp(sol_best);
disp('物品总价值等于：')
val=-E_best;
disp(val);
disp('背包中物品重量是：')
disp(sol_best * d);

