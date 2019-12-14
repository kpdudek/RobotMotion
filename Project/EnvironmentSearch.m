close all;

% load FinalPaperGraph.mat
% load DenseTest_NearestNeighbors_UnsignedAngles
% load finalPaperGraph2.mat
% load finalPaperGraph3.mat
load finalPaperGraph_Dense.mat


%%% Final Paper values
thetaStart = [-100;20;0;0];
xGoal = [-.75;.6;.8];

% thetaStart = [-90;30;0;20];
% xGoal = [-.7;.6;.8];

tic;
[jPotStart,jGraph,xGraph,jPotEnd,graphVector,t1,t2,t3] = graph_search_startGoal(graphVector,thetaStart,xGoal,obstacles);
% Combine joint paths
jPath = [jPotStart(:,1:500:end),jGraph,jPotEnd(:,1:500:end)];
time = toc;

fprintf('Total planning took %3.5f seconds\n\n',time)
fprintf('Onto map  : %3.5f seconds\n',t1)
fprintf('On roadmap: %3.5f seconds\n',t2-t1)
fprintf('Off map   : %3.5f seconds\n\n',t3-t2)
xPotEnd = Kinematics(jPotEnd(:,end));
sse = norm(xPotEnd.EEF - xGoal);
fprintf('Steady state error: %2.3f\n',sse)
% save('finalPaperGraph2_Path.mat','jPath')


% %%% ONTO ROAD MAP
% figure('Color','white')
% % Plot the obstacles and the robot tragectory
% plotObstacles(obstacles);
% hold on
% plotThetas(jPotStart(:,1:500:end));
% graphPlot(graphVector,0,[])
% 
% xStart = Kinematics(thetaStart);
% plot3(xStart.EEF(1),xStart.EEF(2),xStart.EEF(3),'gs','MarkerSize',12,'LineWidth',7)
% plot3(xGoal(1),xGoal(2),xGoal(3),'rs','MarkerSize',12,'LineWidth',4)
% 
% plot3(xGraph(1,1),xGraph(2,1),xGraph(3,1),'y*','MarkerSize',12,'LineWidth',9)
% xlabel('x')
% ylabel('y')
% axis equal
% 
% %%% ON ROAD MAP
% figure('Color','white')
% % Plot the obstacles and the robot tragectory
% plotObstacles(obstacles);
% hold on
% plotThetas(jGraph);
% graphPlot(graphVector,1,[])
% 
% plot3(xStart.EEF(1),xStart.EEF(2),xStart.EEF(3),'gs','MarkerSize',12,'LineWidth',7)
% plot3(xGoal(1),xGoal(2),xGoal(3),'rs','MarkerSize',12,'LineWidth',4)
% 
% plot3(xGraph(1,1),xGraph(2,1),xGraph(3,1),'y*','MarkerSize',12,'LineWidth',9)
% plot3(xGraph(1,end),xGraph(2,end),xGraph(3,end),'c*','MarkerSize',12,'LineWidth',9)
% 
% xlabel('x')
% ylabel('y')
% axis equal
% 
% %%% OFF ROAD MAP
% figure('Color','white')
% % Plot the obstacles and the robot tragectory
% plotObstacles(obstacles);
% hold on
% plotThetas(jPotEnd(:,1:500:end));
% graphPlot(graphVector,0,[])
% 
% plot3(xStart.EEF(1),xStart.EEF(2),xStart.EEF(3),'gs','MarkerSize',12,'LineWidth',7)
% plot3(xGoal(1),xGoal(2),xGoal(3),'rs','MarkerSize',12,'LineWidth',4)
% 
% plot3(xGraph(1,end),xGraph(2,end),xGraph(3,end),'c*','MarkerSize',12,'LineWidth',9)
% 
% 
% xlabel('x')
% ylabel('y')
% axis equal
% 
% %%% TOTAL
% figure('Color','white')
% % Plot the obstacles and the robot tragectory
% plotObstacles(obstacles);
% hold on
% plotThetas(jPath);
% graphPlot(graphVector,0,[])
% 
% xStart = Kinematics(thetaStart);
% plot3(xStart.EEF(1),xStart.EEF(2),xStart.EEF(3),'gs','MarkerSize',12,'LineWidth',7)
% plot3(xGoal(1),xGoal(2),xGoal(3),'rs','MarkerSize',12,'LineWidth',4)
% 
% xlabel('x')
% ylabel('y')
% axis equal











