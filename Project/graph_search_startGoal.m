%function [xPath]=graph_search_startGoal(graphVector,xStart,xGoal)
%This function performs the following operations: enumerate  the two indexes  @x 
% idxStart,  @x   idxGoal in  @x   graphVector that are closest to  @x   xStart
%and  @x   xGoal (using graph_nearestNeighbors twice, see Question 
%q:graph-nearest).  graph_search to find a feasible sequence of points  @x  
%xPath from  @x   idxStart to  @x   idxGoal.   @x   xStart and  @x   xGoal,
%respectively, to the beginning and the end of the array  @x   xPath. enumerate

function [xPath,graphVector]=graph_search_startGoal(graphVector,thetaStart,thetaGoal)

idxStart = graph_nearestNeighbors(graphVector,thetaStart,1);
idxGoal = graph_nearestNeighbors(graphVector,thetaGoal,1);

[xPath,graphVector] = graph_search(graphVector,idxStart,idxGoal);

xPath = [thetaStart,xPath,thetaGoal];

end

