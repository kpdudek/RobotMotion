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

% Loop through every configuration
print = false;
count = 1;
for iTheta1 = r1
    for iTheta2 = r2
        for iTheta3 = r3
            for iTheta4 = r4
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
                else
                    collision(end+1) = worldLinks;
                end
                
                % Print percent complete
                percent = (count / iter) * 100;
                hspace()
                fprintf('%2.1f\n',percent)
                
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

% Determine neighbors
fprintf('Determining neighbors...\n')
graphVector=repmat(struct('neighbors',[],'neighborsCost',[],'x',[],'j',[]),length(QFree),1);
for iConfig = 1:length(QFree)
    graphVector(iConfig).x = QFree(iConfig).EEF;
    graphVector(iConfig).j = QFree(iConfig).j;

    neighborCount = 2; % neighbors before and after
    if iConfig-(neighborCount) > 0 && iConfig+(neighborCount) <= length(QFree)
        graphVector(iConfig).neighbors = [iConfig-(neighborCount):iConfig-1, iConfig+1:iConfig+neighborCount];
    elseif iConfig-(neighborCount) <= 0
        diff = abs((iConfig-1) - (neighborCount));
        graphVector(iConfig).neighbors = [length(QFree) - diff:length(QFree),iConfig+1:iConfig+neighborCount];
    elseif iConfig+(neighborCount) > length(QFree)
        diff = (iConfig+neighborCount) - length(QFree);
        graphVector(iConfig).neighbors = [iConfig-(neighborCount):iConfig-1,1:diff+1];
    end
end

% Ensure the graph is bi-directional by looping through and checking if
% node a has neighbor b, node b has neighbor a
for iConfig = 1:length(graphVector)
    do_stuff = 1;
end

% Determine neighbors cost
fprintf('Determining neighbors cost...\n')
for iConfig = 1:length(graphVector)
    graphVector(iConfig).neighborsCost = zeros(1,length(graphVector(iConfig).neighbors));
    for iNeighbor = 1:length(graphVector(iConfig).neighbors)
        iGoal = graphVector(iConfig).neighbors(iNeighbor);
        graphVector(iConfig).neighborsCost(iNeighbor) = graph_heuristic(graphVector,iConfig,iGoal);
    end
end


% Loop through every node in the graph and check if the motion between each
% neighbor is collision free using linear interpolation
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
            jointDiff = graphVector(iNeighbor).j - graphVector(iConfig).j;
            len = floor(max(jointDiff) / degreeInterval);
            configs = zeros(4,len);
            for iJoint = 1:4
                configs(iJoint,:) = linspace(graphVector(iConfig).j(iJoint),graphVector(iNeighbor).j(iJoint),len);
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
    hspace()
    fprintf('%2.1f\n',percent)
    count = count +1;
end
hspace()
fprintf('Done!\n')

end