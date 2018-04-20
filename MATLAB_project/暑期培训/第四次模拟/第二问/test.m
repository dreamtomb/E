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
% come=sum(need);
load weight.mat
res=sum(need');
weight1=weight1/159;
weight2=weight2/128;
weight3=weight3/763;
times=1./(weight1+weight2+weight3);
weight1=weight1.*times;
weight2=weight2.*times;
weight3=weight3.*times;
% 360-519     519-647     647-1410
% come1=come.*weight1;
% come2=come.*weight3;
% come3=come.*weight2;
need1=res.*weight1;
need2=res.*weight3;
need3=res.*weight2;
have1=[91  113   97  100  108   90  110   93  101   97];
have2=[97   75  107  108  118  101   90  116   94   94];
have3=[97  104   91   94  109  106   99  105   97   98];
mz1=4*have1./need1;
mz1(find(mz1>1))=1;
res1=0.3*sum(mz1)/length(mz1)-0.7*std(mz1);
mz2=2*have2./need2+0.2;
mz2(find(mz2>1))=1;
res2=0.3*sum(mz2)/length(mz2)-0.7*std(mz2);
mz3=4*have3./need3+0.1;
mz3(find(mz3>1))=1;
res3=0.3*sum(mz3)/length(mz3)-0.7*std(mz3);

