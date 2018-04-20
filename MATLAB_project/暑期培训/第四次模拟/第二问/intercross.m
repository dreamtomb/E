function [chrom1 chrom2]=intercross(chrom1,chrom2)
len=length(chrom1);
index1=0;
index2=0;
index3=0;
index4=0;
for i=1:len-1
    for j=i+1:len
        s=chrom1(i)+chrom1(j);
        for k=1:len-1
            for h=k+1:len
                ss=chrom2(k)+chrom2(h);
            end
        end
        if s~=ss
            
        else
            index1=i;
            index2=j;
            index3=k;
            index4=h;
            break;
        end
    end
end
if index1==0
    chrom1=chrom1;
    chrom2=chrom2;
else
    temp1=chrom1(index1);
    temp2=chrom1(index2);
    temp3=chrom2(index3);
    temp4=chrom2(index4);
    chrom1(index1)=temp3;
    chrom1(index2)=temp4;
    chrom2(index3)=temp1;
    chrom2(index4)=temp2;
end
