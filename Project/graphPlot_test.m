close all; clear; clc;

% load SparseTest.mat
% load DenseTest.mat
% load DenseTest_NearestNeighbors.mat
% load DenseTest_NearestNeighbors_UnsignedAngles.mat


% load finalPaperGraph2.mat
% load finalPaperGraph3.mat
% load finalPaperGraph_Dense.mat
load finalPaperGraph_SIMPLE.mat


figure('Name','Graph','Color','white')
graphPlot(graphVector,0,[])
axis equal


figure('Name','Configuration Space','Color','white')
plotObstacles(obstacles)
plotLinks(QFree)
plotLinks(collision)

xlabel('x')
ylabel('y')
zlabel('z')
axis equal


figure('Name','Free Space','Color','white')
plotLinks(QFree)
hold on
plotObstacles(obstacles)
graphPlot(graphVector,0,[])

xlabel('x')
ylabel('y')
zlabel('z')
axis equal


figure('Name','Collision','Color','white')
plotLinks(collision)
hold on
plotObstacles(obstacles)

xlabel('x')
ylabel('y')
zlabel('z')
axis equal