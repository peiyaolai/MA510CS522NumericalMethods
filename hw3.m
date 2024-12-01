% MA 510 / CS 522: Numerical Methods
% Homework 3 problem 2a

% using the only bisection method
% the rate of convergence is slow
f = @(x) sin(x) - cos(x) ;
f_p = @(x) cos(x) + sin(x);
a = -1;
b = 3;
tol = 1e-6;
maxiter = 50;
[p,iter,relerr] = bisection(f,a,b,tol,maxiter);
p_b = p;
disp(['Approximate solution: ',num2str(p_b)]) % result is 0.7853980
disp(['Number of iterations: ',num2str(iter)]) % result is 22
disp(['Relative error: ',num2str(relerr)]) % result is6.07e-07


% using the hybrid scheme
% the rate of convergence is very fast
f = @(x) sin(x) - cos(x) ;
f_p = @(x) cos(x) + sin(x);
a = -1;
b = 3;
tol = 1e-6;
maxiter = 8; %use 8 iteration bisectin method for global step 
[p,iter,relerr] = bisection(f,a,b,tol,maxiter);
p_b1 = p;
disp(['Approximate solution: ',num2str(p_b1)]) % result is 0.78906250
disp(['Number of iterations: ',num2str(iter)]) % result is 8
disp(['Relative error: ',num2str(relerr)]) % result is 0.009901
p_curr = p; % first p value
iter   = 0;
relerr = inf;
maxiter = 50; 
while ( relerr >= tol && iter<maxiter )
        % Update iteration
        iter = iter + 1;
        p_new = p_curr - f(p_curr)./f_p(p_curr);
        relerr = abs(p_new-p_curr)/abs(p_new);
        p_curr = p_new;
end
p_h = p_new; % derive a more closer initial approximation for Newton's method
disp(['Approximate solution: ',num2str(p_h)]) % result is 0.7853982
disp(['Number of iterations: ',num2str(iter)]) % result is 2, so total number of iteration is 10
disp(['Relative error: ',num2str(relerr)]) % result is 2.0882e-08


% using the only Newton's method
% the rate of convergence is fast but the result is not accurate
p_curr = 2; % first p value
iter   = 0;
relerr = inf;
maxiter = 50;
tol = 1e-6;
f = @(x) sin(x) - cos(x) ;
f_p = @(x) cos(x) + sin(x);

while ( relerr >= tol && iter<maxiter )
        % Update iteration
        iter = iter + 1;
        p_new = p_curr - f(p_curr)./f_p(p_curr);
        relerr = abs(p_new-p_curr)/abs(p_new);
        p_curr = p_new;
end
p_n = p_new;
disp(['Approximate solution: ',num2str(p_n)]) % result is 10.2101761
disp(['Number of iterations: ',num2str(iter)]) % result is 6
disp(['Relative error: ',num2str(relerr)]) % result is 2.2717e-11


% Homework 3 problem 2b for p_0 = 2

% using the only bisection method
% the rate of convergence is slow
f = @(x) x^3 - 7*x^2 + 11*x -5 ;
f_p = @(x) 3*x^2 - 14*x +11;
a = 2;
b = 9;
tol = 1e-6;
maxiter = 50;
[p,iter,relerr] = bisection(f,a,b,tol,maxiter);
p_b = p;
disp(['Approximate solution: ',num2str(p_b)]) % result is 4.9999986
disp(['Number of iterations: ',num2str(iter)]) % result is 20
disp(['Relative error: ',num2str(relerr)]) % result is 6.6757e-07


% using the hybrid scheme
% the rate of convergence is very fast
f = @(x) x^3 - 7*x^2 + 11*x -5 ;
f_p = @(x) 3*x^2 - 14*x +11;
a = 2;
b = 9;
tol = 1e-6;
maxiter = 8; %use 8 iteration bisectin method for global step  
[p,iter,relerr] = bisection(f,a,b,tol,maxiter);
p_b1 = p;
disp(['Approximate solution: ',num2str(p_b1)]) % result is 4.9941406
disp(['Number of iterations: ',num2str(iter)]) % result is 8
disp(['Relative error: ',num2str(relerr)]) % result is 0.0027376
p_curr = p; % first p value
iter   = 0;
relerr = inf;
maxiter = 50; 
while ( relerr >= tol && iter<maxiter )
        % Update iteration
        iter = iter + 1;
        p_new = p_curr - f(p_curr)./f_p(p_curr);
        relerr = abs(p_new-p_curr)/abs(p_new);
        p_curr = p_new;
