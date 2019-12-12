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

    neighborCount = 4; % Must be even
    if iConfig-(neighborCount/2) > 0 && iConfig+(neighborCount/2) < length(QFree)
        graphVector(iConfig).neighbors = iConfig-(neighborCount/2):iConfig+(neighborCount/2);
    elseif iConfig-(neighborCount/2) < 0
        graphVector(iConfig).neighbors = iConfig:iConfig+2;
    elseif iConfig+(neighborCount/2) > length(QFree)
        graphVector(iConfig).neighbors = iConfig-(neighborCount/2):iConfig;
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