% APPM3021 Lab 5 Exercise 6
% Tyson Cross 1239448

clc; clear all;

% sindex = @(A, s) A(s);     % An anonymous function for 2-D indexing
% value = sindex(f, 1);  % Use the function to index the matrix

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

% syms x y(x);
% D3y = diff(y,x,3);
% D2y = diff(y,x,2);
% D1y = diff(y,x);
% F = D3y + D2y == 0;
function_name = 'y'''''' + y'''' = 0';

%% Calculations
fprintf('Calculating...');                      tic;

% Numerical solution
[X,Y] = RK4system(f,xspan,y0,N);            	fprintf('.');

% Confirm exact solution
tspan = linspace(xspan(1),xspan(end),N+1)';
[X_sol, Y_sol] = ode45(f, tspan, y0);           fprintf('.');

% sol = double(F(X,Y(:,1)))';                  	fprintf('.');
% exact_sol = double(F(X_sol,Y_sol(:,1))');       fprintf('.');
% err = abs((exact_sol - rk4_sol)./exact_sol);    fprintf('.');

% Display results
disp(' ')
disp(['N = ', num2str(N)]);
disp(['h = ', num2str((xspan(end)-xspan(1))/N)]);
disp(['x is an element of [', num2str(xspan), ']' ]);
disp(['f(x,y) = ', function_name]);
% disp(['Exact Solution: y = ', char(sol)]);
disp(' ')
% T = table (X, Y, rk4_sol, exact_sol, err);
% T.Properties.VariableNames = {'x','y','f','Exact','RE'};
% T.Properties.Description = 'Runge-Kutta System Method';
% disp(['            ',T.Properties.Description, ':']);
% disp(' ');
% disp(T)
disp('X=')
disp(X);
disp('Y=')
disp(Y)