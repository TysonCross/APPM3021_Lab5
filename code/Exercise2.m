% APPM3021 Lab 5 Exercise 2
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

[X,Y] = Heun(f,x0,y0,N,xf);

% Display results
disp(['N = ', num2str(N)]);
disp(['h = ', num2str(xf/N)]);
disp(['x is an element of [', num2str(x0), ',', num2str(xf), ']' ]);
disp(['f(x,y) = ', function_name]);
disp(' ')
T = table (X, Y, double(f(X,Y)));
T.Properties.VariableNames = {'x','y','f'};
T.Properties.Description = 'Heun''s Method';
disp(['            ',T.Properties.Description, ':']);
disp(' ');
disp(T)