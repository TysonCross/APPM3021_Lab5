% Display results
disp(' ')
disp(['N = ', num2str(N)]);
disp(['h = ', num2str(xf/N)]);
disp(['x is an element of [', num2str(x0), ',', num2str(xf), ']' ]);
disp(['f(x,y) = ', function_name]);
disp(['Exact Solution: y = ', char(sol)]);
disp(' ')
T = table (Y_Euler, Y_Heun, Y_Midpoint, Y_RK4, Y_solution);
T.Properties.VariableNames = {'Euler','Heun','Midpoint','RK4','Exact'};
T.Properties.Description = 'Comparison of Methods';
disp(['            ',T.Properties.Description, ':']);
disp(' ');
feature('HotLinks',false);  % disable bold headers 
disp(T)