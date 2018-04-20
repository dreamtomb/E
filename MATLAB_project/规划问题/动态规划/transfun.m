% 4.状态转移Tk
% 前后两个状态之间的关系如下
% s2=s1-u1，s3=s2-u2
function s_next=transfun(k,s,u)
s_next=s-u;