end
p_h = p_new; % derive a more closer initial approximation for Newton's method
disp(['Approximate solution: ',num2str(p_h)]) % result is 5.0000000
disp(['Number of iterations: ',num2str(iter)]) % result is 3, so total number of iteration is 11
disp(['Relative error: ',num2str(relerr)]) % result is 2.9728e-11


% using the only Newton's method
% the rate of convergence is fast but the result is not accurate
p_curr = 2; % first p value
iter   = 0;
relerr = inf;
maxiter = 50;
tol = 1e-6;
f = @(x) x^3 - 7*x^2 + 11*x -5 ;
f_p = @(x) 3*x^2 - 14*x +11;
while ( relerr >= tol && iter<maxiter )
        % Update iteration
        iter = iter + 1;
        p_new = p_curr - f(p_curr)./f_p(p_curr);
        relerr = abs(p_new-p_curr)/abs(p_new);
        p_curr = p_new;
end
p_n = p_new;
disp(['Approximate solution: ',num2str(p_n)]) % result is 1.000001
disp(['Number of iterations: ',num2str(iter)]) % result is 20
disp(['Relative error: ',num2str(relerr)]) % result is 6.837e-07


% Homework 3 problem 2b for p_1 = 7

% using the only bisection method
% the rate of convergence is slow
f = @(x) x^3 - 7*x^2 + 11*x -5 ;
f_p = @(x) 3*x^2 - 14*x +11;
a = 2;
b = 9;
tol = 1e-6;
maxiter = 50;
[p,iter,relerr] = bisection(f,a,b,tol,maxiter);
p_b = p;
disp(['Approximate solution: ',num2str(p_b)]) % result is 4.9999986
disp(['Number of iterations: ',num2str(iter)]) % result is 20
disp(['Relative error: ',num2str(relerr)]) % result is6.6757e-07


% using the hybrid scheme
% the rate of convergence is very fast
f = @(x) x^3 - 7*x^2 + 11*x -5 ;
f_p = @(x) 3*x^2 - 14*x +11;
a = 2;
b = 9;
tol = 1e-6;
maxiter = 8; %use 8 iteration bisectin method for global step 
[p,iter,relerr] = bisection(f,a,b,tol,maxiter);
p_b1 = p;
disp(['Approximate solution: ',num2str(p_b1)]) % result is 4.9941406
disp(['Number of iterations: ',num2str(iter)]) % result is 8
disp(['Relative error: ',num2str(relerr)]) % result is 0.0027376
p_curr = p; % first p value
iter   = 0;
relerr = inf;
maxiter = 50; 
while ( relerr >= tol && iter<maxiter )
        % Update iteration
        iter = iter + 1;
        p_new = p_curr - f(p_curr)./f_p(p_curr);
        relerr = abs(p_new-p_curr)/abs(p_new);
        p_curr = p_new;
end
p_h = p_new; % derive a more closer initial approximation for Newton's method
disp(['Approximate solution: ',num2str(p_h)]) % result is 5.0000000
disp(['Number of iterations: ',num2str(iter)]) % result is 3, so total number of iteration is 11
disp(['Relative error: ',num2str(relerr)]) % result is 2.9728e-11


% using the only Newton's method
% the rate of convergence is fast and the result is accurate
p_curr = 7; % first p value
iter   = 0;
relerr = inf;
maxiter = 50;
tol = 1e-6;
f = @(x) x^3 - 7*x^2 + 11*x -5 ;
f_p = @(x) 3*x^2 - 14*x +11;
while ( relerr >= tol && iter<maxiter )
        % Update iteration
        iter = iter + 1;
        p_new = p_curr - f(p_curr)./f_p(p_curr);
        relerr = abs(p_new-p_curr)/abs(p_new);
        p_curr = p_new;
end
p_n = p_new;
disp(['Approximate solution: ',num2str(p_n)]) % result is 5.000000
disp(['Number of iterations: ',num2str(iter)]) % result is 6
disp(['Relative error: ',num2str(relerr)]) % result is 2.2282e-09