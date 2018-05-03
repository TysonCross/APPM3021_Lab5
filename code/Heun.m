function [x,y] = Heun(f,x0,y0,N,xf)
%Heun() solves ODEs with Heun's Method (Improved Euler Method)
% Outputs an (N+1)*2 matrix, with the first column represents the x values ,
% and second columns containing the corresponding y values
% Tyson Cross 1239448

x(1,1) = x0;
y(1,1) = y0;
h = xf/N;

for ii=2:N+1
    k = ii-1;
	x(ii,1) = x(k)+h;
    fx = x(k) + h;
    fy = y(k) + h*f(x(k),y(k));
	y(ii,1) = y(k) + (h/2)*(f(x(k),y(k)) + f(fx,fy));
end

end

