function[new_matrix_cells,new_v]=border_control(matrix_cells,a,b,v,vmax)
%边界条件，开口边界，控制车辆出入
%出口边界，若头车在道路边界，则以一定该路0.9离去
n=length(matrix_cells);
if a==n %如果在出口
    rand('state',sum(100*clock)*rand(1));%?¨?????ú??×?
    p_1=rand(1); %产生随机概率
    if p_1<=1 %如果随机概率小于0.9，则车辆离开路段，否则不离口
    matrix_cells(n)=0;
    v(n)=0;    
    end
end
%入口边界，泊松分布到达，1s内平均到达车辆数为q，t为1s
if b>vmax%最后一个的位子大于初始速度
    t=1;
    q=0.25;
    x=1;
    p=(q*t)^x*exp(-q*t)/prod(x); %1s内有1辆车到达的概率
   rand('state',sum(100*clock)*rand(1));
    p_2=rand(1);
    if p_2<=p 
       m=min(b-vmax,vmax);
       matrix_cells(m)=1;
       v(m)=m; %v(m)=b-m;  %保证与前一个车的安全距离，有可能前一个车不走，b为前一个车的位置 
    end
end
new_matrix_cells=matrix_cells;
new_v=v;     
