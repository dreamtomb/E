%% data
need=[
0	240	119	123	145	126	115	127	112	102;
135	0	225	129	120	126	139	127	121	140;
125	132	0	251	110	117	126	137	158	126;
116	115	148	0	261	144	132	141	124	119;
128	133	124	116	0	273	138	120	103	132;
158	128	143	140	144	0	244	132	140	116;
129	140	125	146	135	138	0	237	116	135;
134	168	145	134	142	139	145	0	244	128;
105	122	129	138	123	143	114	119	0	237;
138	108	131	136	121	113	144	243	134	0
];
%% 求整体满足度
load pp.mat
pp=pp1+pp2+pp3;
sati=zeros(1,10);
for i=1:10
    peonee=sum(need(i,:));
    reahav=sum(pp(:,i));
    sati(i)=reahav/peonee;
end
%% 求分时间段的满足度
ppp1=[];ppp2=[];ppp3=[];ppp=[];
for i=1:10
    ppp1(i)=sum(pp1(i,:));
end
for i=1:10
    ppp2(i)=sum(pp2(i,:));
end
for i=1:10
    ppp3(i)=sum(pp3(i,:));
end
for i=1:10
    ppp(i)=sum(pp(i,:));
end
weight1=ppp1./ppp;
weight2=ppp2./ppp;
weight3=ppp3./ppp;

%根据权重求三个时间段的需求
for i=1:10
    need1(i,:)=weight1(i)*need(i,:);
    need2(i,:)=weight2(i)*need(i,:);
    need3(i,:)=weight3(i)*need(i,:);
end
psati=zeros(1,10);
for i=1:10
    peonee1=sum(need1(i,:));
    peonee2=sum(need2(i,:));
    peonee3=sum(need3(i,:));
    reahav1=sum(pp1(:,i));
    reahav2=sum(pp2(:,i));
    reahav3=sum(pp3(:,i));
    psati(1,i)=reahav1/peonee1;
    psati(2,i)=reahav2/peonee2;
    psati(3,i)=reahav3/peonee3;
end
subplot(1,3,1);
plot(1:10,psati(1,:));
axis([1 10 0 1]);
title('第一时段十个区域共享单车满足度折线图')
xlabel('区域')
ylabel('满足度')
subplot(1,3,2);
plot(1:10,psati(2,:));
axis([1 10 0 1]);
title('第二时段十个区域共享单车满足度折线图')
xlabel('区域')
ylabel('满足度')
subplot(1,3,3);
plot(1:10,psati(3,:));
axis([1 10 0 1]);
title('第三时段十个区域共享单车满足度折线图')
xlabel('区域')
ylabel('满足度')
%% 整数规划[9  10  11  11  9  10  12  10  10  7]
sneed=need-pp;
stillneed=sum(sneed');




