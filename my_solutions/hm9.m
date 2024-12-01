% Homework 9

% problem one

% for closed Newton-Cotes formulas
x = [1.8;2.0;2.2;2.4;2.6];
y = [3.12014;4.42569;6.04241;8.03014;10.46675]; 

integ_1 = (x(5)-x(1))/2*(y(1)+y(5));             %n=1 the result =5.4348
integ_2 = (x(5)-x(1))/(2*3)*(y(1)+4*y(3)+y(5));  %n=2 the result =5.0342
integ_3 = 2*(x(5)-x(1))/(45*4)*(7*y(1)+32*y(2)+12*y(3)+32*y(4)+7*y(5));%n=4 the result =5.0329

% for open Newton-Cotes formulas
integ_4 = 2*(x(5)-x(1))/2*y(3);                       %n=0 the result =4.8339
integ_5 = 4*(x(5)-x(1))/(3*4)*(2*y(2)-y(3)+2*y(4));   %n=2 the result =5.0318


%problem three

x = -1:1;
L_0 = @(x) 1; % denote L_0
f_1 = @(x) x;
f_11 = @(x) 1;
n_1 = integral(f_1,-1,1);
d_1 = 2; %integral(f_11,-1,1);
B_1 = d_1\n_1;
L_1 = @(x) x - B_1;  % calculate L_1

f_2 = @(x) x*L_1(x)*L_1(x);
f_22 = @(x) L_1(x)*L_1(x);
n_2 = integral(f_2,-1,1);
d_2 = integral(f_22,-1,1);
B_2 = d_2\n_2;
f_21 = @(x) x*L_1*L_0;
f_221 = @(x) L_0*L_0;
n_21 = integral(f_21,-1,1);
d_21 = integral(f_221,-1,1);
C_2 = d_21\n_21;
L_2 = @(x) (x-B_2)*L_1(x)-C_2*L_0(x);  % calculate L_2

f_3 = @(x) x*L_2*L_2;
f_33 = @(x) L_2*L_2;
n_3 = integral(f_3,-1,1);
d_3 = integral(f_33,-1,1);
B_3 = d_3\n_3;
f_31 = @(x) x*L_2*L_1;
f_331 = @(x) L_1*L_1;
n_31 = integral(f_31,-1,1);
d_31 = integral(f_331,-1,1);
C_3 = d_31\n_31;
L_3 = @(x) (x-B_3)*L_2(x)-C_3*L_1(x);  % calculate L_3

% Plot results and data points
figure(1);
plot(x,L_0,'.b','MarkerSize',30);hold on;
plot(x,L_1,'-r','LineWidth',2); hold on;    
plot(x,L_2,'-.og','LineWidth',2);hold on;   
plot(x,L_3,'--dc','LineWidth',2); hold off;   
legend('L_0','L_1','L_2','L_3')