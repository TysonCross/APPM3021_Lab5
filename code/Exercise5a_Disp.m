% Display results
disp(' ')
disp(['N1 = ', num2str(N1)]);
disp(['h1 = ', num2str(xf/N1)]);
disp(['x is an element of [', num2str(x0), ',', num2str(xf), ']' ]);
disp(['f(x,y) = ', function_name]);
disp(['Exact Solution: y = ', char(sol)]);
disp(' ')
T1 = table (X1, Y1, Y_sol1, err1);
T1.Properties.VariableNames = {'x','y','Exact','RE'};
T1.Properties.Description = 'Euler''s Method';
disp(['            ',T1.Properties.Description, ':']);
disp(' ');
feature('HotLinks',false);  % disable bold headers 
disp(T1)
disp('________________________________________________________')

disp(' ')
disp(['N2 = ', num2str(N2)]);
disp(['h2 = ', num2str(xf/N2)]);
disp(['x is an element of [', num2str(x0), ',', num2str(xf), ']' ]);
disp(['f(x,y) = ', function_name]);
disp(['Exact Solution: y = ', char(sol)]);
disp(' ')
T2 = table (X2, Y2, Y_sol2, err2);
T2.Properties.VariableNames = {'x','y','Exact','RE'};
T2.Properties.Description = T1.Properties.Description;
disp(['            ',T2.Properties.Description, ':']);
disp(' ');
disp(T2)