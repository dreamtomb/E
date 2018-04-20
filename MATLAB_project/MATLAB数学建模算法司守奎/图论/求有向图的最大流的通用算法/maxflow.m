function [maxflow,flowmatrix,cut]=maxflow(G,s,t);
%G是邻接矩阵，不相连的用0表示
%s是起点
%t是终点
cm=sparse(G);
[maxflow,flowmatrix,cut]=graphmaxflow(cm,s,t);