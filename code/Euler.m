function [x,y] = Euler(f,x0,y0,N,xf)
%Euler() solves ODEs with Euler's Method. Outputs an (N+1)*2 matrix, with the
%first column represents the x values , and the second column containing the
%corresponding y values
% Tyson Cross 1239448

x(1,1) = x0;
y(1,1) = y0;
h = (xf-x0)/N;

for ii=2:N+1
    k = ii-1;
	x(ii,1) = x(k)+h;
	y(ii,1) = y(k) + h*f(x(k),y(k));
end

end

