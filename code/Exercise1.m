% APPM3021 Lab 5 Exercise 1
% Tyson Cross 1239448
clear all;
syms x y;
x0 = 0;
xf = 3;
y0 = 1;
f(x,y) = y*(1 -(4*x)/3);
function_name = func2str(matlabFunction(f));
function_name = function_name(8:end);
N = 10;

% Numerical solution
[X,Y] = Euler(f,x0,y0,N,xf);

% Confirm exact solution
[X_solution,Y_solution, sol] = ExactODE(f,x0,y0,N,xf);

euler_sol = double(f(X,Y));
exact_sol = double(f(X_solution,Y_solution));
err = abs((exact_sol - euler_sol)./exact_sol);

% Display results
disp(' ')
disp(['N = ', num2str(N)]);
disp(['h = ', num2str(xf/N)]);
disp(['x is an element of [', num2str(x0), ',', num2str(xf), ']' ]);
disp(['f(x,y) = ', function_name]);
disp(['Exact Solution: y = ', char(sol)]);
disp(' ')
T = table (X, Y, euler_sol, exact_sol, err);
T.Properties.VariableNames = {'x','y','f','Exact','RE'};
T.Properties.Description = 'Euler''s Method';
disp(['          ',T.Properties.Description, ':']);
disp(' ');
disp(T)
