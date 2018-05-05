% APPM3021 Lab 5 Exercise 5a
% Tyson Cross 1239448
clc; clear all; set(0,'ShowHiddenHandles','on'); delete(get(0,'Children'));
syms x y;
x0 = 0;
xf = 3;
y0 = 1;
f(x,y) = y*(1 -(4*x)/3);
function_name = func2str(matlabFunction(f));
function_name = function_name(8:end);
N1 = 30;
N2 = 300;

%% Calculations
fprintf('Calculating...');                        	tic;

[X1,Y1] = Euler(f,x0,y0,N1,xf);                   	fprintf('.');
[X2,Y2] = Euler(f,x0,y0,N2,xf);                     fprintf('.');

% Confirm exact solution
[X_sol1,Y_sol1] = ExactODE(f,x0,y0,N1,xf);          fprintf('.');
[X_sol2,Y_sol2,sol] = ExactODE(f,x0,y0,N2,xf);      fprintf('.');

euler_sol1 = double(f(X1,Y1));
exact_sol1 = double(f(X_sol1,Y_sol1));
err1 = abs((exact_sol1 - euler_sol1)./exact_sol1);
err1(isnan(err1)) = 0;

euler_sol2 = double(f(X2,Y2));
exact_sol2 = double(f(X_sol2,Y_sol2));
err2 = abs((exact_sol2 - euler_sol2)./exact_sol2);
err2(isnan(err2)) = 0;

t = toc;                                            fprintf('\n');
disp(['Calculations complete in ',num2str(t)]);

% Display results
disp(' ')
disp(['N1 = ', num2str(N1)]);
disp(['h1 = ', num2str(xf/N1)]);
disp(['x is an element of [', num2str(x0), ',', num2str(xf), ']' ]);
disp(['f(x,y) = ', function_name]);
disp(['Exact Solution: y = ', char(sol)]);
disp(' ')
T1 = table (X1, Y1, euler_sol1, exact_sol1, err1);
T1.Properties.VariableNames = {'x','y','f','Exact','RE'};
T1.Properties.Description = 'Euler''s Method';
disp(['            ',T1.Properties.Description, ':']);
disp(' ');
disp(T1)
disp('________________________________________________________')

disp(['N2 = ', num2str(N2)]);
disp(['h2 = ', num2str(xf/N2)]);
disp(['x is an element of [', num2str(x0), ',', num2str(xf), ']' ]);
disp(['f(x,y) = ', function_name]);
disp(['Exact Solution: y = ', char(sol)]);
disp(' ')
T2 = table (X2, Y2, euler_sol2, exact_sol2, err2);
T2.Properties.VariableNames = {'x','y','f','Exact','RE'};
T2.Properties.Description = T1.Properties.Description;
disp(['            ',T2.Properties.Description, ':']);
disp(' ');
disp(T2)

%% Display setting and output setup
scr = get(groot,'ScreenSize');                              % screen resolution
phi = (1 + sqrt(5))/2;
ratio = phi/3;
offset = [ scr(3)/4 scr(4)/4]; 
fig1 =  figure('Position',...                               % draw figure
        [offset(1) offset(2) scr(3)*ratio scr(4)*ratio]);
set(fig1,'numbertitle','off',...                            % Give figure useful title
        'name','Exercise 5a',...
        'Color','white');
fontName='Helvetica';
set(0,'defaultAxesFontName', fontName);                     % Make fonts pretty
set(0,'defaultTextFontName', fontName);
set(groot,'FixedWidthFontName', 'ElroNet Monospace')     

% Colors
nice_blue =     [ 0.180     0.180     0.900     0.6 ];
nice_green =    [ 0.180     0.900     0.180     0.6 ];
nice_cyan =     [ 0.180     0.900     0.900     0.6 ];
nice_yellow =   [ 0.900     0.900     0.180     0.6 ];
nice_red =      [ 0.900     0.180     0.180     0.6 ];
pastel_blue =   [ 0.0000    0.4470    0.7410    0.8 ];
pastel_orange = [ 0.8500    0.3250    0.0980    0.8 ];
pastel_yellow = [ 0.9290    0.6940    0.1250    0.8 ];
pastel_purple = [ 0.4940    0.1840    0.5560    0.8 ];
pastel_green =  [ 0.4660    0.6740    0.1880    0.8 ];
sky_blue =      [ 0.3010    0.7450    0.9330    0.8 ];
brick_red =     [ 0.6350    0.0780    0.1840    0.8 ];

% Draw plots
ax1 = axes();
p1 = plot(ax1,X1,double(f(X1,Y1)),...
    'Color', pastel_blue,... 
    'DisplayName','N=30',...
	'LineStyle','-',...
	'LineWidth',1.5);
hold on

ax2 = axes();
p2 = plot(ax2,X2,double(f(X2,Y2)),...
    'Color', pastel_green,...                 
    'DisplayName','N=300',...
	'LineStyle','-',...
	'LineWidth',1.5);
hold on

p3 = plot(ax2,X2,double(f(X_sol2,Y_sol2)),...
    'Color', nice_red,...                 
    'DisplayName','Exact Solution',...
	'LineStyle','-',...
	'LineWidth',1.5);
hold on

% Axes and labels
set([ax1 ax2],'FontSize',14,...
    'Color','none',...
    'Box','off',...
    'XAxisLocation','origin',...
    'YMinorTick','off',...
    'XMinorTick','off',...
    'TickDir','both',...
    'Layer','top',...
    'TickLabelInterpreter','latex');
set(ax1,...
    'Xlim',[0 max(X1)]);
set(ax2,...
    'Xlim',[0 max(X2)]);
hold on
ylabel('y \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);
xlabel('x \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);

% Title and Annotations
t1 = title(ax1,T1.Properties.Description);
% text_1 = text(ax1,...
%     'EdgeColor',[0 0 0],...
%     'FontWeight','bold',...
%     'HorizontalAlignment','center',...
%     'FontSize',14,...
%     'String',strcat('Dy = ',char(f)),...
%     'Position',[1.75025434264465 0.688370727795993 1.4210854715202e-14]);

% Legend
legend1 = legend([p1; p2; p3], {'N=30', 'N=300', 'Exact Solution'});
set(legend1,...
     'Position',[0.459239183470059 0.740095701527999 0.122099037197811 0.132394109235202],...
     'Box','off');
hold on

% Adjust figure
ax1.Position = FillAxesPos(ax1,0.9);
ax2.Position = ax1.Position;
MakeAxesEndArrows(ax1,0.0085);
hold off;