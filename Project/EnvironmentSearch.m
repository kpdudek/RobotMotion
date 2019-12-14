close all; clear; clc;

% load FinalPaperGraph.mat
% load DenseTest_NearestNeighbors_UnsignedAngles
load finalPaperGraph2.mat

thetaStart = [-90;45;45;45];
xGoal = [-.4;-.6;.5];

tic;
[jPotStart,jGraph,xGraph,jPotEnd,graphVector,t1,t2,t3] = graph_search_startGoal(graphVector,thetaStart,xGoal);
% Combine joint paths
jPath = [jPotStart(:,1:250:end),jGraph,jPotEnd(:,1:250:end)];
time = toc;

fprintf('Total planning took %3.5f seconds\n\n',time)
fprintf('Onto map  : %3.5f seconds\n',t1)
fprintf('On roadmap: %3.5f seconds\n',t2-t1)
fprintf('Off map   : %3.5f seconds\n',t3-t2)

figure()
% Plot the obstacles and the robot tragectory
plotObstacles(obstacles);
hold on
plotThetas(jPath);
graphPlot(graphVector,1,[])

% Plot the start and end of the 
xStart = Kinematics(thetaStart);
plot3(xStart.EEF(1),xStart.EEF(2),xStart.EEF(3),'gs','MarkerSize',15,'LineWidth',7)
plot3(xGoal(1),xGoal(2),xGoal(3),'rs','MarkerSize',15,'LineWidth',7)

xPotStart = Kinematics(jPotStart(:,1));
xPotEnd = Kinematics(jPotStart(:,end));
plot3(xPotStart.EEF(1),xPotStart.EEF(2),xPotStart.EEF(3),'g+','MarkerSize',15,'LineWidth',7)
plot3(xPotEnd.EEF(1),xPotEnd.EEF(2),xPotEnd.EEF(3),'r+','MarkerSize',15,'LineWidth',7)

xPotStart = Kinematics(jPotEnd(:,1));
xPotEnd = Kinematics(jPotEnd(:,end));
plot3(xPotStart.EEF(1),xPotStart.EEF(2),xPotStart.EEF(3),'c*','MarkerSize',15,'LineWidth',7)
plot3(xPotEnd.EEF(1),xPotEnd.EEF(2),xPotEnd.EEF(3),'m*','MarkerSize',15,'LineWidth',7)

xlabel('x')
ylabel('y')
axis equal