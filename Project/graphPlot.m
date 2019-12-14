function graphPlot(graphVector,backpointer,endPoints)

% Plot end effector locations and the connections between nodes
for iNode = 1:length(graphVector)
    hold on
    x = graphVector(iNode).x(1);
    y = graphVector(iNode).x(2);
    z = graphVector(iNode).x(3);
    plot3(x,y,z,'b.','MarkerSize',20,'HandleVisibility','off')
    
    for iNeighbor = graphVector(iNode).neighbors
        u = graphVector(iNeighbor).x(1) - graphVector(iNode).x(1);
        v = graphVector(iNeighbor).x(2) - graphVector(iNode).x(2);
        w = graphVector(iNeighbor).x(3) - graphVector(iNode).x(3);
        quiver3(x,y,z,u,v,w,'k','AutoScale','off','HandleVisibility','off')
    end
end

% Plot backpointers
if backpointer
    for iNode = 1:length(graphVector)
        if ~isempty(graphVector(iNode).backpointer)
            hold on
            x = graphVector(iNode).x(1);
            y = graphVector(iNode).x(2);
            z = graphVector(iNode).x(3);
            
            idxBP = graphVector(iNode).backpointer;
            u = graphVector(idxBP).x(1) - graphVector(iNode).x(1);
            v = graphVector(idxBP).x(2) - graphVector(iNode).x(2);
            w = graphVector(idxBP).x(3) - graphVector(iNode).x(3);
            quiver3(x,y,z,u,v,w,'g','LineWidth',1.5,'AutoScale','off','HandleVisibility','off')
        end
    end
end

% Plot start and goal
if ~isempty(endPoints)
    hold on
    plot3(endPoints(1,1),endPoints(2,1),endPoints(3,1),'g.','MarkerSize',20,'HandleVisibility','off')
    plot3(endPoints(1,2),endPoints(2,2),endPoints(3,2),'r.','MarkerSize',20,'HandleVisibility','off')
end


end