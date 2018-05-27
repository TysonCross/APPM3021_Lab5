% APPM3021 Lab 5 Exercise 5b
% Tyson Cross 1239448

clc; clear all; set(0,'ShowHiddenHandles','on'); delete(get(0,'Children'));
syms x y;
x0 = 0;
xf = 3;
y0 = 1;
f(x,y) = y*(1 -(4*x)/3);
function_name = func2str(matlabFunction(f));
function_name = function_name(8:end);
N = 300;

%% Calculations
fprintf('Calculating...');                          tic;

[X,Y_Euler] = Euler(f,x0,y0,N,xf);                 	fprintf('.');
[~,Y_Heun] = Heun(f,x0,y0,N,xf);                    fprintf('.');
[~,Y_Midpoint] = Midpoint(f,x0,y0,N,xf);            fprintf('.');
[~,Y_RK4] = RK4(f,x0,y0,N,xf);                   	fprintf('.');

% Confirm exact solution
[~,Y_solution,sol] = ExactODE(f,x0,y0,N,xf);        fprintf('.');

err1 = abs((Y_solution - Y_Euler)    ./Y_solution);
err2 = abs((Y_solution - Y_Heun)     ./Y_solution);
err3 = abs((Y_solution - Y_Midpoint) ./Y_solution);
err4 = abs((Y_solution - Y_RK4)      ./Y_solution);

err1(isnan(err1)) = 0;
err2(isnan(err2)) = 0;
err3(isnan(err3)) = 0;
err4(isnan(err4)) = 0;

t = toc;                                            fprintf('\n');
disp(['Calculations complete in ',num2str(t)]);

% Display results
Exercise5b_Disp

% Plot results
Exercise5b_Plot