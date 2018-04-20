function f = addr(a,strsort)
% 返回向量升序或降序排列后各分量在原始向量中的索引
% 函数调用:f = addr(a,strsort)
% strsort: 'ascend' or 'descend'
%          default is 'ascend'
% -------- example --------
% addr([ 4 5 1 2 ]) returns ans:
%       [ 3   4   1   2 ]
if nargin==1
    strsort='ascend';
end
sa=sort(a); ca=a;
la=length(a);f(la)=0;
for i=1:la
    f(i)=find(ca==sa(i),1);
    ca(f(i))=NaN;
end
if strcmp(strsort,'descend')
    f=fliplr(f);
end