% Homework 7 question one 
% part a and b
% data set
x = [4.0;4.2;4.5;4.7;5.1;5.5;5.9;6.3;6.8;7.1];
y = [102.56;113.18;130.11;142.05;167.53;195.14;224.87;256.73;299.50;326.72]; 

N = length(x);

s = x.*x;
w = s.*x;
z = log(y);
u = log(x);
t = [1;1;1;1;1;1;1;1;1;1];
Y = [t x];
Z = [t u];
X = [t x s];
W = [t x s w];

% Least square estimator for degree one 
theta_1 = (Y'*Y)\(Y'*y);
f_1 = theta_1(2)*x+theta_1(1);
err_1 = sum((y-f_1).*(y-f_1)); % err_1 = 329.0132

% Least square estimator for degree two
theta_2 = (X'*X)\(X'*y);
f_2 = theta_2(3)*x.*x+theta_2(2)*x+theta_2(1);
err_2 = sum((y-f_2).*(y-f_2)); % err_2 = 0.0014

% Least square estimator for degree three
theta_3 = (W'*W)\(W'*y);
f_3 = theta_3(4)*x.*x.*x+theta_3(3)*x.*x+theta_3(2)*x+theta_3(1);
err_3 = sum((y-f_3).*(y-f_3)); % err_3 = 5.2734e-04


% part c
% Least square estimator for y = be^(ax)
theta_4 = (Y'*Y)\(Y'*z);
f_4 = exp(theta_4(2).*x+theta_4(1));
err_4 = sum((y-f_4).*(y-f_4)); % err_4 = 417.6910

% Least square estimator for y = bx^a
theta_5 = (Z'*Z)\(Z'*z);
f_5 = exp(theta_5(2).*u+theta_5(1));
err_5 = sum((y-f_5).*(y-f_5)); % err_5 = 0.0070

% Plot results and data points
figure(1);
plot(x,y,'.b','MarkerSize',30);hold on;
plot(x,f_1,'-r','LineWidth',2); hold on;    % degree one
plot(x,f_2,'-.og','LineWidth',2);hold on;   % degree two
plot(x,f_3,'--dc','LineWidth',2); hold on; % degree three
plot(x,f_4,'-sm','LineWidth',2); hold on;    % y = be^(ax)
plot(x,f_5,'-*k','LineWidth',2);hold off;   % y = bx^a
grid on;
set(gca,'FontSize',26);

h = 0.001;       % step size
X = -pi:h:pi;    % domain
f = sin(X);      % range
Y = diff(f)/h;   % first derivative
Z = diff(Y)/h;   % second derivative
plot(X(:,1:length(Y)),Y,'r',X,f,'b', X(:,1:length(Z)),Z,'k')