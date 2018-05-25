% APPM3021 Lab 5 Exercise 7a
% Tyson Cross 1239448

%{
Notes:
    f1 = system of equations (inhomogeneous)
        y'' = p*y' + p*y + r;
    f2 = system of equations (homogeneous)
        y'' = p*y' + p*y;
    x = [a b];
    y(x0) = y0;
    y(xf) = yf;

p = -3;
q = 2;
r = 2*x + 3;
x = [0 1];
y0 = 2;
yf = 1;

%}

clc; clear all; set(0,'ShowHiddenHandles','on'); delete(get(0,'Children'));


function_name = 'y'''' = -3*y'' + 2*y + 2*x + 3';

f1 = @(x,u) [u(2); -3*u(2) + 2*u(1) + 2*x + 3];
f2 = @(x,v) [v(2); -3*v(2) + 2*v(1)];
bcs = @(ya,yb) [ya(1)-2; yb(1)-1]; %y'(0) = 2, y(1) = 1
x0 = 0;
xf = 1;
y0 = 2;
yf = 1;
N = 30;
xspan = [x0 xf];

[X1,Y1] = shootingmethod(f1, f2, x0, y0, yf, N, xf);
[X2,Y2] = findDifference(x0,y0,yf,N,xf);


solinit = bvpinit([x0 xf],[y0 1]);
sol = bvp4c(f1,bcs,solinit);
x = linspace(x0,xf,N);
y = deval(sol,x);

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
disp(T1)

disp(' ');disp(' ');
T2 = table (X2, Y2);
T2.Properties.VariableNames = {'x','y'};
T2.Properties.Description = 'Finite Difference Method';
disp(['  ',T2.Properties.Description, ':']);
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
        'name','Exercise 7',...
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

line_thin = 1;
line_thick = 2;
marker_size = 4;
marker_spacing = 1;

% Draw plots
ax1 = axes();
p1 = plot(X1,Y1(:,1),...
    'Color', pastel_blue,... 
    'DisplayName','N=30',...
	'LineStyle','-',...
	'LineWidth',line_thin,...
    'MarkerIndices',2:marker_spacing:length(X1),...
    'Marker','o',...
    'MarkerSize',marker_size);
hold on

p2 = plot(X2,Y2,...
    'Color', pastel_green,...                 
    'DisplayName','N=300',...
	'LineStyle','-',...
	'LineWidth',line_thin,...
    'MarkerIndices',1:marker_spacing:length(X2),...
    'Marker','s',...
    'MarkerSize',marker_size);
hold on

p3 = plot(x,y(1,:),...
    'Color', nice_red,...                 
    'DisplayName','Exact Solution',...
	'LineStyle','-',...
	'LineWidth',line_thin,...
    'MarkerIndices',1:marker_spacing:length(x),...
    'Marker','x',...
    'MarkerSize',marker_size);
hold on


% Axes and labels
set([ax1],'FontSize',14,...
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
hold on
ylabel('y \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);
xlabel('x \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);

% Title and Annotations
t1 = title(ax1,'Linear Shooting vs Finite Difference');

% Legend
legend1 = legend([p1; p2; p3], {'Shooting Method', 'Finite Difference', 'Exact'});
set(legend1,...
     'Position',[0.671688367102835 0.70455874717488 0.122099037197811 0.132394109235202],...
     'Box','off');
hold on

% Adjust figure
ax1.Position = FillAxesPos(ax1,0.9);
ax2.Position = ax1.Position;
hold off;