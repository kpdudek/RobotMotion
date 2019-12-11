% Find difference in joint angles between two configs
% largest diff gets spaced by ~.1 rad
% Length of that vector gets used to space the others
% Collision check each config in the spacing and if any config is in collision, exit and dont add node
% to list of neighbors.
% If a node has no neighbors, then remove it from graph

function [graphVector,QFree,collision,obstacles] = createGraph()

% Create obstacles
obstacles = getObstacles();

% Set joint angles to be tested and number of permutations
r1 = 0:90:359;
r2 = 0:22.5:45;
r3 = 0:22.5:45;
r4 = 0;
iter = length(r1)*length(r2)*length(r3)*length(r4);

% Initialize structures for Free Space, Collision Space, and graphVector
QFree = initRobot(iter);
collision = initRobot(iter);
graphVector=repmat(struct('neighbors',[],'neighborsCost',[],'x',[]),length(iter),1);

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
                
                graphVector(count).x = worldLinks.EEF.Points;
                
                if count-5 > 0 && count+5<iter
                    graphVector(count).neighbors = count-5:count+5;
                elseif count-5 < 0
                    graphVector(count).neighbors = count:count+5;
                elseif count+5 > iter
                    graphVector(count).neighbors = count-5:count;
                end
               
                
                if ~robotIsCollision(worldLinks,obstacles)
                    QFree(count) = worldLinks;
                else
                    collision(count) = worldLinks;
                end
                
                percent = (count / iter) * 100;
                hspace()
                fprintf('%2.1f\n',percent)
                count = count + 1;
                
            end
        end
    end
end
QFree = QFree(2:end);
collision = collision(2:end);
hspace()
fprintf('Done!\n')



% for iConfig = 1:length(QFree)
%     neighbors = getNeighbors(links,graphVector);
%     for iNeighbor = 1:length(neighbors)
%         thetas = [iTheta1,iTheta2,iTheta3,iTheta4];
%         worldLinks = Kinematics(thetas);
% 
%         hold on
% 
%         if ~robotIsCollision(worldLinks,obstacles)
%             QFree(end+1) = worldLinks;
%         else
%             collision(end+1) = worldLinks;
%         end
% 
%         percent = (count / iter) * 100;
%         hspace()
%         fprintf('%2.1f\n',percent)
%         count = count + 1;
%     end
% end


end