means = mean(data(:,2));
stds = std(data(:,2));

norm_test = (data(:,2) - means)/stds;

figure;
hold on;
plot(x_index, norm_test, 'ro','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','b',...
                'MarkerSize',6);
title('Global Outlier Detection','fontsize',20);
xlabel('Label of Location','fontsize',18);
ylabel('Global Normal Test','fontsize',18);
set(gca,'xtick',[1:30]);
grid on;
text(x_index(12)-3,norm_test(12),'G \rightarrow','FontSize',14);
