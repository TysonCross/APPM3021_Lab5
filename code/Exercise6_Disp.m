% Display results
disp(' ');disp(' ');
disp(['N = ', num2str(N)]);
disp(['h = ', num2str((xspan(end)-xspan(1))/N)]);
disp(['x is an element of [', num2str(xspan), ']' ]);
disp(['f(x,y) = ', function_name]);
disp(' ')
T = table (X, Y(:,1), Y(:,2), Y(:,3));
T.Properties.VariableNames = {'x','y','dy','d2y'};
T.Properties.Description = 'Runge-Kutta System Method';
disp(['            ',T.Properties.Description, ':']);
disp(' ');
feature('HotLinks',false);  % disable bold headers 
disp(T)