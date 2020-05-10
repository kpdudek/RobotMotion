%function [xPath,graphVector]=graph_search(graphVector,idxStart,idxGoal)
%Implements the  @x   A* algorithm, as described by the pseudo-code in Algorithm 
%alg:astar.

% Set a maximum limit of iterations in the main  @x   A* loop on line 
%it:astar-main-loop of Algorithm  alg:astar. This will prevent the algorithm from
%remaining stuck on malformed graphs (e.g., graphs containing a node as a
%neighbor of itself), or if you make some mistake during development.

function [xPath,jPath,graphVector]=graph_search(graphVector,idxStart,idxGoal)
xStart = graphVector(idxStart).x;
xGoal = graphVector(idxGoal).x;

for iNode = 1:length(graphVector)
    graphVector(iNode).g = [];
    graphVector(iNode).backpointer = [];
end

pqOpen = priority_prepare();
idxClosed = [];

pqOpen = priority_insert(pqOpen,idxStart,0);
graphVector(idxStart).g = 0;

while ~isempty(pqOpen)
    [pqOpen,idxNBest,~] = priority_minExtract(pqOpen);
    idxClosed = [idxClosed,idxNBest];
    
    if idxNBest == idxGoal
%         xpath = idxStart;
        break
    end
    
    idxNeighbors = graph_getExpandList(graphVector,idxNBest,idxClosed);
    for idxX = 1:length(idxNeighbors)
        [graphVector,pqOpen] = graph_expandElement(graphVector,idxNBest,idxNeighbors(idxX),idxGoal,pqOpen);
    end
%     graphPlot(graphVector,1,[xStart,xGoal])
%     pause(.000001)
end

[xPath,jPath] = graph_path(graphVector,idxStart,idxGoal);
end


