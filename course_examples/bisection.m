function [p,iter,relerr] = bisection(f,a,b,tol,maxiter)

% MA 510 / CS 522 
% Instructor: Prof. Andrea Arnold
%
% Function implementing the bisection method for solving the root-finding
% problem f(x) = 0 for a continuous function f on the closed interval [a,b]
%
% Need f(a) and f(b) to have different signs
%
% Input:  f   = nonlinear function
%         a   = left endpoint of x interval
%         b   = right endpoint of x interval
%         tol = tolerance for stopping criterion
%         maxiter = maximum number of iterations
%
% Output: p   = approximated root of f on [a,b]
%         iter = total number of iterations performed
%         relerr = resulting relative error


% Check if sign criteria to apply method is met
if ( sign(f(a))*sign(f(b))>=0 )
    % Signs of f(a), f(b) do not differ
    disp('Bisection method not guaranteed to converge.')
else
    % Initialize bisection method
    p_curr = a + (b-a)/2; % first p value
    iter   = 0;
    relerr = inf;
    
    % Apply bisection method, using relative error as stopping criterion
    while ( relerr >= tol && iter<maxiter )
        % Update iteration
        iter = iter + 1;
        
        % Check signs to pick next subinterval
        if ( sign(f(a))*sign(f(p_curr))<0 )
            b = p_curr;
        else
            a = p_curr;
        end
        
        % Update relative error, p value for next iteration
        p_new  = a + (b-a)/2;
        relerr = abs(p_new-p_curr)/abs(p_new);
        p_curr = p_new;
    end
end

% Final approximation
p = p_new;

