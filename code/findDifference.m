function [X,Y] = findDifference(x0,y0,yf,N,xf)
%findDifference() solves a BVP using the finite difference method
% x0: initial x value
% xf: final x value
% y0: initial y value
% yf: final y value
% N: number of interior points
% Returns X: an (N+2)*1 column vector and Y: an (N+2)*1 column vector 
% Tyson Cross 1239448

A = zeros(N);
b = zeros(N,1);
Y = zeros(N,1);
X = linspace(x0,xf,N+2)';
h = (xf - x0)/N;

x_int = X(2:end-1);

% diagonals
for ii=1:N
    A(ii,ii)=2*(1+h^2);
end

% off-diagnonals
for ii=1:N-1
    A(ii,ii+1) = 1+(3/2)*h;
    A(ii+1,ii) = 1-(3/2)*h;
end

% b vector
   b(1,1) =  h^2*(2*x_int(1)+3) + (1 - (3/2)*h)*y0;
for ii=2:N-1
   b(ii,1) =  h^2*(2*x_int(ii)+3);
end
   b(N,1) =  h^2*(2*x_int(N)+3) - (1 + (3/2)*h)*yf;

   Y = A\b;
   Y = abs([y0;Y;yf]);
   
end
