%Homework 10

% Question 2
% Part a
% h =1
h = 1;
t_1 = 0:h:40;
y_1 = 5*120./(5+(120-5)*exp(-0.25*t_1));
N = length(t_1);

P_1 = zeros(N,1);
P_1(1) = 5;
for j = 2:N
    P_1(j) = P_1(j-1) + h*0.25*P_1(j-1)*(1-P_1(j-1)/120);
end
err_1 = abs(y_1(16) - P_1(16));  % err_1 = 6.2972

% Plot data
figure(1);
plot(t_1,y_1,'-k','MarkerSize',30);  hold on;
plot(t_1,P_1,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
legend('true value)','approx h=1')

% h = 0.1
h = 0.1;
t_2 = 0:h:40;
y_2 = 5*120./(5+(120-5)*exp(-0.25*t_2));
N = length(t_2);
% Compute 
P_2 = zeros(N,1);
P_2(1) = 5;
for j = 2:N
    P_2(j) = P_2(j-1) + h*0.25*P_2(j-1)*(1-P_2(j-1)/120);
end
err_2 = abs(y_2(160) - P_2(160));  % err_2 = 0.0279

% Plot data
figure(2);
plot(t_2,y_2,'-k','MarkerSize',30);  hold on;
plot(t_2,P_2,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
legend('true value)','approx h=0.1')


% h = 0.01
h = 0.01;
t_3 = 0:h:40;
y_3 = 5*120./(5+(120-5)*exp(-0.25*t_3));
N = length(t_3);
% Compute 
P_3 = zeros(N,1);
P_3(1) = 5;
for j = 2:N
    P_3(j) = P_3(j-1) + h*0.25*P_3(j-1)*(1-P_3(j-1)/120);
end
err_3 = abs(y_3(1600) - P_3(1600));   % err_3 = 2.1241e-4

% Plot data
figure(3);
plot(t_3,y_3,'-k','MarkerSize',30);  hold on;
plot(t_3,P_3,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
legend('true value)','approx h=0.01')

% h = 0.001
h = 0.001;
t_4 = 0:h:40;
y_4 = 5*120./(5+(120-5)*exp(-0.25*t_4));
N = length(t_4);
% Compute 
P_4 = zeros(N,1);
P_4(1) = 5;
for j = 2:N
    P_4(j) = P_4(j-1) + h*0.25*P_4(j-1)*(1-P_4(j-1)/120);
end
err_4 = abs(y_4(16000) - P_4(16000));   % err_4 = 2.0654e-6

% Plot data
figure(4);
plot(t_4,y_4,'-k','MarkerSize',30);  hold on;
plot(t_4,P_4,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
legend('true value)','approx h=0.001')

% h = 0.0001
h = 0.0001;
t_5 = 0:h:40;
y_5 = 5*120./(5+(120-5)*exp(-0.25*t_5));
N = length(t_5);
% Compute 
P_5 = zeros(N,1);
P_5(1) = 5;
for j = 2:N
    P_5(j) = P_5(j-1) + h*0.25*P_5(j-1)*(1-P_5(j-1)/120);
end
err_5 = abs(y_5(160000) - P_5(160000));   % err_5 = 2.0596e-8

% Plot data
figure(5);
plot(t_5,y_5,'-k','MarkerSize',30);  hold on;
plot(t_5,P_5,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
legend('true value)','approx h=0.0001')

% part b
% h = 1
h = 1;
t_1 = 0:h:40;
y_1 = 5*120./(5+(120-5)*exp(-0.25*t_1));
N = length(t_1);
% Compute 
P_11 = zeros(N,1);
P_11(1) = 5;
P_11(2) = 6.1979;
for j = 3:N
    P_11(j) = P_11(j-2) + 2*h*0.25*P_11(j-1)*(1-P_11(j-1)/120);
end
err_11 = abs(y_1(16) - P_11(16));   % err_11 = 0.4280
% Plot data
figure(7);
plot(t_1,y_1,'-k','MarkerSize',30);  hold on;
plot(t_1,P_11,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
legend('true value)','approx h=1')

% h = 0.1
h = 0.1;
t_2 = 0:h:40;
y_2 = 5*120./(5+(120-5)*exp(-0.25*t_2));
N = length(t_2);
% Compute 
P_22 = zeros(N,1);
P_22(1) = 5;
P_22(2) = 6.1979;
for j = 3:N
    P_22(j) = P_22(j-2) + 2*h*0.25*P_22(j-1)*(1-P_22(j-1)/120);
end
err_22 = abs(y_2(160) - P_22(160));  % err_22 = 1.1374
% Plot data
figure(8);
plot(t_2,y_2,'-k','MarkerSize',30);  hold on;
plot(t_2,P_22,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
legend('true value)','approx h=0.1')

% h = 0.01
h = 0.01;
t_3 = 0:h:40;
y_3 = 5*120./(5+(120-5)*exp(-0.25*t_3));
N = length(t_3);
% Compute 
P_33 = zeros(N,1);
P_33(1) = 5;
P_33(2) = 6.1979;
for j = 3:N
    P_33(j) = P_33(j-1) + h*0.25*P_33(j-1)*(1-P_33(j-1)/120);
end
err_33 = abs(y_3(1600) - P_33(1600));  % err_33 = 1.2238

% Plot data
figure(9);
plot(t_3,y_3,'-k','MarkerSize',30);  hold on;
plot(t_3,P_33,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
legend('true value)','approx h=0.01')

% h = 0.001
h = 0.001;
t_4 = 0:h:40;
y_4 = 5*120./(5+(120-5)*exp(-0.25*t_4));
N = length(t_4);
% Compute 
P_44 = zeros(N,1);
P_44(1) = 5;
P_44(2) = 6.1979;
for j = 3:N
    P_44(j) = P_44(j-1) + h*0.25*P_44(j-1)*(1-P_44(j-1)/120);
end
err_44 = abs(y_4(16000) - P_44(16000));  % err_44 = 1.2005

% Plot data
figure(10);
plot(t_4,y_4,'-k','MarkerSize',30);  hold on;
plot(t_4,P_44,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
legend('true value)','approx h=0.001')

% h = 0.0001
h = 0.0001;
t_5 = 0:h:40;
y_5 = 5*120./(5+(120-5)*exp(-0.25*t_5));
N = length(t_5);
% Compute 
P_55 = zeros(N,1);
P_55(1) = 5;
P_55(2) = 6.1979;
for j = 3:N
    P_55(j) = P_55(j-1) + h*0.25*P_55(j-1)*(1-P_55(j-1)/120);
end
err_55 = abs(y_5(160000) - P_55(160000));  % err_55 = 1.1982

% Plot data
figure(11);
plot(t_5,y_5,'-k','MarkerSize',30);  hold on;
plot(t_5,P_55,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
legend('true value)','approx h=0.0001')
