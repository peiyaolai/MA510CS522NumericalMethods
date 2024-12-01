% MA 510 / CS 522: Numerical Methods
%Homework 6 
% Question 3

% Data points
x = [0.9 1.3 1.9 2.1 2.6 3.0 3.9 4.4 4.7 5.0 6.0 7.0 8.0 9.2 10.5 11.3 ...
    11.6 12.0 12.6 13.0 13.3];

y = [1.3 1.5 1.85 2.1 2.6 2.7 2.4 2.15 2.05 2.1 2.25 2.3 2.25 1.95 1.4 0.9 ...
    0.7 0.6 0.5 0.4 0.25];

N = length(x); % number of data points N = 21

h = diff(x);  % h values (step sizes between nodes)
a_coeff = y;  % a_j spline coefficients

% Build A (size 21x21), b (size 21x1)
A = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ; ...
    h(1) 2*(h(1)+h(2)) h(2) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ; ...
    0 h(2) 2*(h(2)+h(3)) h(3) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ; ...
    0 0 h(3) 2*(h(3)+h(4)) h(4) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ; ...
    0 0 0 h(4) 2*(h(4)+h(5)) h(5) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ; ...
    0 0 0 0 h(5) 2*(h(5)+h(6)) h(6) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ; ...
    0 0 0 0 0 h(6) 2*(h(6)+h(7)) h(7) 0 0 0 0 0 0 0 0 0 0 0 0 0 ; ...
    0 0 0 0 0 0 h(7) 2*(h(7)+h(8)) h(8) 0 0 0 0 0 0 0 0 0 0 0 0 ; ...
    0 0 0 0 0 0 0 h(8) 2*(h(8)+h(9)) h(9) 0 0 0 0 0 0 0 0 0 0 0 ; ...
    0 0 0 0 0 0 0 0 h(9) 2*(h(9)+h(10)) h(10) 0 0 0 0 0 0 0 0 0 0 ; ...
    0 0 0 0 0 0 0 0 0 h(10) 2*(h(10)+h(11)) h(11) 0 0 0 0 0 0 0 0 0 ; ...
    0 0 0 0 0 0 0 0 0 0 h(11) 2*(h(11)+h(12)) h(12) 0 0 0 0 0 0 0 0 ; ...
    0 0 0 0 0 0 0 0 0 0 0 h(12) 2*(h(12)+h(13)) h(13) 0 0 0 0 0 0 0 ; ...
    0 0 0 0 0 0 0 0 0 0 0 0 h(13) 2*(h(13)+h(14)) h(14) 0 0 0 0 0 0 ; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 h(14) 2*(h(14)+h(15)) h(15) 0 0 0 0 0 ; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 h(15) 2*(h(15)+h(16)) h(16) 0 0 0 0 ; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 h(16) 2*(h(16)+h(17)) h(17) 0 0 0 ; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 h(17) 2*(h(17)+h(18)) h(18) 0 0 ; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 h(18) 2*(h(18)+h(19)) h(19) 0 ; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 h(19) 2*(h(19)+h(20)) h(20) ; ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1];

