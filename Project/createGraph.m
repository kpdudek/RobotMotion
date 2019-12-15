% Find difference in joint angles between two configs
% largest diff gets spaced by ~.1 rad
% Length of that vector gets used to space the others
% Collision check each config in the spacing and if any config is in collision, exit and dont add node
% to list of neighbors.
% If a node has no neighbors, then remove it from graph

function [graphVector,QFree,collision,obstacles] = createGraph(r1,r2,r3,r4)

% Create obstacles
obstacles = getObstacles();

% Set joint angles to be tested and number of permutations
iter = length(r1)*length(r2)*length(r3)*length(r4);

% Initialize structures for Free Space, Collision Space, and graphVector
QFree = initRobot(1);
collision = initRobot(1);
% graphVector=repmat(struct('neighbors',[],'neighborsCost',[],'x',[],'j',[]),length(QFree),1);
graphVector = struct('neighbors',[],'neighborsCost',[],'x',[],'j',[]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Loop through every joint angle specified and use forward kinematics to build
% a grid of collision free poses
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
print = false;
count = 1;
for iTheta4 = r4
    for iTheta3 = r3
        for iTheta2 = r2
            for iTheta1 = r1
                if ~print
                    iter = length(r1)*length(r2)*length(r3)*length(r4);
                    fprintf('%d Iterations will be computed...\n',iter)
                    pause(1)
                    print = true;
                end
                
                thetas = [iTheta1,iTheta2,iTheta3,iTheta4];
                worldLinks = Kinematics(thetas);
                
                % Check if configuration is in collision or not
                if ~robotIsCollision(worldLinks,obstacles)
                    QFree(end+1) = worldLinks;
                    graphVector(end+1).x = worldLinks.EEF;
                    graphVector(end).j = worldLinks.j;
                else
                    collision(end+1) = worldLinks;
                end
                
                % Print percent complete
                percent = (count / iter) * 100;
                if mod(percent,5) < .25
                    hspace()
                    fprintf('%2.1f\n',percent)
                end
                
                % Iterate counter
                count = count + 1;
            end
        end
    end
end
hspace()
fprintf('Done!\n')
QFree = QFree(2:end);
collision = collision(2:end);
graphVector = graphVector(2:end);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Determine neighbors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Determining neighbors...\n')
for iConfig = 1:length(QFree)
    neighborCount = 4; % neighbors before and after
    idxNeighbors = graph_jointNearestNeighbors(graphVector,iConfig,neighborCount);
    graphVector(iConfig).neighbors = [graphVector(iConfig).neighbors,idxNeighbors];
    
%     if iConfig-(neighborCount) > 0 && iConfig+(neighborCount) <= length(QFree)
%         graphVector(iConfig).neighbors = [iConfig-(neighborCount):iConfig-1, iConfig+1:iConfig+neighborCount];
%     elseif iConfig-(neighborCount) <= 0
%         diff = abs((iConfig-1) - (neighborCount));
%         graphVector(iConfig).neighbors = [length(QFree) - diff:length(QFree),iConfig+1:iConfig+neighborCount];
%     elseif iConfig+(neighborCount) > length(QFree)
%         diff = (iConfig+neighborCount) - length(QFree);
%         graphVector(iConfig).neighbors = [iConfig-(neighborCount):iConfig-1,1:diff+1];
%     end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Chaos neighbors
% Randomly connect two nodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Assigning random connections...\n')

% TODO: check to see if they're already neighbors
numRandos = 200;
for iRand = 1:numRandos
    upperBound = length(graphVector);
    randNeighbor = randi([1,upperBound],1,2);
    graphVector(randNeighbor(1)).neighbors(end+1) = randNeighbor(2);
    graphVector(randNeighbor(2)).neighbors(end+1) = randNeighbor(1);
end
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ensure the graph is bi-directional by looping through and checking if
% node a has neighbor b, node b has neighbor a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for iConfig = 1:length(graphVector)
    for iNeighbor = graphVector(iConfig).neighbors
        if ~ismember(iConfig,graphVector(iNeighbor).neighbors)
            graphVector(iNeighbor).neighbors = [graphVector(iNeighbor).neighbors,iConfig];
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Determine neighbors cost
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Determining neighbors cost...\n')
for iConfig = 1:length(graphVector)
    graphVector(iConfig).neighborsCost = zeros(1,length(graphVector(iConfig).neighbors));
    for iNeighbor = 1:length(graphVector(iConfig).neighbors)
        iGoal = graphVector(iConfig).neighbors(iNeighbor);
        graphVector(iConfig).neighborsCost(iNeighbor) = graph_heuristic(graphVector,iConfig,iGoal);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Loop through every node in the graph and check if the motion between each
% neighbor is collision free using linear interpolation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
print = false;
count = 1;
degreeInterval = 5; % Number of degrees to interpolate by between angles
for iConfig = 1:length(graphVector)
    if ~print
        iter = length(graphVector);
        fprintf('%d Iterations will be computed...\n',iter)
        pause(1)
        print = true;
    end
    
    for iNeighbor = graphVector(iConfig).neighbors
        if iConfig ~= iNeighbor
            xStart = zeros(1,4);
            xGoal = zeros(1,4);
            for iElem = 1:length(graphVector(iConfig).j)
                v0 = [0;0];
                v1 = [1;0];
                v2 = [cos(deg2rad(graphVector(iConfig).j(iElem)));sin(deg2rad(graphVector(iConfig).j(iElem)))];
                xStart(iElem) = rad2deg(edge_angle(v0,v1,v2,'unsigned'));
                v2 = [cos(deg2rad(graphVector(iNeighbor).j(iElem)));sin(deg2rad(graphVector(iNeighbor).j(iElem)))];
                xGoal(iElem) = rad2deg(edge_angle(v0,v1,v2,'unsigned'));
            end
            
            jointDiff = xStart-xGoal;
            
            for iJoint = 1:4
                if jointDiff(iJoint) < -180
                    xGoal(iJoint) = xGoal(iJoint)-360;
                elseif jointDiff(iJoint) > 180
                    xGoal(iJoint) = 360-xGoal(iJoint);
                end
            end
            
            len = ceil((max(abs(jointDiff))) / degreeInterval);
            if len > 0
                configs = zeros(4,len);
                for iJoint = 1:4
                    configs(iJoint,:) = linspace(xStart(iJoint),xGoal(iJoint),len);
                end
            end
            for iInterval = 1:len
                worldLinks = Kinematics(configs(:,iInterval));
                if robotIsCollision(worldLinks,obstacles)
                    graphVector(iConfig).neighbors = graphVector(iConfig).neighbors(find(graphVector(iConfig).neighbors~=iNeighbor));
                    break
                end
            end
        end
    end
    
    percent = (count / iter) * 100;
    if mod(percent,3) < .5
        hspace()
        fprintf('%2.1f\n',percent)
    end
    count = count +1;
end
hspace()
fprintf('Done!\n')

end