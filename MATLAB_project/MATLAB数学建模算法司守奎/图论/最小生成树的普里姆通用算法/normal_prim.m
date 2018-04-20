% 生成图G的 最小生成树的 边表
function MST = normal_prim(G)
N = length(G); % 图G的顶点数
MST = []; % 记录MST的边表 [起点 终点 权值]
k = 0;
vis = zeros(1, N); 
vis(1) = 1; 
while k < N-1
    minw = inf;
    u = 0; v = 0;
     
    % 找一条最小边
    for i = 1 : N
        for j = 1 : N
            if vis(i) == 1 && vis(j) == 0
                if G(i, j) < minw
                    minw = G(i, j);
                    u = i; v = j;
                end 
            end
        end 
    end 
    % 加入生成树
    vis(v)  = 1;
    k = k+1;
    MST(k, :) = [u v minw];
end
