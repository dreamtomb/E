%% 处理得到的数据
function num=deal(num)
num(12,:)=num(12,:)*100;
clu(num);
num=num';
num=mapminmax(num,0.1,1.1);