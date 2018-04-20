function dy=zhongqun4(t,y)
global E  F  B  K 
dy=zeros(2,1);
dy(1)=0.05*y(1)*(1-y(1)/150000-E(B)*y(2)/400000);
dy(2)=0.08*y(2)*(1-F(K)*y(1)/150000-y(2)/400000);
