function ObjV=val(Chrom)
load stillneed.mat
ObjV=zeros(size(Chrom,1),1);
for i=1:size(Chrom,1)
    s=sum(Chrom(i,:)./stillneed);
    biaozhuncha=std(Chrom(i,:)./stillneed);
    ObjV(i,1)=0.3*s-0.7*biaozhuncha;   
    ObjV(i,1)=ObjV(i,1)+0.04;
end