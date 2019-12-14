%function [xPath,graphVector] = graph_search_startGoal(graphVector,xStart,xGoal)
% This function makes use 

function [jPotStart,jGraph,xGraph,jPotEnd,graphVector,t1,t2,t3]=graph_search_startGoal(graphVector,thetaStart,xGoal)
repulsiveWeight = 0.01;
stepSize = 0.04;

% tic;
xStart = Kinematics(thetaStart);
roadmapStart = graph_nearestNeighbors(graphVector,xStart.EEF,1);
[jPotStart,uPotStart] = robot_potentialPlanner('conic',repulsiveWeight,stepSize,thetaStart,roadmapStart);
t1 = toc;

% tic;
roadmapEnd = graph_nearestNeighbors(graphVector,xGoal,1);
[xGraph,jGraph,graphVector] = graph_search(graphVector,roadmapStart,roadmapEnd);
t2 = toc;

% tic;
thetaGraphEnd = graphVector(roadmapEnd).j';
[jPotEnd,uPotEnd] = robot_potentialPlanner('conic',repulsiveWeight,stepSize,thetaGraphEnd,xGoal);
t3 = toc;
end

