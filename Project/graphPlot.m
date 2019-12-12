function graphPlot(graphVector)

for iNode = 1:length(graphVector)
    hold on
    x = graphVector(iNode).x(1);
    y = graphVector(iNode).x(2);
    z = graphVector(iNode).x(3);
    plot3(x,y,z,'b.','MarkerSize',20)
    
    for iNeighbor = graphVector(iNode).neighbors
        u = graphVector(iNeighbor).x(1) - graphVector(iNode).x(1);
        v = graphVector(iNeighbor).x(2) - graphVector(iNode).x(2);
        w = graphVector(iNeighbor).x(3) - graphVector(iNode).x(3);
        quiver3(x,y,z,u,v,w,'k','AutoScale','off')
    end
end

end