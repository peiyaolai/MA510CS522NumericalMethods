% Ruddy duck data (Burden & Faires)

clear; close all; clc

x = [0.9 1.3 1.9 2.1 2.6 3.0 3.9 4.4 4.7 5.0 6.0 7.0 8.0 9.2 10.5 11.3 ...
    11.6 12.0 12.6 13.0 13.3];

y = [1.3 1.5 1.85 2.1 2.6 2.7 2.4 2.15 2.05 2.1 2.25 2.3 2.25 1.95 1.4 0.9 ...
    0.7 0.6 0.5 0.4 0.25];

% Plot data
figure(1);
plot(x,y,'.k','MarkerSize',30);
grid on;
set(gca,'FontSize',26);
cpos = get(gcf,'Position');
set(gcf,'Position',[0 cpos(2) 1450 cpos(4)]);



% Approximate with cubic spline interpolant!




