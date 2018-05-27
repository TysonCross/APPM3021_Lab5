% Display results
disp(' ')
disp(['N = ', num2str(N)]);
disp(['h = ', num2str(xf/N)]);
disp(['x is an element of [', num2str(x0), ',', num2str(xf), ']' ]);
disp(['f(x,y) = ', function_name]);
disp(['Exact Solution: y = ', char(sol)]);
disp(' ')
T = table (X, Y, Y_solution, err);
T.Properties.VariableNames = {'x','y','Exact','RE'};
T.Properties.Description = 'Runge-Kutta Method';
disp(['            ',T.Properties.Description, ':']);
disp(' ');
feature('HotLinks',false);  % disable bold headers 
disp(T)