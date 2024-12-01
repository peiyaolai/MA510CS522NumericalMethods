% MA 510 / CS 522: Numerical Methods
%Homework 5 Lagrange interpolation

% question 2 part a
%plot N = 5
xpts  = linspace(-1,1,5);
xeval = linspace(xpts(1),xpts(end),200);
ypts  = 1./(1+25*(xpts).^2);

poly = lagrange(xpts,ypts,xeval);

x  = linspace(xpts(1),xpts(end),200);
f  = 1./(1+25*(x).^2);

% Plot results and data points
figure(1);
plot(xeval,poly,'-k','LineWidth',3); hold on;
plot(xpts,ypts,'.r','MarkerSize',30);hold on;
plot(x,f,'-.or');hold off

diff_5  = poly - f;
relerr_5 = norm(diff_5,Inf);%infinity norm
relerr_55 = norm(diff_5,2);%two norm

%plot N = 10
xpts  = linspace(-1,1,10);
xeval = linspace(xpts(1),xpts(end),200);
ypts  = 1./(1+25*(xpts).^2);

poly = lagrange(xpts,ypts,xeval);

x  = linspace(xpts(1),xpts(end),200);
f  = 1./(1+25*(x).^2);

% Plot results and data points
figure(2);
plot(xeval,poly,'-k','LineWidth',3); hold on;
plot(xpts,ypts,'.r','MarkerSize',30);hold on;
plot(x,f,'-.or');hold off

diff_10  = poly - f;
relerr_10 = norm(diff_5,Inf);%infinity norm
relerr_1010 = norm(diff_5,2);%two norm

%plot N = 15
xpts  = linspace(-1,1,15);
xeval = linspace(xpts(1),xpts(end),200);
ypts  = 1./(1+25*(xpts).^2);

poly = lagrange(xpts,ypts,xeval);

x  = linspace(xpts(1),xpts(end),200);
f  = 1./(1+25*(x).^2);

% Plot results and data points
figure(3);
plot(xeval,poly,'-k','LineWidth',3); hold on;
plot(xpts,ypts,'.r','MarkerSize',30);hold on;
plot(x,f,'-.or');hold off

diff_15  = poly - f;
relerr_15 = norm(diff_5,Inf);%infinity norm
relerr_1515 = norm(diff_5,2);%two norm

%plot N = 20
xpts  = linspace(-1,1,20);
xeval = linspace(xpts(1),xpts(end),200);
ypts  = 1./(1+25*(xpts).^2);

poly = lagrange(xpts,ypts,xeval);

x  = linspace(xpts(1),xpts(end),200);
f  = 1./(1+25*(x).^2);

% Plot results and data points
figure(4);
plot(xeval,poly,'-k','LineWidth',3); hold on;
plot(xpts,ypts,'.r','MarkerSize',30);hold on;
plot(x,f,'-.or');hold off

diff_20  = poly - f;
relerr_20 = norm(diff_5,Inf)%infinity norm
relerr_2020 = norm(diff_5,2)%two norm

% question 2 part (d)
N     = 1:1:15;
xpts  = cos(pi*(2*N-1)./(2*15));
xeval = linspace(-1,1,200);
ypts  = 1./(1+25*(xpts).^2);

poly = lagrange(xpts,ypts,xeval);

x  = linspace(-1,1,150);
f  = 1./(1+25*(x).^2);

% Plot results and data points
figure(5);
plot(xeval,poly,'-k','LineWidth',3); hold on;
plot(xpts,ypts,'.r','MarkerSize',30);hold on;
plot(x,f,'-.or');hold off













