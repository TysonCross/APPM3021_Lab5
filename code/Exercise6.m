% APPM3021 Lab 5 Exercise 6
% Tyson Cross 1239448

clc; clear all;

N = 30;
xspan = [0 5];
y0 = [0 0 1];

%{
    *Notes*

   y''' + y'' = 0
   {y' = dy/dx}

    which leads to
        y'   = y(2)
        y''  = y(3)
        y''' = -y(3)
%}

% function handles
f = @(x,y) [y(2);y(3);-y(3)];

function_name = 'y'''''' + y'''' = 0';

%% Calculations
fprintf('Calculating...');

% Numerical solution
[X,Y] = RK4system(f,xspan,y0,N);            	fprintf('.');

% Confirm exact solution
tspan = linspace(xspan(1),xspan(end),N+1)';
[X_sol, Y_sol] = ode45(f, tspan, y0);           fprintf('.');

% Display results
disp(' ');disp(' ');
disp(['N = ', num2str(N)]);
disp(['h = ', num2str((xspan(end)-xspan(1))/N)]);
disp(['x is an element of [', num2str(xspan), ']' ]);
disp(['f(x,y) = ', function_name]);
disp(' ')
% disp('X=')
% disp(X);
% disp('Y=')
% disp(Y)
% disp(' ')
T = table (X, Y(:,1), Y(:,2), Y(:,3));
T.Properties.VariableNames = {'x','y','dy','d2y'};
T.Properties.Description = 'Runge-Kutta System Method';
disp(['            ',T.Properties.Description, ':']);
disp(' ');
disp(T)