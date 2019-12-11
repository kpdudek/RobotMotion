close all; clear; clc;

[graphVector,QFree,collision,obstacles] = createGraph();

figure()
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

save SparseTest QFree collision
