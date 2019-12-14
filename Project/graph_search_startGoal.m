%function [xPath,graphVector] = graph_search_startGoal(graphVector,xStart,xGoal)
% This function makes use 

function [jPotStart,jGraph,xGraph,jPotEnd,graphVector]=graph_search_startGoal(graphVector,thetaStart,xGoal)
repulsiveWeight = 0.01;
stepSize = 0.05;
xStart = Kinematics(thetaStart);
roadmapStart = graph_nearestNeighbors(graphVector,xStart.EEF,1);
[jPotStart,uPotStart] = robot_potentialPlanner('quadratic',repulsiveWeight,stepSize,thetaStart,roadmapStart);

roadmapEnd = graph_nearestNeighbors(graphVector,xGoal,1);
[xGraph,jGraph,graphVector] = graph_search(graphVector,roadmapStart,roadmapEnd);


thetaGraphEnd = graphVector(roadmapEnd).j';
[jPotEnd,uPotEnd] = robot_potentialPlanner('quadratic',repulsiveWeight,stepSize,thetaGraphEnd,xGoal);

end

