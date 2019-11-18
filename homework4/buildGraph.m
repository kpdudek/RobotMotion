function graphVector = buildGraph(nodes,rec)

grid = struct('xx',linspace(0,40,nodes),'yy',linspace(0,40,nodes));

fun = @obstacles;
% grid = grid_eval_rec(grid,fun);

grid.F = true(length(grid.xx),length(grid.xx));


lim = floor(.15*length(grid.xx));
for iRec = 1:rec
    len = randi([1 lim]);
    width = randi([1 lim]);
    range = [ceil(lim/2)+1,floor(length(grid.xx)-(lim/2)-1)];
%     range = sort(range);
    center = randi([range(1) range(2)],1,2);
    xvals = center(1)-floor(width/2):center(1)+floor(width/2);
    yvals = center(2)-floor(len/2):center(2)+floor(len/2);
    grid.F(xvals,yvals) = false;
end

graphVector = grid2graph(grid);

end

function out = obstacles(x)

val = rand() * 10;

if val < 5
    out = false;
else
    out = true;
end

end
