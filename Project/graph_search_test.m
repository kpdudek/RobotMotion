close all;

load DenseTest.mat

idxStart = 1;
idxGoal = length(graphVector);

[xPath,jPath,graphVector] = graph_search(graphVector,idxStart,idxGoal);

graphPlot(graphVector)
hold on
plot3(xPath(1,:),xPath(2,:),xPath(3,:),'b','LineWidth',1.5)
