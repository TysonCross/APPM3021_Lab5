% APPM3021 Lab 5 Exercise 6
% Tyson Cross 1239448

clc; clear all; set(0,'ShowHiddenHandles','on'); delete(get(0,'Children'));

% sindex = @(A, s) A(s);     % An anonymous function for 2-D indexing
% value = sindex(f, 1);  % Use the function to index the matrix

N = 30;
xspan = linspace(0,5,N);
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
f = @(x,y) [y(3),y(3),-y(3)];

% f1 = @(x,y1,y2,y3)  y2;
% f2 = @(x,y1,y2,y3)  y3;
% f3 = @(x,y1,y2,y3) -y3;
% 
% f = {f1,f2,f3};

function_name = 'y'''''' + y'''' = 0';

%% Calculations
fprintf('Calculating...');                      tic;

% Numerical solution
[X,Y] = RK4system(f,xspan,y0,N);            	fprintf('.');

% Confirm exact solution

[X_Solution, Y_solution] = ode45(f, xspan, y0); fprintf('.');
% [~,Y_solution,sol] = ExactODE(f,x0,y0,N,xf);    

rk4_sol = double(f(X,Y));                       fprintf('.');
exact_sol = double(f(X_solution,Y_solution));   fprintf('.');
err = abs((exact_sol - rk4_sol)./exact_sol);    fprintf('.');

% Display results
disp(' ')
disp(['N = ', num2str(N)]);
disp(['h = ', num2str(xf/N)]);
disp(['x is an element of [', num2str(x0), ',', num2str(xf), ']' ]);
disp(['f(x,y) = ', function_name]);
disp(['Exact Solution: y = ', char(sol)]);
disp(' ')
T = table (X, Y, rk4_sol, exact_sol, err);
T.Properties.VariableNames = {'x','y','f','Exact','RE'};
T.Properties.Description = 'Runge-Kutta Method';
disp(['            ',T.Properties.Description, ':']);
disp(' ');
disp(T)