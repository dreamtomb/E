function [chrom1 chrom2]=intercross(chrom1,chrom2)
len=length(chrom1);
r=randi([1,len]);
temp1=chrom1(r:end);
temp2=chrom2(r:end);
chrom1=[chrom1(1:r-1) temp2];
chrom2=[chrom2(1:r-1) temp1];
[chrom1 chrom2]=ctzh(chrom1,chrom2,r);