function graphVector = buildGraph(nodes)

grid = struct('xx',linspace(-10,10,NCells),'yy',linspace(-10,10,NCells));

pot = struct('xGoal',[5;5],'repulsiveWeight',5,'shape','conic');
fun = @potential_total;
grid = grid_eval(grid,fun);

graphVector = grid2graph(grid);

end
% 
% graphVector.neighbors = [];
% graphVector.neighborsCost = [];
% graphVector.x = [];
% 
% graph = ones(nodes,nodes);
% 
% count = 1;
% for iNode = 1:nodes
%     for jNode = 1:nodes
%         idx = count;
%         graph(iNode,jNode) = idx;
%         count = count + 1;
%     end
% end
% 
% count = 1;
% for iNode = 1:nodes
%     for jNode = 1:nodes
%         idx = count;
%         graphVector(idx).neighbors = [];
%         if iNode-1 >= 1
%             graphVector(idx).neighbors(end+1) = graph(iNode-1,jNode);
%         end
%         if iNode+1 <= nodes
%             graphVector(idx).neighbors(end+1) = graph(iNode+1,jNode);
%         end
%         if jNode-1 >= 1
%             graphVector(idx).neighbors(end+1) = graph(iNode,jNode-1);
%         end
%         if jNode+1 <= nodes
%             graphVector(idx).neighbors(end+1) = graph(iNode,jNode+1);
%         end
%         
%         L = length(graphVector(idx).neighbors);
%         graphVector(idx).neighborsCost = ones(1,L);%.*2.*rand(1,L);
%         graphVector(idx).x = [iNode;jNode];
%         count = count + 1;
%     end
% end