b = [0; ...
    3/h(2)*(a_coeff(3)-a_coeff(2)) - 3/h(1)*(a_coeff(2)-a_coeff(1)); ...
    3/h(3)*(a_coeff(4)-a_coeff(3)) - 3/h(2)*(a_coeff(3)-a_coeff(2)); ...
    3/h(4)*(a_coeff(5)-a_coeff(4)) - 3/h(1)*(a_coeff(4)-a_coeff(3)); ...
    3/h(5)*(a_coeff(6)-a_coeff(5)) - 3/h(2)*(a_coeff(5)-a_coeff(4)); ...
    3/h(6)*(a_coeff(7)-a_coeff(6)) - 3/h(1)*(a_coeff(6)-a_coeff(5)); ...
    3/h(7)*(a_coeff(8)-a_coeff(7)) - 3/h(2)*(a_coeff(7)-a_coeff(6)); ...
    3/h(8)*(a_coeff(9)-a_coeff(8)) - 3/h(1)*(a_coeff(8)-a_coeff(7)); ...
    3/h(9)*(a_coeff(10)-a_coeff(9)) - 3/h(2)*(a_coeff(9)-a_coeff(8)); ...
    3/h(10)*(a_coeff(11)-a_coeff(10)) - 3/h(1)*(a_coeff(10)-a_coeff(9)); ...
    3/h(11)*(a_coeff(12)-a_coeff(11)) - 3/h(2)*(a_coeff(11)-a_coeff(10)); ...
    3/h(12)*(a_coeff(13)-a_coeff(12)) - 3/h(1)*(a_coeff(12)-a_coeff(11)); ...
    3/h(13)*(a_coeff(14)-a_coeff(13)) - 3/h(2)*(a_coeff(13)-a_coeff(12)); ...
    3/h(14)*(a_coeff(15)-a_coeff(14)) - 3/h(1)*(a_coeff(14)-a_coeff(13)); ...
    3/h(15)*(a_coeff(16)-a_coeff(15)) - 3/h(2)*(a_coeff(15)-a_coeff(14)); ...
    3/h(16)*(a_coeff(17)-a_coeff(16)) - 3/h(1)*(a_coeff(16)-a_coeff(15)); ...
    3/h(17)*(a_coeff(18)-a_coeff(17)) - 3/h(2)*(a_coeff(17)-a_coeff(16)); ...
    3/h(18)*(a_coeff(19)-a_coeff(18)) - 3/h(1)*(a_coeff(18)-a_coeff(17)); ...
    3/h(19)*(a_coeff(20)-a_coeff(19)) - 3/h(2)*(a_coeff(19)-a_coeff(18)); ...
    3/h(20)*(a_coeff(21)-a_coeff(20)) - 3/h(1)*(a_coeff(20)-a_coeff(19)); ...
    0];

% Solve for c_coeff
c_coeff = A\b;  

% Compute b_coeff and d_coeff
b_coeff = zeros(N-1,1);
d_coeff = zeros(N-1,1);
for j = 1:N-1
    b_coeff(j) = 1/h(j)*(a_coeff(j+1)-a_coeff(j))-h(j)/3*(2*c_coeff(j)+c_coeff(j+1));
    d_coeff(j) = (c_coeff(j+1)-c_coeff(j))/(3*h(j));
end

