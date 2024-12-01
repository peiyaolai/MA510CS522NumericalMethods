% Spatial discretization
L  = 5; % length of spatial coordinates, x in [0,L]
dx = 0.1; 
x_vals = 0:dx:L;
nxvals = length(x_vals);
m = nxvals-2;

% Time discretization
T  = 10; % end time
dt = 0.01; 
t_vals = 0:dt:T;
ntvals = length(t_vals);

alpha2 = 1/5;
c = alpha2*dt/(dx); % c = 0.02

v_main = (1-c)*ones(m,1);
v_off  = c*ones(m-1,1);
v_of = c*ones(0,1);
A_v = diag(v_off,-1) + diag(v_main,0)+ diag(v_of,m);
A_v(1,49) = c;
A = A_v;

% Initialize solution vector with initial condition u(x,0)
U_sol = exp( - (x_vals(2:end-1).^2)); % only use interior points
U_sol = U_sol';

U_save = NaN(m,ntvals);% Create matrix to store solution vectors at each time point
U_save(:,1) = U_sol;

for n = 1:ntvals-1 % Apply difference scheme to compute approximate solution
    U_sol = A*U_sol;
    U_save(:,n+1) = U_sol;
end

U_plot = [zeros(1,ntvals); U_save; zeros(1,ntvals)];% Augment solution with BCs before plotting

% Plot solution
figure(3);
surf(t_vals,x_vals,U_plot);
xlabel('t'); ylabel('x'); zlabel('u(x,t)');
set(gca,'FontSize',20);
shading interp  % gets rid of grid lines on surf plot
colorbar % adds colorbar
%view(2) % changes view to 2D

