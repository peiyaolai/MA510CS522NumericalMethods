% MA 510 / CS 522: Numerical Methods
% Instructor: Andrea Arnold
% 
% Natural vs. clamped cubic spline example

clear; close all; clc

% Compare the natural vs. clamped spline interpolants for f(x) = cos(x^2) 
% for various node locations

% Data points
xpts = [0 0.1 0.7 1]; %[0 0.5 1 2]; %[0 0.3 0.6 0.9];
ypts = cos(xpts.^2);

f_true = @(x) cos(x.^2);
f_p = @(x) -2*x.*sin(x.^2);


% Initialize h, a coefficients
N = length(xpts); % number of data points N = n+1

h = diff(xpts);  % h values (step sizes between nodes)
a_coeff = ypts;  % a_j spline coefficients


%% Natural Spline

% Build A (size NxN), b (size Nx1)
A = [1 0 0 0; ...
    h(1) 2*(h(1)+h(2)) h(2) 0; ...
    0 h(2) 2*(h(2)+h(3)) h(3); ...
    0 0 0 1];

b = [0; ...
    3/h(2)*(a_coeff(3)-a_coeff(2)) - 3/h(1)*(a_coeff(2)-a_coeff(1)); ...
    3/h(3)*(a_coeff(4)-a_coeff(3)) - 3/h(2)*(a_coeff(3)-a_coeff(2)); ...
    0];

% Solve for c_coeff
c_coeff = A\b;  % inv(A)*b

% Compute b_coeff and d_coeff
b_coeff = zeros(N-1,1);
d_coeff = zeros(N-1,1);
for j = 1:N-1
    b_coeff(j) = 1/h(j)*(a_coeff(j+1)-a_coeff(j))-h(j)/3*(2*c_coeff(j)+c_coeff(j+1));
    d_coeff(j) = (c_coeff(j+1)-c_coeff(j))/(3*h(j));
end

% Build spline
xeval = linspace(xpts(1),xpts(end),200);
S_val = zeros(size(xeval));
for i = 1:length(xeval)
    if ( xpts(1) <= xeval(i) && xeval(i) < xpts(2) )
        S_val(i) = a_coeff(1) + b_coeff(1)*(xeval(i)-xpts(1))...
            + c_coeff(1)*(xeval(i)-xpts(1))^2 + d_coeff(1)*(xeval(i)-xpts(1))^3;
    elseif ( xpts(2) <= xeval(i) && xeval(i) < xpts(3) )
        S_val(i) = a_coeff(2) + b_coeff(2)*(xeval(i)-xpts(2))...
            + c_coeff(2)*(xeval(i)-xpts(2))^2 + d_coeff(2)*(xeval(i)-xpts(2))^3;
    elseif ( xpts(3) <= xeval(i) && xeval(i) <= xpts(4) )
        S_val(i) = a_coeff(3) + b_coeff(3)*(xeval(i)-xpts(3))...
            + c_coeff(3)*(xeval(i)-xpts(3))^2 + d_coeff(3)*(xeval(i)-xpts(3))^3;
    end
end


% Plot data, resulting spline
figure(1);
plot(xpts,ypts,'.k','MarkerSize',30); hold on;
plot(xeval,f_true(xeval),'--k','LineWidth',1);
plot(xeval,S_val,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
title('Natural Spline');


%% Clamped Spline

% Build A (size NxN), b (size Nx1)
A = [2*h(1) h(1) 0 0; ...
    h(1) 2*(h(1)+h(2)) h(2) 0; ...
    0 h(2) 2*(h(2)+h(3)) h(3); ...
    0 0 h(3) 2*h(3)];

b = [3/h(1)*(a_coeff(2)-a_coeff(1)) - 3*f_p(xpts(1)); ...
    3/h(2)*(a_coeff(3)-a_coeff(2)) - 3/h(1)*(a_coeff(2)-a_coeff(1)); ...
    3/h(3)*(a_coeff(4)-a_coeff(3)) - 3/h(2)*(a_coeff(3)-a_coeff(2)); ...
    3*f_p(xpts(end)) - 3/h(3)*(a_coeff(4)-a_coeff(3))];

% Solve for c_coeff
c_coeff = A\b;  % inv(A)*b

% Compute b_coeff and d_coeff
b_coeff = zeros(N-1,1);
d_coeff = zeros(N-1,1);
for j = 1:N-1
    b_coeff(j) = 1/h(j)*(a_coeff(j+1)-a_coeff(j))-h(j)/3*(2*c_coeff(j)+c_coeff(j+1));
    d_coeff(j) = (c_coeff(j+1)-c_coeff(j))/(3*h(j));
end

% Build spline
xeval = linspace(xpts(1),xpts(end),200);
S_val = zeros(size(xeval));
for i = 1:length(xeval)
    if ( xpts(1) <= xeval(i) && xeval(i) < xpts(2) )
        S_val(i) = a_coeff(1) + b_coeff(1)*(xeval(i)-xpts(1))...
            + c_coeff(1)*(xeval(i)-xpts(1))^2 + d_coeff(1)*(xeval(i)-xpts(1))^3;
    elseif ( xpts(2) <= xeval(i) && xeval(i) < xpts(3) )
        S_val(i) = a_coeff(2) + b_coeff(2)*(xeval(i)-xpts(2))...
            + c_coeff(2)*(xeval(i)-xpts(2))^2 + d_coeff(2)*(xeval(i)-xpts(2))^3;
    elseif ( xpts(3) <= xeval(i) && xeval(i) <= xpts(4) )
        S_val(i) = a_coeff(3) + b_coeff(3)*(xeval(i)-xpts(3))...
            + c_coeff(3)*(xeval(i)-xpts(3))^2 + d_coeff(3)*(xeval(i)-xpts(3))^3;
    end
end


% Plot data, resulting spline
figure(2);
plot(xpts,ypts,'.k','MarkerSize',30); 
hold on;
plot(xeval,f_true(xeval),'--k','LineWidth',1);
plot(xeval,S_val,'-m','LineWidth',2); 
hold off;
set(gca,'FontSize',26);
title('Clamped Spline');


