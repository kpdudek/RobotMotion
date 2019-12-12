close all; clear; clc;

% Create roadmap
r1 = 0:90:359;
r2 = 22.5:22.5:45;
r3 = 0:22.5:45;
r4 = 0;
[graphVector,QFree,collision,obstacles] = createGraph(r1,r2,r3,r4);

% % Motion planner
% thetaStart = [0;0;0;0];
% thetaGoal = [180;45;45;90];
% [xPath,graphVector] = graph_search_startGoal(graphVector,thetaStart,thetaGoal);

figure('Name','Configuration Space')
plotObstacles(obstacles)
plotLinks(QFree)
plotLinks(collision)
axis equal

figure('Name','Free Space')
plotLinks(QFree)
hold on
plotObstacles(obstacles)
axis equal

figure('Name','Collision')
plotLinks(collision)
hold on
plotObstacles(obstacles)
axis equal

%%% Save graph
save DenseTest graphVector QFree collision obstacles
