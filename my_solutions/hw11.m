%Homework 11

% Question 1
% Part b
% h =0.2
h = 0.2;
t_1 = 1:h:2;
f = @(t,y) y./t-y^2./(t^2);
N = length(t_1);
yval_1 = t_1./(1+log(t_1));% solution y(t)

y_1 = zeros(N,1);% approximate using AB2
y_1(1) = 1;
y_1(2) = (1+h)./(1+log(1+h));
for j = 3:N
    y_1(j) = y_1(j-1) - h*0.5*f(t_1(j-2),y_1(j-2)) + 3*h*0.5*f(t_1(j-1),y_1(j-1));
end
err_1 = abs(y_1(N) - yval_1(N));  % err_1 = 0.0097

% Plot data
figure(1);
plot(t_1,yval_1,'-k','MarkerSize',30);  hold on;
plot(t_1,y_1,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
legend('true value','approx h=0.2')


% h =0.1
h = 0.1;
t_2 = 1:h:2;
f = @(t,y) y./t-y^2./(t^2);
N = length(t_2);
yval_2 = t_2./(1+log(t_2));% solution y(t)

y_2 = zeros(N,1);% approximate using AB2
y_2(1) = 1;
y_2(2) = (1+h)./(1+log(1+h));
for j = 3:N
    y_2(j) = y_2(j-1) - h*0.5*f(t_2(j-2),y_2(j-2)) + 3*h*0.5*f(t_2(j-1),y_2(j-1));
end
err_2 = abs(y_2(N) - yval_2(N));  % err_2 = 0.0028

% Plot data
figure(2);
plot(t_2,yval_2,'-k','MarkerSize',30);  hold on;
plot(t_2,y_2,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
legend('true value','approx h=0.1')


% h =0.05
h = 0.05;
t_3 = 1:h:2;
f = @(t,y) y./t-y^2./(t^2);
N = length(t_3);
yval_3 = t_3./(1+log(t_3));% solution y(t)

y_3 = zeros(N,1);% approximate using AB2
y_3(1) = 1;
y_3(2) = (1+h)./(1+log(1+h));
for j = 3:N
    y_3(j) = y_3(j-1) - h*0.5*f(t_3(j-2),y_3(j-2)) + 3*h*0.5*f(t_3(j-1),y_3(j-1));
end
err_3 = abs(y_3(N) - yval_3(N));  % err_3 = 7.5204e-4

% Plot data
figure(3);
plot(t_3,yval_3,'-k','MarkerSize',30);  hold on;
plot(t_3,y_3,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
legend('true value','approx h=0.05')

% Question 2
% Part b
ode_1 =@(t,y) -(y-cos(t)-sin(t));
y0_1 = 2.5;
tspan_1 = [0,100];
[t,y_1] = ode45(ode_1,tspan_1,y0_1);
figure(1);
plot(t,y_1,'-k'); 
legend('ode45 lamda=-1')
[t,y_2] = ode15s(ode_1,tspan_1,y0_1);
figure(2);
plot(t,y_2,'-o');
legend('ode15s lamda=-1')

% Part b
ode_1 =@(t,y) -5*(y-cos(t)-sin(t));
y0_1 = 2.5;
tspan_1 = [0,100];
[t,y_3] = ode45(ode_1,tspan_1,y0_1);
figure(3);
plot(t,y_3,'-k'); 
legend('ode45 lamda=-5')
[t,y_4] = ode15s(ode_1,tspan_1,y0_1);
figure(4);
plot(t,y_4,'-o');
legend('ode15s lamda=-5')

% Part b
ode_1 =@(t,y) -5000*(y-cos(t)-sin(t));
y0_1 = 2.5;
tspan_1 = [0,100];
[t,y_5] = ode45(ode_1,tspan_1,y0_1);
figure(5);
plot(t,y_5,'-k'); 
legend('ode45 lamda=-5000')
[t,y_6] = ode15s(ode_1,tspan_1,y0_1);
figure(6);
plot(t,y_6,'-o');
legend('ode15s lamda=-5000')