% Build spline
xeval = linspace(x(1),x(end),300);
S_val = zeros(size(xeval));
for i = 1:length(xeval)
    if ( x(1) <= xeval(i) && xeval(i) < x(2) )
        S_val(i) = a_coeff(1) + b_coeff(1)*(xeval(i)-x(1))...
            + c_coeff(1)*(xeval(i)-x(1))^2 + d_coeff(1)*(xeval(i)-x(1))^3;
    elseif ( x(2) <= xeval(i) && xeval(i) < x(3) )
        S_val(i) = a_coeff(2) + b_coeff(2)*(xeval(i)-x(2))...
            + c_coeff(2)*(xeval(i)-x(2))^2 + d_coeff(2)*(xeval(i)-x(2))^3;
    elseif ( x(3) <= xeval(i) && xeval(i) <= x(4) )
        S_val(i) = a_coeff(3) + b_coeff(3)*(xeval(i)-x(3))...
            + c_coeff(3)*(xeval(i)-x(3))^2 + d_coeff(3)*(xeval(i)-x(3))^3;
    elseif ( x(4) <= xeval(i) && xeval(i) < x(5) )
        S_val(i) = a_coeff(4) + b_coeff(4)*(xeval(i)-x(4))...
            + c_coeff(4)*(xeval(i)-x(4))^2 + d_coeff(4)*(xeval(i)-x(4))^3;
    elseif ( x(5) <= xeval(i) && xeval(i) <= x(6) )
        S_val(i) = a_coeff(5) + b_coeff(5)*(xeval(i)-x(5))...
            + c_coeff(5)*(xeval(i)-x(5))^2 + d_coeff(5)*(xeval(i)-x(5))^3;
    elseif ( x(6) <= xeval(i) && xeval(i) < x(7) )
        S_val(i) = a_coeff(6) + b_coeff(6)*(xeval(i)-x(6))...
            + c_coeff(6)*(xeval(i)-x(6))^2 + d_coeff(6)*(xeval(i)-x(6))^3;
    elseif ( x(7) <= xeval(i) && xeval(i) <= x(8) )
        S_val(i) = a_coeff(7) + b_coeff(7)*(xeval(i)-x(7))...
            + c_coeff(7)*(xeval(i)-x(7))^2 + d_coeff(7)*(xeval(i)-x(7))^3;
    elseif ( x(8) <= xeval(i) && xeval(i) < x(9) )
        S_val(i) = a_coeff(8) + b_coeff(8)*(xeval(i)-x(8))...
            + c_coeff(8)*(xeval(i)-x(8))^2 + d_coeff(8)*(xeval(i)-x(8))^3;
    elseif ( x(9) <= xeval(i) && xeval(i) <= x(10) )
        S_val(i) = a_coeff(9) + b_coeff(9)*(xeval(i)-x(9))...
            + c_coeff(9)*(xeval(i)-x(9))^2 + d_coeff(9)*(xeval(i)-x(9))^3;
    elseif ( x(10) <= xeval(i) && xeval(i) < x(11) )
        S_val(i) = a_coeff(10) + b_coeff(10)*(xeval(i)-x(10))...
            + c_coeff(10)*(xeval(i)-x(10))^2 + d_coeff(10)*(xeval(i)-x(10))^3;
    elseif ( x(11) <= xeval(i) && xeval(i) <= x(12) )
        S_val(i) = a_coeff(11) + b_coeff(11)*(xeval(i)-x(11))...
            + c_coeff(11)*(xeval(i)-x(11))^2 + d_coeff(11)*(xeval(i)-x(11))^3;
    elseif ( x(12) <= xeval(i) && xeval(i) < x(13) )
        S_val(i) = a_coeff(12) + b_coeff(12)*(xeval(i)-x(12))...
            + c_coeff(12)*(xeval(i)-x(12))^2 + d_coeff(12)*(xeval(i)-x(12))^3;
    elseif ( x(13) <= xeval(i) && xeval(i) <= x(14) )
        S_val(i) = a_coeff(13) + b_coeff(13)*(xeval(i)-x(13))...
            + c_coeff(13)*(xeval(i)-x(13))^2 + d_coeff(13)*(xeval(i)-x(13))^3;
    elseif ( x(14) <= xeval(i) && xeval(i) < x(15) )
        S_val(i) = a_coeff(14) + b_coeff(14)*(xeval(i)-x(14))...
            + c_coeff(14)*(xeval(i)-x(14))^2 + d_coeff(14)*(xeval(i)-x(14))^3;
    elseif ( x(15) <= xeval(i) && xeval(i) < x(16) )
        S_val(i) = a_coeff(15) + b_coeff(15)*(xeval(i)-x(15))...
            + c_coeff(15)*(xeval(i)-x(15))^2 + d_coeff(15)*(xeval(i)-x(15))^3;
    elseif ( x(16) <= xeval(i) && xeval(i) <= x(17) )
        S_val(i) = a_coeff(16) + b_coeff(16)*(xeval(i)-x(16))...
            + c_coeff(16)*(xeval(i)-x(16))^2 + d_coeff(16)*(xeval(i)-x(16))^3;
    elseif ( x(17) <= xeval(i) && xeval(i) < x(18) )
        S_val(i) = a_coeff(17) + b_coeff(17)*(xeval(i)-x(17))...
            + c_coeff(17)*(xeval(i)-x(17))^2 + d_coeff(17)*(xeval(i)-x(17))^3;
    elseif ( x(18) <= xeval(i) && xeval(i) < x(19) )
        S_val(i) = a_coeff(18) + b_coeff(18)*(xeval(i)-x(18))...
            + c_coeff(18)*(xeval(i)-x(18))^2 + d_coeff(18)*(xeval(i)-x(18))^3;
    elseif ( x(19) <= xeval(i) && xeval(i) <= x(20) )
        S_val(i) = a_coeff(19) + b_coeff(19)*(xeval(i)-x(19))...
            + c_coeff(19)*(xeval(i)-x(19))^2 + d_coeff(19)*(xeval(i)-x(19))^3;
    elseif ( x(20) <= xeval(i) && xeval(i) < x(21) )
        S_val(i) = a_coeff(20) + b_coeff(20)*(xeval(i)-x(20))...
            + c_coeff(20)*(xeval(i)-x(20))^2 + d_coeff(20)*(xeval(i)-x(20))^3;
    end
end


% Plot data, resulting spline
figure(1);
plot(x,y,'.k','MarkerSize',30); hold on;
grid on;
plot(xeval,S_val,'-m','LineWidth',2); hold off;
set(gca,'FontSize',26);
cpos = get(gcf,'Position');
set(gcf,'Position',[0 cpos(2) 1450 cpos(4)]);




