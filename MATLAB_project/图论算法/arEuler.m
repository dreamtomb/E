%% 求Euler回路的Fleury算法的Matlab程序
function [eu,cEu]=arEuler(E)
eu=0;
cEu=[];
ncV=arComp(E);
if max(ncV)>1  
    return   
end
n=max(max(E(:,1:2)));  
m=size(E,1);  
for i=1:n
    b(i)=0;
    for j=1:m
        if E(j,1)==i|E(j,2)==i
            b(i)=b(i)+1;
        end
    end
end   
rp=rem(b,2);  
srp=sum(rp);  
switch srp
    case 0, 
        eu=1;
    case 2, 
        eu=0.5;
    otherwise,  
        return
end  
if srp==0   
    v1=1;  
else    
    v1=find(rp);  
    v1=v1(1);  
end
vc=v1; 
m=size(E,1); 
E1=[E(:,1:2),[1:m]'];  
while ~isempty(E1)  
    evc=find((E1(:,1)==vc)|(E1(:,2)==vc)); 
    levc=length(evc);  
    if levc==1  
        cEu=[cEu;E1(evc,3)]; 
        vcold=vc;
        vc=sum(E1(evc,1:2))-vc; 
        E1=E1(setdiff([1:size(E1,1)],evc),:); 
        E2=E1(:,1:2);
        E2gv=E2>vcold;
        E2(E2gv)=E2(E2gv)-1;
        E1(:,1:2)=E2;
        if vc>vcold
            vc=vc-1;
        end
        if v1>vcold
            v1=v1-1;
        end
    else  
        for k=1:levc
            E2=E1(setdiff([1:size(E1,1)],evc(k)),:);
            ncv=arComp(E2); 
            nco=max(ncv);
            if (max(ncv)==1) 
                cEu=[cEu;E1(evc(k),3)]; 
                vc=sum(E1(evc(k),1:2))-vc; 
                E1=E2;
                break;
            end
        end
    end
end
return
