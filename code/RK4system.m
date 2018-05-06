function [X,Y] = RK4system(f,xspan,y0,N)
%RK4() solves a system of n ODEs with the Runge-Kutta Method
% Outputs a vector and a (N+1)xn matrix, with the first output column
% contains the x values and the matrix containing the corresponding y values
% and its derivatives y', y'', ... y^(n-1)
% Tyson Cross 1239448

x0 = xspan(1);
xf = xspan(end);

% % initial conditions
% for ii=1:numel(y0)
%     DnY(ii) = diff(y,x,ii) == y0(ii);
% end

% reduce to system of 1st order ODE
n = numel(y0);
% g(y) = str2sym('y(2)');

X = zeros(N+1,1);
Y = zeros(N+1,n);

X(1,1) = x0;
Y(1,1) = y0(1);

% solve with RK4()
% syms x y1 y2 y3
% f1 = f{1};
% f2 = f{2};
% f3 = f{3};
% G = [f1(u,y1,y2,y3), f2(u,y1,y2,y3), f3(u,y1,y2,y3)];
G = f(x,y);
H = symfun(G,symvar(G));



% for ii=1:numel(G)
%     F{ii} = symfun(G(ii),symvar(G(ii)));
% end

% H = symfun(G,[x y]);

for ii=2:n+1
    [X(ii,1),Y(ii,:)] = RK4(H,x0,y0(ii-1),N,xf);
end

end