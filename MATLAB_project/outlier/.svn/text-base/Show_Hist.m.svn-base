means = mean(data(:,2));
stds = std(data(:,2));

outline1 = ones(10,2);
outline2 = ones(10,2);


for i=1:10
    outline1(i,1)=i-1;
    outline1(i,2)=means-2*stds;
    outline2(i,1)=i-1;
    outline2(i,2)=means+2*stds;
end;


figure;
hold on;
histfit(data(:,2));
plot(outline1(:,2),outline1(:,1));
plot(outline2(:,2),outline2(:,1));
title('Histogram of Attribute Values','fontsize',20);
xlabel('Attribute Values','fontsize',18);
ylabel('Number of Occurrence','fontsize',18);
text(means-2*stds-2, 5, '\mu-2\sigma \rightarrow','FontSize',16);
text(means+2*stds+0.3, 5, '\leftarrow \mu + 2\sigma','FontSize',16);
%print -djpeg90 hist2.jpg

