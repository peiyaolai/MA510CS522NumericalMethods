% MA 510 / CS 522: Numerical Methods
% Instructor: Prof. Andrea Arnold
%
% Linear Least Squares example

clear; close all; clc

% Data points
xpts = [0.5 1 2]';
ypts = [1 2.2 1.29]';

% Solve LS problem
X = [ones(3,1) xpts xpts.^2]; % design matrix
theta = (X'*X)\(X'*ypts)

f_model = @(x) theta(1)+theta(2)*x+theta(3)*x.^2;

figure(1);
plot(xpts,ypts,'.k','MarkerSize',30);
hold on;
plot(0:.1:3,f_model(0:.1:3),'-r','LineWidth',2);
hold off;

