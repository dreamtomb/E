function ObjV=val(Chrom)
% load stillneed.mat
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
load weight.mat
stillneed=sum(need');
weight1=weight1/159;
weight2=weight2/128;
weight3=weight3/763;
% stillneed=stillneed.*weight1;
% stillneed=stillneed.*weight2;
stillneed=stillneed.*weight3;
ObjV=zeros(size(Chrom,1),1);
for i=1:size(Chrom,1)
    s=sum(Chrom(i,:)./stillneed);
    biaozhuncha=std(Chrom(i,:)./stillneed);
    ObjV(i,1)=0.3*s-0.7*biaozhuncha;   
%     ObjV(i,1)=ObjV(i,1)/1000+0.04;
    ObjV(i,1)=ObjV(i,1)/1000;
end