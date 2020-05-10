%function [graphVector,pqOpen]=graph_expandElement(graphVector,idxNBest,idxX,idxGoal,pqOpen)
%This function expands the vertex with index  @x   idxX (which is a neighbor of
%the one with index  @x   idxNBest) and returns the updated versions of  @x  
%graphVector and  @x   pqOpen.

%This function corresponds to lines  it:expansion-start-- it:expansion-end in
%Algorithm  alg:astar.

function [graphVector,pqOpen]=graph_expandElement(graphVector,idxNBest,idxX,idxGoal,pqOpen)
gNBest = graphVector(idxNBest).g;

heuristic = graph_heuristic(graphVector,idxX,idxGoal);
costBP = gNBest + graphVector(idxNBest).neighborsCost(find(graphVector(idxNBest).neighbors==idxX));

if priority_isMember(pqOpen,idxX)
    if costBP < graphVector(idxX).g
        graphVector(idxX).g = costBP;
        graphVector(idxX).backpointer = idxNBest;
    end
else
    graphVector(idxX).g = costBP;
    graphVector(idxX).backpointer = idxNBest;
    pqOpen = priority_insert(pqOpen,idxX,costBP+heuristic);
end

end
