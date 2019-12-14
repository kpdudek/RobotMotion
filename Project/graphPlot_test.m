close all; clear; clc;

% load SparseTest.mat
% load DenseTest.mat
% load DenseTest_NearestNeighbors.mat
% load DenseTest_NearestNeighbors_UnsignedAngles.mat
load finalPaperGraph.mat

figure('Name','Graph')
graphPlot(graphVector,0,[])

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