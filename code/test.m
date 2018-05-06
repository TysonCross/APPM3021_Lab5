% y''' + y'' = 0
% y'   = y(2)
% y''  = y(3)
% y''' = -y(3)

xspan = [0 5];
y0 = [0 0 1];

dy = @(t,y) [y(2);y(3);-y(3)];
[T, Y] = ode45(dy, xspan, y0);
plot(T,Y,'-')
grid on
