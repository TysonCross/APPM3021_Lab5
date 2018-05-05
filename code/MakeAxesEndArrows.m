function MakeAxesEndArrows(ax,offset)

if nargin < 2
    offset = 0;
end

% determine position of the axes
axp = get(ax,'Position');
yl = get(ax,'YLim');

% determine startpoint and endpoint for the arrows 
xs = axp(1);
xe = min(axp(1) + axp(3) + 0.04,1);
ys = axp(2);
ye = min(axp(2) + axp(4) + 0.05,1);

% make the arrows
if strcmp(ax.XAxisLocation,'origin')
    y1 = (yl(end)/(yl(end)-yl(1)));
    yx = (y1 + (1 - y1))/2;
    a1 = annotation('arrow', [xs xe],[ys+yx+ offset ys+yx + offset]);
else
    a1 = annotation('arrow', [xs xe],[ys ys]);
end
a2 = annotation('arrow', [xs xs],[ys ye]);

% remove old box and axes
% box off
% set(ax,'YTick',[])
% set(ax,'XTick',[])
% set(ax,'YColor',get(ax,'Color'))
% set(ax,'XColor',get(ax,'Color'))
% set(ax, 'Xtick', [], 'Ytick', [], 'box', 'off')

end



