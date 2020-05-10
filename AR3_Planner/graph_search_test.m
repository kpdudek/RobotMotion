close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Load the graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load DenseTest.mat
% load DenseTest_Reversed.mat
% load DenseTest_NearestNeighbors.mat
% load superDenseTest_NearestNeighbors.mat
% load DenseTest_NearestNeighbors_UnsignedAngles.mat
% load finalPaperGraph2.mat
% load finalPaperGraph3.mat
load SpeedImprovementTesting.mat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Run A*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
idxStart = 1;
idxGoal = floor(length(graphVector)-20);

tic;
[xPath,jPath,graphVector] = graph_search(graphVector,idxStart,idxGoal);
time = toc;

fprintf('A* took %3.5f seconds\n',time)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Plot graph with backpointers and final path
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xStart = graphVector(idxStart).x;
xGoal = graphVector(idxGoal).x;
graphPlot(graphVector,1,[xStart,xGoal])
hold on
plot3(xPath(1,:),xPath(2,:),xPath(3,:),'m','LineWidth',2)
axis equal

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Show path through environment with links
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure()
plotThetas(jPath)
hold on
plotObstacles(obstacles)
plot3(xPath(1,:),xPath(2,:),xPath(3,:),'m','LineWidth',2)
plot3(xStart(1,:),xStart(2,:),xStart(3,:),'rs','MarkerSize',20,'LineWidth',3)
plot3(xGoal(1,:),xGoal(2,:),xGoal(3,:),'r+','MarkerSize',20,'LineWidth',3)
axis equal

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Joint space interpolation to show actual tragectory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure()
degreeInterval = 5;
jointTragectory = [];
for iConfig = 1:length(jPath(1,:))-1
    iNeighbor = iConfig+1;
    jStart = zeros(1,4);
    jGoal = zeros(1,4);
    for iElem = 1:length(jStart)
        v0 = [0;0];
        v1 = [1;0];
        v2 = [cos(deg2rad(jPath(iElem,iConfig)));sin(deg2rad(jPath(iElem,iConfig)))];
        jStart(iElem) = rad2deg(edge_angle(v0,v1,v2,'unsigned'));
        v2 = [cos(deg2rad(jPath(iElem,iConfig+1)));sin(deg2rad(jPath(iElem,iConfig+1)))];
        jGoal(iElem) = rad2deg(edge_angle(v0,v1,v2,'unsigned'));
    end
    jointDiff = jStart-jGoal;
    
    for iJoint = 1:4
        if jointDiff(iJoint) < -180
            jGoal(iJoint) = jGoal(iJoint)-360;
        elseif jointDiff(iJoint) > 180
            jGoal(iJoint) = 360-jGoal(iJoint);
        end
    end
    
    len = ceil(max(abs(jointDiff)) / degreeInterval);
    if len > 0
        configs = zeros(4,len);
        for iJoint = 1:4
            configs(iJoint,:) = linspace(jStart(iJoint),jGoal(iJoint),len);
            
        end
    end
    jointTragectory = [jointTragectory,configs];
end
plotThetas(jointTragectory)
hold on
plotObstacles(obstacles)
plot3(xPath(1,:),xPath(2,:),xPath(3,:),'m','LineWidth',2)
plot3(xStart(1,:),xStart(2,:),xStart(3,:),'rs','MarkerSize',20,'LineWidth',3)
plot3(xGoal(1,:),xGoal(2,:),xGoal(3,:),'r+','MarkerSize',20,'LineWidth',3)
axis equal






