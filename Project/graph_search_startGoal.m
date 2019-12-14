%function [xPath,graphVector] = graph_search_startGoal(graphVector,xStart,xGoal)
% This function makes use 

function [jPotStart,jGraph,xGraph,jPotEnd,graphVector,t1,t2,t3]=graph_search_startGoal(graphVector,thetaStart,xGoal,obstacles)

%%% Get on roadmap
repulsiveWeight = 0.0001;
stepSize = 0.045;
steps = 3500;

xStart = Kinematics(thetaStart);
roadmapStart = graph_nearestNeighbors(graphVector,xStart.EEF,1);
roadmapStartX = graphVector(roadmapStart).x;
[jPotStart,uPotStart] = robot_potentialPlanner('conic',repulsiveWeight,stepSize,thetaStart,roadmapStartX,obstacles,steps);
t1 = toc;

%%% On roadmap
roadmapEnd = graph_nearestNeighbors(graphVector,xGoal,1);
[xGraph,jGraph,graphVector] = graph_search(graphVector,roadmapStart,roadmapEnd);
t2 = toc;

%%% Get off roadmap
repulsiveWeight = 0.01;
stepSize = 0.1;
steps = 2500;
thetaGraphEnd = graphVector(roadmapEnd).j';
[jPotEnd,uPotEnd] = robot_potentialPlanner('conic',repulsiveWeight,stepSize,thetaGraphEnd,xGoal,obstacles,steps);
t3 = toc;
end

