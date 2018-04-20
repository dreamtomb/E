function [val,P,D]=cal(NIND,pxy,xy1,pjs,js1,prs,rs1,prw,rw1,a,b,c,d,xyqq,jsqq,rsqq,rwqq,mon)
%pxy表示的是每个区间每个利润的概率,
%xy1是每个区间每个利润通过的概率
%a,b,c,d分别是对应23个利润的概率（权重）
%xyqq是每个区间的权重
s1=0;
s2=0;
for j=1:NIND
    %% 计算利润p
    for i=1:10
        tpxy(i,:)=pxy(i,:).*mon';
        tpxy(i,:)=tpxy(i,:).*a(j,:);
    end
    ttpxy=sum(tpxy')';
    respxy=xyqq*ttpxy;
    s2=respxy;
    for i=1:10
        tpjs(i,:)=pjs(i,:).*mon';
        tpjs(i,:)=tpjs(i,:).*b(j,:);
    end
    ttpjs=sum(tpjs')';
    respjs=jsqq*ttpjs;
    for i=1:10
        tprs(i,:)=prs(i,:).*mon';
        tprs(i,:)=tprs(i,:).*c(j,:);
    end
    ttprs=sum(tprs')';
    resprs=rsqq*ttprs;
    for i=1:10
        tprw(i,:)=prw(i,:).*mon';
        tprw(i,:)=tprw(i,:).*d(j,:);
    end
    ttprw=sum(tprw')';
    resprw=rwqq*ttprw;
    %% 计算通过率
    for i=1:10
        txy1(i,:)=xy1(i,:).*a(j,:);
    end
    ttxy1=sum(txy1')';
    resxy1=xyqq*ttxy1;
    s1=resxy1;
    for i=1:10
        tjs1(i,:)=js1(i,:).*b(j,:);
    end
    ttjs1=sum(tjs1')';
    resjs1=jsqq*ttjs1;
    for i=1:10
        trs1(i,:)=rs1(i,:).*c(j,:);
    end
    ttrs1=sum(trs1')';
    resrs1=rsqq*ttrs1;
    for i=1:10
        trw1(i,:)=rw1(i,:).*d(j,:);
    end
    ttrw1=sum(trw1')';
    resrw1=rwqq*ttrw1;
    s1=(s1+resjs1+resrs1+resrw1)/3;
    s2=(s2+respjs+resprs+resprw)/3;
    pval=0.9*s1-0.1*s2/100;
    val(j,1)=pval;
    P(j,1)=s1;
    D(j,1)=s2;
end










