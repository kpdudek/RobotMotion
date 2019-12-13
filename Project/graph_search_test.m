close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Load the graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load DenseTest.mat
% load DenseTest_Reversed.mat
load DenseTest_NearestNeighbors.mat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Run A*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
idxStart = 1;
idxGoal = floor(length(graphVector)/2);

[xPath,jPath,graphVector] = graph_search(graphVector,idxStart,idxGoal);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Plot graph with backpointers and final path
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xStart = graphVector(idxStart).x;
xGoal = graphVector(idxGoal).x;
graphPlot(graphVector,1,[xStart,xGoal])
hold on
plot3(xPath(1,:),xPath(2,:),xPath(3,:),'m','LineWidth',2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Show path through environment with links
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure()
plotThetas(jPath)
hold on
plotObstacles(obstacles)
plot3(xPath(1,:),xPath(2,:),xPath(3,:),'m','LineWidth',2)
plot3(xStart(1,:),xStart(2,:),xStart(3,:),'g.','MarkerSize',30)
plot3(xGoal(1,:),xGoal(2,:),xGoal(3,:),'r.','MarkerSize',30)
axis equal

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Joint space interpolation to show actual tragectory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure()
degreeInterval = 5;
jointTragectory = [];
for iConfig = 1:length(jPath(1,:))-1
    jointDiff = jPath(:,iConfig+1) - jPath(:,iConfig);
    len = floor(max(jointDiff) / degreeInterval);
    configs = zeros(4,len);
    for iJoint = 1:4
        configs(iJoint,:) = linspace(jPath(iJoint,iConfig),jPath(iJoint,iConfig+1),len);
    end
    jointTragectory = [jointTragectory,configs];
end
plotThetas(jointTragectory)
hold on
plotObstacles(obstacles)
plot3(xPath(1,:),xPath(2,:),xPath(3,:),'m','LineWidth',2)
plot3(xStart(1,:),xStart(2,:),xStart(3,:),'g.','MarkerSize',30)
plot3(xGoal(1,:),xGoal(2,:),xGoal(3,:),'r.','MarkerSize',30)
axis equal






