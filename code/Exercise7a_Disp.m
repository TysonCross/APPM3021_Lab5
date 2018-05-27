% Display results
disp(' ');
disp(['N = ', num2str(N)]);
disp(['h = ', num2str((xspan(end)-xspan(1))/N)]);
disp(['x is an element of [', num2str(xspan), ']' ]);
disp(['y(',num2str(x0),') = ', num2str(y0)]);
disp(['y(',num2str(xf),') = ', num2str(yf),]);
disp(['f(x,y) = ', function_name]);
disp(['y1: ', func2str(f1)]);
disp(['y2: ', func2str(f2)]);

disp(' ');disp(' ');
T1 = table (X1, Y1(:,1), Y1(:,2));
T1.Properties.VariableNames = {'x','y','dy'};
T1.Properties.Description = 'Linear Shooting Method (w/RK4system)';
disp(['  ',T1.Properties.Description, ':']);
disp(' ');
feature('HotLinks',false);  % disable bold headers 
disp(T1)

disp(' ');disp(' ');
T2 = table (X2, Y2);
T2.Properties.VariableNames = {'x','y'};
T2.Properties.Description = 'Finite Difference Method';
disp(['  ',T2.Properties.Description, ':']);
disp(' ');
feature('HotLinks',false);  % disable bold headers 
disp(T2)