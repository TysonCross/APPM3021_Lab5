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
[X_solution,Y_solution,sol] = ExactODE(f,x0,y0,N,xf);

err = abs((Y_solution - Y)./Y_solution);

% Display results
Exercise1_Disp