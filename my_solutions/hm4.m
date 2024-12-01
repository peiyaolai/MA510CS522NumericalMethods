% MA 510 / CS 522: Numerical Methods

% Homework 4 problem 1b

% using the Jacob's method
T_1 = [0 -1/4 1/4 -1/4; -1/4 0 1/4 1/4; 1/5 1/5 0 -1/5;-1/3 1/3 -1/3 0];
c_1 = [-1/2;-1/4;0;1/3];
x_curr = [0;0;0;0]; % first x value
iter   = 0;
relerr = inf;
maxiter = 500; 
tol = 1e-5;
while ( relerr >= tol && iter<maxiter )
        % Update iteration
        iter = iter + 1;
        x_new = T_1*x_curr + c_1;
        x_diff = x_new-x_curr;
        relerr = norm(x_diff,Inf);%infinity norm
        x_curr = x_new;
end
x_jacob = x_new;
disp(['Number of iterations: ',num2str(iter)]) % result is 22

% using the Gauss-Seidel method
T_2 = [0 -1/4 1/4 -1/4; 0 1/16 3/16 5/16;0 -3/80 7/80 -3/80;0 7/60 -1/20 1/4];
c_2 = [-1/2;-1/8;-1/8;1/2];
x_curr = [0;0;0;0]; % first x value
iter   = 0;
relerr = inf;
maxiter = 500; 
tol = 1e-5;
while ( relerr >= tol && iter<maxiter )
        % Update iteration
        iter = iter + 1;
        x_new = T_2*x_curr + c_2;
        x_diff = x_new-x_curr;
        relerr = norm(x_diff,Inf);%infinity norm
        x_curr = x_new;
end
x_gs = x_new;
disp(['Number of iterations: ',num2str(iter)]) % result is 22

% Homework 4 problem 2
%using the Newton's method for three dimensions
x_curr = [1;1;-1]; % first x value
iter   = 0;
relerr = inf;
maxiter = 700;
tol = 1e-5;
while ( relerr >= tol && iter<maxiter )
        % Update iteration
        iter = iter + 1;
        F = [3*x_curr(1)-cos(x_curr(2)*x_curr(3))-1/2;x_curr(1)^2-625*x_curr(2)^2-1/4;exp(-x_curr(1)*x_curr(2))+20*x_curr(3)+(10*pi-3)/3]; 
        J = [3 x_curr(3)*sin(x_curr(2)*x_curr(3)) x_curr(2)*sin(x_curr(2)*x_curr(3));2*x_curr(1) -1250*x_curr(2) 0;-x_curr(2)*exp(-x_curr(1)*x_curr(2)) -x_curr(1)*exp(-x_curr(1)*x_curr(2)) 20];
        x_new = x_curr - F\J;
        x_diff = x_new-x_curr;
        relerr = norm(x_diff,Inf);
        x_curr = x_new;
end
x_n = x_new;
disp(['Number of iterations: ',num2str(iter)]) % result is 17

%using the Newton's method with a different initial point
x_curr = [1;0;-1]; % first x value
iter   = 0;
relerr = inf;
maxiter = 700;
tol = 1e-5;
while ( relerr >= tol && iter<maxiter )
        % Update iteration
        iter = iter + 1;
        F = [3*x_curr(1)-cos(x_curr(2)*x_curr(3))-1/2;x_curr(1)^2-625*x_curr(2)^2-1/4;exp(-x_curr(1)*x_curr(2))+20*x_curr(3)+(10*pi-3)/3]; 
        J = [3 x_curr(3)*sin(x_curr(2)*x_curr(3)) x_curr(2)*sin(x_curr(2)*x_curr(3));2*x_curr(1) -1250*x_curr(2) 0;-x_curr(2)*exp(-x_curr(1)*x_curr(2)) -x_curr(1)*exp(-x_curr(1)*x_curr(2)) 20];
        x_new = x_curr - F\J;
        x_diff = x_new-x_curr;
        relerr = norm(x_diff,Inf);
        x_curr = x_new;
end
x_m = x_new;
disp(['Number of iterations: ',num2str(iter)]) % does not converge

