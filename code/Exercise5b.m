% APPM3021 Lab 5 Exercise 5b
% Tyson Cross 1239448

clc; clear all; set(0,'ShowHiddenHandles','on'); delete(get(0,'Children'));
syms x y;
x0 = 0;
xf = 3;
y0 = 1;
f(x,y) = y*(1 -(4*x)/3);
function_name = func2str(matlabFunction(f));
function_name = function_name(8:end);
N = 300;

%% Calculations
fprintf('Calculating...');                      tic;

[X,Y1] = Euler(f,x0,y0,N,xf);                   fprintf('.');
[~,Y2] = Heun(f,x0,y0,N,xf);                    fprintf('.');
[~,Y3] = Midpoint(f,x0,y0,N,xf);                fprintf('.');
[~,Y4] = RK4(f,x0,y0,N,xf);                     fprintf('.');

% Confirm exact solution
[~,Y_solution,sol] = ExactODE(f,x0,y0,N,xf);    fprintf('.');

euler_solution = double(f(X,Y1));               fprintf('.');
heun_solution = double(f(X,Y2));                fprintf('.');
midpoint_solution = double(f(X,Y3));            fprintf('.');
rk4_solution = double(f(X,Y4));                 fprintf('.');
exact_solution = double(f(X,Y_solution));       fprintf('.');

err1 = abs((exact_solution - euler_solution)    ./exact_solution);
err2 = abs((exact_solution - heun_solution)     ./exact_solution);
err3 = abs((exact_solution - midpoint_solution) ./exact_solution);
err4 = abs((exact_solution - rk4_solution)      ./exact_solution);

err1(isnan(err1)) = 0;
err2(isnan(err2)) = 0;
err3(isnan(err3)) = 0;
err4(isnan(err4)) = 0;

t = toc;                                        fprintf('\n');
disp(['Calculations complete in ',num2str(t)]);

%% Display results
disp(' ')
disp(['N = ', num2str(N)]);
disp(['h = ', num2str(xf/N)]);
disp(['x is an element of [', num2str(x0), ',', num2str(xf), ']' ]);
disp(['f(x,y) = ', function_name]);
disp(['Exact Solution: y = ', char(sol)]);
disp(' ')
T = table (euler_solution, heun_solution, midpoint_solution, rk4_solution, exact_solution);
T.Properties.VariableNames = {'Euler','Heun','Midpoint','RK4','Exact'};
T.Properties.Description = 'Comparison of Methods';
disp(['            ',T.Properties.Description, ':']);
disp(' ');
disp(T)
    
%% Display setting and output setup
scr = get(groot,'ScreenSize');                              % screen resolution
phi = (1 + sqrt(5))/2;
ratio = 1.5*phi/3;
offset = [ scr(3)/8 scr(4)/8]; 
fig1 =  figure('Position',...                               % draw figure
        [offset(1) offset(2) scr(3)*ratio scr(4)*ratio]);
set(fig1,'numbertitle','off',...                            % Give figure useful title
        'name','Exercise 5a',...
        'Color','white',...
        'Units','normalized');
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
                    
line_thin = 1;
line_thick = 2;
marker_size = 4;

%% Draw plots
subplot_row = 14;
subplot_col = 2;
subplot_entries = subplot_row*subplot_col;
ax_main = subplot(subplot_row,subplot_col,[1 subplot_entries-8]);
hold on;

p1 = plot(euler_solution,...
    'Color',pastel_blue,... 
    'DisplayName','Euler',...
	'LineStyle','-',...
	'LineWidth',line_thin,...
    'MarkerIndices',2:10:length(X),...
    'Marker','o',...
    'MarkerSize',marker_size);
hold on

p2 = plot(heun_solution,...
    'Color',pastel_orange,...                 
    'DisplayName','Huen',...
	'LineStyle','-',...
	'LineWidth',line_thin,...
    'MarkerIndices',4:10:length(X),...
    'Marker','s',...
    'MarkerSize',marker_size);
hold on

p3 = plot(midpoint_solution,...
    'Color',pastel_yellow,...                 
    'DisplayName','Midpoint',...
	'LineStyle','-',...
	'LineWidth',line_thin,...
    'MarkerIndices',6:10:length(X),...
    'Marker','+',...
    'MarkerSize',marker_size);
hold on

p4 = plot(rk4_solution,...
    'Color',pastel_green,...                 
    'DisplayName','Runge-Kutta',...
	'LineStyle','-',...
	'LineWidth',line_thin,...
    'MarkerIndices',8:10:length(X),...
    'Marker','d',...
    'MarkerSize',marker_size);
hold on

p5 = plot(exact_solution,...
    'Color',nice_red,...                 
    'DisplayName','Exact Solution',...
	'LineStyle','-',...
	'LineWidth',line_thin,...
    'MarkerIndices',10:10:length(X),...
    'Marker','x',...
    'MarkerSize',marker_size);
hold on

% Axes and labels
box(ax_main,'off');
set(ax_main,'FontSize',14,...
    'XAxisLocation','origin',...
    'YMinorTick','off',...
    'XMinorTick','off',...
    'TickDir','both',...
    'TickLabelInterpreter','latex');
hold on
ylabel('y \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);%,...
xlabel('x \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);

% Title and Annotations
t_main = title(T.Properties.Description);
% text_1 = text('Parent',ax_main,...
%     'EdgeColor',[0 0 0],...
%     'FontWeight','bold',...
%     'HorizontalAlignment','center',...
%     'FontSize',14,...
%     'String',strcat('Dy = ',char(f)),...
%     'Position',[226.693488358057 0.58435397008633 0]);

% Legend
legend1 = legend('show');
set(legend1,...
     'Position',[0.470931150019318 0.787076450813594 0.11831938 0.12512873],...
     'Box','off');
hold on

%% Error plots
ax1 = subplot(subplot_row,subplot_col,subplot_entries-5);
hold on;
p1_e = stem(err1,...
    'Color',pastel_blue,...
	'LineWidth',line_thick,...
    'MarkerSize',0.01);
hold on;
t1_e = title(strcat(p1.DisplayName,' Relative Error'));

ax2 = subplot(subplot_row,subplot_col,subplot_entries-4);
hold on;
p2_e = stem(err2,...
    'Color',pastel_orange,...
	'LineWidth',line_thick,...
    'MarkerSize',0.01);
hold on;
t2_e = title(strcat(p2.DisplayName,' Relative Error'));

ax3 = subplot(subplot_row,subplot_col,subplot_entries-1);
hold on;
p3_e = stem(err3,...
    'Color',pastel_yellow,...
	'LineWidth',line_thick,...
    'MarkerSize',0.01);
hold on;
t3_e = title(strcat(p3.DisplayName,' Relative Error'));

ax4 = subplot(subplot_row,subplot_col,subplot_entries);
hold on;
p4_e = stem(err4,...
    'Color',pastel_green,... 
	'LineWidth',line_thick,...
    'MarkerSize',0.01);
hold on;
t4_e = title(strcat(p4.DisplayName,' Relative Error'));

%% Adjust figure
xlim([ax_main ax1 ax2 ax3 ax4],[0 numel(exact_solution)]);
ylim(ax_main,[-1.25 1]);
ax_main.Position = FillAxesPos(ax_main,0.9);
MakeAxesEndArrows(ax_main,-0.199);
ax1.Position = [0.04 0.2 0.45 0.1];
ax2.Position = [0.53 0.2 0.445 0.1];
ax3.Position = [0.04 0.05 0.45 0.1];
ax4.Position = [0.53 0.05 0.445 0.1];
hold off;