function tw=tolsortvec(utw,dw,CIC,RIC)
%求层次总排序权重并进行一致性检验
%utw为上一层因素的总排序权重行向量
%dw为下一层因素相对于上一层个因素的层次单排序权重矩阵
%CIC为一致性指标列向量
%RIC为随机一致性指标列向量
tw=[dw(1:6)*utw(1);dw(7:11)*utw(2);dw(12:14)*utw(3)];
CR=utw'*CIC/(utw'*RIC);
CR
if CR>=0.10
disp([input('层次总排序没通过一致性检验，请重新调整判断矩阵')])
else
disp([input('层次总排序通过一致性检验')]);
end