% APPM3021 Lab 5 Exercise 5a
% Tyson Cross 1239448
clc; clear all; set(0,'ShowHiddenHandles','on'); delete(get(0,'Children'));
syms x y;
x0 = 0;
xf = 3;
y0 = 1;
f(x,y) = (1 -(4/3)*x)*y;
% g = @(y1,y2) [y1;y2;-(4/3)*y1];

function_name = func2str(matlabFunction(f));
function_name = function_name(7:end);
N1 = 30;
N2 = 300;

%% Calculations
fprintf('Calculating...');                        	tic;

[X1,Y1] = Euler(f,x0,y0,N1,xf);                   	fprintf('.');
[X2,Y2] = Euler(f,x0,y0,N2,xf);                     fprintf('.');

% Confirm exact solution
[X_sol1,Y_sol1] = ExactODE(f,x0,y0,N1,xf);          fprintf('.');
[X_sol2,Y_sol2,sol] = ExactODE(f,x0,y0,N2,xf);      fprintf('.');

err1 = abs((Y_sol1 - Y1)./Y_sol1);
err1(isnan(err1)) = 0;

err2 = abs((Y_sol2 - Y2)./Y_sol2);
err2(isnan(err2)) = 0;

t = toc;                                            fprintf('\n');
disp(['Calculations complete in ',num2str(t)]);

% Display results
Exercise5a_Disp

% Plot results
Exercise5a_Plot