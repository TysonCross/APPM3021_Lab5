function [X,Y] = shootingmethod(f1,f2,x0,y0,yf,N,xf)
%shootingmethod() solves boundary value problems with the linear shooting method
% f1: system of ODE for the inhomogeneous equation
% f2: the homogoneous equation
% x0: initial x value
% xf: final x value
% y0: initial y value
% yf: final y value
% N: number of subintervals
% Returns X: an (N+1)*1 column vector and Y: an (N+1)*2 matrix
% Tyson Cross 1239448

xspan = [x0 xf];
y0_1 = [y0 0];  % y(a) = y0, y'(a) = 0;
y0_2 = [0 1];   % y(a) = 0,	 y'(a) = 1;
[~,Y1] = RK4system(f1,xspan,y0_1,N);
[X,Y2] = RK4system(f2,xspan,y0_2,N);
val = (yf - Y1(N+1,1)) / Y2(N+1,1);
for ii=1:2
    Y(:,ii) = Y1(:,ii) + val*Y2(:,ii);
end

end