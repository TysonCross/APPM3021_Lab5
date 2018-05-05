function [a,b,sol] = ExactODE(f,x0,y0,N,xf)
%ExactODE() solves ODEs analytically. Outputs an (N+1)*2 matrix, with the
%first column represents the x values , and the second column containing the
%corresponding y values
% Tyson Cross 1239448

syms deq(x)

a(1,1) = x0;
b(1,1) = y0;
h = xf/N;
% function_name = func2str(matlabFunction(f));
eq = strcat('Dy=',char(f));
eq_y = strcat('y(0)=',num2str(y0));
deq(x) = simplify(dsolve(eq,eq_y,'x'));
sol = deq;

for ii=2:N+1
    k = ii-1;
	a(ii,1) = double(a(k)+h);
	b(ii,1) = double(deq(a(ii,1)));
end

end

