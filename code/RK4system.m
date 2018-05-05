function [X,Y] = RK4system(f,xspan,y0,N)
%RK4() solves a system of n ODEs with the Runge-Kutta Method
% Outputs a vector and a (N+1)xn matrix, with the first output column
% contains the x values and the matrix containing the corresponding y values
% and its derivatives y', y'', ... y^(n-1)
% Tyson Cross 1239448

syms x y(x);

% f = diff(y,x,3) + diff(y,x,2) == 0;
% y0(1) = y(0) == 0;
% y0(2) = D1y == 1;
% y0(3) = D2y == 1;


x0 = xspan(1);
xf = xspan(end);

% initial conditions
for ii=1:numel(y0)
    DnY(ii) = diff(y,x,ii) == y0(ii);
end

% reduce to system of 1st order ODE
F = odeToVectorField(f);
% M = matlabFunction(F(1),'Vars',{'x','Y'})
% F = matlabFunction(odeToVectorField(f),'Vars',{'x','Y'});

% sol = ode45(F,xspan,y0)
% tVal = linspace(0,5);
% yVal = deval(sol,tVal,1);
% plot(tVal,yVal)
% xlabel('t')
% ylabel('y(t)')
% title('ODE Solution')

[n,~] = size(F);



X = zeros(N+1,1);
Y = zeros(N+1,n);

X(1,1) = x0;
Y(1,1) = y0(1);

% solve with RK4()
for ii=2:n+1
    [X(ii,1),Y(ii,:)] = RK4(F(ii-1),x0,y0(ii),N,xf);
end

end