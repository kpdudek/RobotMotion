close all; clear; clc;

thetaStart = [-90;45;45;45];
xGoal = [0;-.6;.5];

tic;
[xPath,uPath] = robot_potentialPlanner('conic',.01,.05,thetaStart,xGoal);
time = toc;

fprintf('Potential planner took %3.5f seconds\n',time)


%%% PLot
obstacles = getObstacles();
linkStart = Kinematics(thetaStart);

figure()
plotLinks(linkStart)
hold on
plot3(linkStart.EEF(1),linkStart.EEF(2),linkStart.EEF(3),'gs','LineWidth',5,'MarkerSize',15)
plot3(xGoal(1),xGoal(2),xGoal(3),'rs','LineWidth',5,'MarkerSize',15)
plotObstacles(obstacles)
hold on
plotThetas(xPath(:,1:1000:end))
xlabel('x')
ylabel('y')
axis equal