function graphVector = buildGraph(nodes)

grid = struct('xx',linspace(0,40,nodes),'yy',linspace(0,40,nodes));

fun = @obstacles;
% grid = grid_eval_rec(grid,fun);

grid.F = true(length(grid.xx),length(grid.xx));

rec = 100;
lim = floor(.25*nodes);
for iRec = 1:rec
    len = randn([1 lim]);
    width = randn([1 lim]);
    range = [ceil(lim/2)+1,floor((nodes-lim)/2)-1];
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
