vari = zeros(m,n);
for j=1:m-1
    vari(j,1)=data(j+1,1)-data(j,1); %distance
    vari(j,2)=sqrt(abs(data(j+1,2)-data(j,2))); ;%square root of absolute diff
end;

figure;
plot(vari(:,1),vari(:,2),'ro','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',6);
title('Variogram Cloud','fontsize',22);
xlabel('Pairwise Distance','fontsize',16);
ylabel('Square Root of Absolute Difference of Attribute Values','fontsize',16);
text(0.6,2.05, '\leftarrow (Q,S)','FontSize', 14);
text(0.5,1.59, '\leftarrow (P,S)','FontSize', 14);

%print -djpeg90 vari2.jpg