% Plot results and data points
% x = -1:0.01:1;
% L_0 =  1;
% L_1 =  x;
% L_2 =  x^2-1/3;
% L_3 =  x^3-3*x/5;
% figure(1);
% plot(x,L_0,'.b','MarkerSize',2);hold on;
% plot(x,L_1,'-r','LineWidth',2); hold on;    
% plot(x,L_2,'-.og','LineWidth',2);hold on;   
% plot(x,L_3,'--dc','LineWidth',2); hold off;   
% legend('L_0','L_1','L_2','L_3')
xpts = 0:3;
ypts = exp(xpts);

figure(1);
plot(xpts,ypts,'.k','MarkerSize',30); 
% hold on;
% plot(xeval,S_val,'-m','LineWidth',2); hold off;
% set(gca,'FontSize',26);
