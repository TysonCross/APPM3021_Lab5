% APPM3021 Lab 5 Exercise 7a
% Tyson Cross 1239448

%{
Notes:
    f1 = system of equations (inhomogeneous)
        y'' = p*y' + p*y + r;
    f2 = system of equations (homogeneous)
        y'' = p*y' + p*y;
    x = [a b];
    y(x0) = y0;
    y(xf) = yf;

p = -3;
q = 2;
r = 2*x + 3;
x = [0 1];
y0 = 2;
yf = 1;

%}

clc; clear all; set(0,'ShowHiddenHandles','on'); delete(get(0,'Children'));

function_name = 'y'''' = -3*y'' + 2*y + 2*x + 3';

f1 = @(x,u) [u(2); -3*u(2) + 2*u(1) + 2*x + 3];
f2 = @(x,v) [v(2); -3*v(2) + 2*v(1)];
bcs = @(ya,yb) [ya(1)-2; yb(1)-1]; %y'(0) = 2, y(1) = 1
x0 = 0;
xf = 1;
y0 = 2;
yf = 1;
N = 30;
xspan = [x0 xf];

[X1,Y1] = shootingmethod(f1, f2, x0, y0, yf, N, xf);
[X2,Y2] = findDifference(x0,y0,yf,N,xf);

% Confirm exact solution
solinit = bvpinit([x0 xf],[y0 1]);
sol = bvp4c(f1,bcs,solinit);
x = linspace(x0,xf,N);
y = deval(sol,x);

% Display results
Exercise7a_Disp

% Plot results
Exercise7a_Plot