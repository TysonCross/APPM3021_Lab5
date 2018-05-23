function [X,Y] = RK4system(f,xspan,y0,N)
%RK4() solves a system of n ODEs with the Runge-Kutta Method
% Outputs a vector and a (N+1)xn matrix, with the first output column
% contains the x values and the matrix containing the corresponding y values
% and its derivatives y', y'', ... y^(n-1)
% Tyson Cross 1239448

x0 = xspan(1);
xf = xspan(end);
n = numel(y0);
h = (xf-x0)/N;

X = linspace(xspan(1),xspan(end),N+1)';
Y = zeros(N+1,n);
Y(1,:) = y0;

% solve with RK4, as matrix

for ii=2:N+1
    k = ii-1;
    k1 = h*f(X(k),Y(k,:))';
    k2 = h*f(X(k) + (h/2), Y(k,:) + (k1./2))';
    k3 = h*f(X(k) + (h/2), Y(k,:) + (k2./2))';
    k4 = h*f(X(k) + h, Y(k,:) + k3)';
	Y(ii,:) = Y(k,:) + (1/6)*(k1 + 2.*k2 + 2.*k3 + k4);
end

end