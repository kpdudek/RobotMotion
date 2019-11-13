%function [xPath]=graph_path(graphVector,idxStart,idxGoal)
%This function follows the backpointers from the node with index  @x   idxGoal in
% @x   graphVector to the one with index  @x   idxStart node, and returns the 
%coordinates (not indexes) of the sequence of traversed elements.

function [xPath]=graph_path(graphVector,idxStart,idxGoal)
xPath = graphVector(idxGoal).x;
idxCurrent = idxGoal;

while idxCurrent ~= idxStart
    idxCurrent = graphVector(idxCurrent).backpointer;
    xPath = [xPath,graphVector(idxCurrent).x];
end
xPath = fliplr(xPath);
end