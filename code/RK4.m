function [x,y] = RK4(f,x0,y0,N,xf)
%RK4() solves ODEs with the Runge-Kutta Method
% Outputs an (N+1)*2 matrix, with the first column represents the x values ,
% and second columns containing the corresponding y values
% Tyson Cross 1239448

x(1,1) = x0;
y(1,1) = y0;
h = xf/N;

for ii=2:N+1
    k = ii-1;
	x(ii,1) = x(k)+h;
    k1 = h*f(x(k),y(k));
    k2 = h*f(x(k) + (h/2), y(k) + (k1/2));
    k3 = h*f(x(k) + (h/2), y(k) + (k2/2));
    k4 = h*f(x(k) + h, y(k) + k3);
	y(ii,1) = y(k) + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
end

end