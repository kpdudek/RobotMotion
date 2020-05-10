%function [xPath]=graph_path(graphVector,idxStart,idxGoal)
%This function follows the backpointers from the node with index  @x   idxGoal in
% @x   graphVector to the one with index  @x   idxStart node, and returns the 
%coordinates (not indexes) of the sequence of traversed elements.

function [xPath,jPath]=graph_path(graphVector,idxStart,idxGoal)
xPath = graphVector(idxGoal).x;
jPath = graphVector(idxGoal).j';
idxCurrent = idxGoal;

while idxCurrent ~= idxStart
    idxCurrent = graphVector(idxCurrent).backpointer;
    xPath = [xPath,graphVector(idxCurrent).x];
    jPath = [jPath,graphVector(idxCurrent).j'];
end
xPath = fliplr(xPath);
jPath = fliplr(jPath);
end