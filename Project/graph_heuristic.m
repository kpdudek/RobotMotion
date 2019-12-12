%function [h]=graph_heuristic(graphVector,idxX,idxGoal)
%Computes the heuristic  @x   h given by the Euclidean distance between the nodes
%with indexes  @x   idxX and  @x   idxGoal.
function [h]=graph_heuristic(graphVector,idxX,idxGoal)

xStart = graphVector(idxX).x;
xGoal = graphVector(idxGoal).x;

h = sqrt((xStart(1)-xGoal(1))^2 + (xStart(2)-xGoal(2))^2);

end