% MA 510 / CS 522: Numerical Methods
% Instructor: Prof. Andrea Arnold
%
% Example: Applying RK2 to approximate solution to IVP
% y' = y - t^2 + 1 on [0,2] with y(0) = 0.5

clear; close all; clc

f  = @(inp) inp(2)-inp(1)^2+1; % here inp = [t,y]
t  = 0:0.2:2; 
y0 = 0.5;

y_RK2 = RK2(f,t,y0); % compute RK2 approximation of solution to IVP

% Compare to analytic solution
y_true = @(t) t.^2 + 2*t + 1 - 0.5*exp(t);

t_plot = 0:0.2:2;
y_plot = y_true(t_plot);

figure(1);
plot(t_plot,y_plot,'-k','LineWidth',3); 
hold on;
plot(t,y_RK2,'--r','LineWidth',3);
plot(t,y_RK2,'.r','MarkerSize',30);
hold off;
set(gca,'FontSize',30);
legend('true','RK2','Location','SE');

disp(' ')
disp('    t         y(t)      RK2       error   ')
disp(' ----------------------------------------')
disp([t',y_plot',y_RK2,abs(y_plot'-y_RK2)])





