global E  F  B  K 
E=0:0.1:2;
E=E';
F=0:0.1:2;
F=F';
B=1;K=1;a=1;b=1;c=1;d=1;
S=zeros(140,2);         %记录当蓝鲸与长须鲸的最后稳定状态都不为零的s1,s2值;
H=zeros(250,2);       %记录蓝鲸具有优势最后稳态值均为x=150000,y=0的s1,s2值;
U=zeros(250,2);       %长须鲸具有优势最后稳态值均为x=0,y=400000的s1,s2值;
Num=zeros(441,4);          %记录蓝鲸与长须鲸的最后稳定状态值;
while B<22
     K=1;
     while K<22
        options =odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-5]);
        [T,Y] = ode45('zhongqun4',[0 2000],[5000 70000],options);
        [m,n]=size(Y);
        Num(a,1)=Y(m,1);
        if Num(a,1)<1
           Num(a,1)=0;
        end
        Num(a,2)=Y(m,2);
        if Num(a,2)<1
           Num(a,2)=0;
        end
       Num(a,3)=E(B);
       Num(a,4)=F(K);
        if ((Y(m,1)-1>0)&(Y(m,2)-1>0))==1
               S(b,1)=E(B);
               S(b,2)=F(K);
               b=b+1;
        end
         if (Y(m,2)-1)<0
               H(c,1)=E(B);
               H(c,2)=F(K);
               c=c+1;
         end
         if (Y(m,1)-1)<0
               U(d,1)=E(B);
               U(d,2)=F(K);
               d=d+1;
        end
        a=a+1;
        K=K+1;
     end
     B=B+1;
end
