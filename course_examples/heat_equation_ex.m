% MA 510 / CS 522: Numerical Methods
% Instructor: Prof. Andrea Arnold
%
% Example: Forward Difference with Heat Equation
%
% 1D heat equation: u_t - alpha^2*u_xx = 0, where alpha^2 = 1/5
% Consider x on [0,3] and t on [0,4]
% Dirichlet BC: u(0,t) = u(3,t) = 0 
% Initial condition: u(x,0) = 3x - x^2

% Spatial discretization
L  = 3; % length of spatial coordinates, x in [0,L]
dx = 0.01; 
x_vals = 0:dx:L;
nxvals = length(x_vals);
m = nxvals-2;

% Time discretization
T  = 4; % end time
dt = 0.0001; %0.05; 
t_vals = 0:dt:T;
ntvals = length(t_vals);

% Heat equation parameters
alpha2 = 1/5;
c = alpha2*dt/(dx^2);

% Build foward difference scheme matrix
v_main = (1-2*c)*ones(m,1);
v_off  = c*ones(m-1,1);
A = diag(v_off,-1) + diag(v_main,0) + diag(v_off,1);

% Initialize solution vector with initial condition u(x,0)
U_sol = 3*x_vals(2:end-1) - x_vals(2:end-1).^2; % only use interior points
U_sol = U_sol';

% Create matrix to store solution vectors at each time point
U_save = NaN(m,ntvals);
U_save(:,1) = U_sol;

% Apply forward difference scheme to compute approximate solution
for n = 1:ntvals-1
    U_sol = A*U_sol;
    U_save(:,n+1) = U_sol;
end

% Augment solution with BCs before plotting
U_plot = [zeros(1,ntvals); U_save; zeros(1,ntvals)];

% Plot solution
figure(1);
surf(t_vals,x_vals,U_plot);
xlabel('t'); ylabel('x'); zlabel('u(x,t)');
set(gca,'FontSize',20);
shading interp  % gets rid of grid lines on surf plot
colorbar % adds colorbar
%view(2) % changes view to 2D


