% MA 510 / CS 522: Numerical Methods
% Instructor: Prof. Andrea Arnold
%
% Example: Use the Bisection method to determine an approximation to the
% root of f(x) = x^3 + 4x^2 - 10 in [1,2] with relative error within 10^(-4)

f = @(x) x.^3 + 4*x.^2 - 10;
a = 1;
b = 2;
tol = 1e-4;
maxiter = 100;

[p,iter,relerr] = bisection(f,a,b,tol,maxiter);

disp(['Approximate solution: ',num2str(p)])
disp(['Number of iterations: ',num2str(iter)])
disp(['Relative error: ',num2str(relerr)])