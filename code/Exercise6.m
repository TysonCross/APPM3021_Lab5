% APPM3021 Lab 5 Exercise 6
% Tyson Cross 1239448

clc; clear all; set(0,'ShowHiddenHandles','on'); delete(get(0,'Children'));

syms x y(x);
xspan = [0 5];
y0 = [0 0 1];

D3y = diff(y,x,3);
D2y = diff(y,x,2);
D1y = diff(y,x);
f = D3y + D2y == 0;

% f = diff(y,x,3) + diff(y,x,2) == 0;
function_name = func2str(matlabFunction(f));
function_name = function_name(5:end);
N = 30;

%% Calculations
fprintf('Calculating...');                      tic;

% Numerical solution
[X,Y] = RK4system(f,xspan,y0,N);            	fprintf('.');

% Confirm exact solution
[~,Y_solution,sol] = ExactODE(f,x0,y0,N,xf);    fprintf('.');

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