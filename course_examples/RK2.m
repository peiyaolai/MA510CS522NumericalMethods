function y = RK2(f,t,y0)

% MA 510 / CS 522: Numerical Methods
% Instructor: Prof. Andrea Arnold
%
% Function to compute RK2 approximation of solution to IVP y'=f(t,y) with
% initial value y0 for t over the interval [a,b]
%
% Input: f  = RHS function of DE
%        t  = mesh points of t values over the interval [a,b]
%        y0 = initial value
%
% Output: y = RK2 approximation of solution to IVP

h = t(end)-t(end-1);  % step size
N = length(t);  % number of points in mesh / approximation

y = NaN(N,1);
y(1) = y0;

for i = 1:N-1
    t_half = t(i)+h/2; % time points halway between mesh points
    y(i+1) = y(i) + h*f([t_half,y(i)+h/2*f([t(i),y(i)])]);  % RK2 formula
end

