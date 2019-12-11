function graphVector = createGraph(QFree)


% Find difference in joint angles between two configs
% largest diff gets spaced by ~.1 rad
% Length of that vector gets used to space the others
% Collision check each config in the spacing and if any config is in collision, exit and dont add node
% to list of neighbors.
% If a node has no neighbors, then remove it from graph

graphVector=repmat(struct('neighbors',[],'neighborsCost',[],'x',[]),length(QFree),1);

for iConfig = 1:length(QFree)
    for iNeighbor = 1:length(neighbors)
        thetas = [iTheta1,iTheta2,iTheta3,iTheta4];
        worldLinks = Kinematics(thetas);

        hold on

        if ~robotIsCollision(worldLinks,obstacles)
            QFree(end+1) = worldLinks;
        else
            collision(end+1) = worldLinks;
        end

        percent = (count / iter) * 100;
        hspace()
        fprintf('%2.1f\n',percent)
        count = count + 1;
    end
end


end