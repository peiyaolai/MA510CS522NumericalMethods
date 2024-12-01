% MA 510 / CS 522: Numerical Methods
% Instructor: Prof. Andrea Arnold
%
% Example: Lagrange interpolating polynomial approximation

clear; close all; clc

% Example: f(x) = cos(x)

% Given data points
xpts  = [0 0.6 0.9];
ypts  = cos(xpts);

% Value at which to approximate f(x)
xeval = 0.45;

% Call function to generate Lagrange polynomial 
poly_approx = lagrange(xpts,ypts,xeval);

disp(' ')
disp(poly_approx)


% Can also compute polynomial approximations at a range of x values over 
% the interpolation interval
dx    = 0.01;  % play with choice of dx
xeval = xpts(1):dx:xpts(end); 

% Call function to generate Lagrange polynomial 
poly = lagrange(xpts,ypts,xeval);

% Plot results and data points
figure(1);
plot(xeval,poly,'-k','LineWidth',3); hold on;
plot(xpts,ypts,'.r','MarkerSize',30); hold off

% Also make table of results
disp(' ')
disp([xeval',poly'])

