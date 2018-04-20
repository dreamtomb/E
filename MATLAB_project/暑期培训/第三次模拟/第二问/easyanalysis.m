%% 灵敏度分析
a0=[4.1 3.2 5.0 4.0 3.7 3.5 2.3 2.1];
a1=a0+0.1;
a2=a0+0.2;
a3=a0+0.3;
a4=a0-0.1;
a5=a0-0.2;
a6=a0-0.3;
res=zeros(7,8);
d=[0 0.1 -0.1 0.2 -0.2 0.3 -0.3];
change=zeros(7,8);
for i=1:7
    for j=1:8
        change(i,j)=d(i)/a0(j);
    end
end
[res(1,1),res(1,2),res(1,3),res(1,4),res(1,5),res(1,6),res(1,7),res(1,8)]=test(a0);
[res(2,1),res(2,2),res(2,3),res(2,4),res(2,5),res(2,6),res(2,7),res(2,8)]=test(a1);
[res(3,1),res(3,2),res(3,3),res(3,4),res(3,5),res(3,6),res(3,7),res(3,8)]=test(a2);
[res(4,1),res(4,2),res(4,3),res(4,4),res(4,5),res(4,6),res(4,7),res(4,8)]=test(a3);
[res(5,1),res(5,2),res(5,3),res(5,4),res(5,5),res(5,6),res(5,7),res(5,8)]=test(a4);
[res(6,1),res(6,2),res(6,3),res(6,4),res(6,5),res(6,6),res(6,7),res(6,8)]=test(a5);
[res(7,1),res(7,2),res(7,3),res(7,4),res(7,5),res(7,6),res(7,7),res(7,8)]=test(a6);
for i=2:7
    for j=1:8
        fprintf('%s%f%s%f%s\n','当期望改变了',change(i,j)*100,'%,几率改变了',100*(res(i,j)-res(1,j))/res(1,j),'%');
    end
end



