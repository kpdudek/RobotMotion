function [idxNeighbors] = graph_jointNearestNeighbors(graphVector,idxX,num)

j = graphVector(idxX).j;
NNodes=length(graphVector);

%compute squared Euclidean distance
distSquared = zeros(1,length(graphVector));
for iNode = 1:length(graphVector)
%     diff = (j-graphVector(iNode).j).^2;
    diff = graph_heuristic(graphVector,idxX,iNode);
    distSquared(iNode) = sqrt(sum(diff));
end

%sort and get first k neighbors
[~,idxSorted]=sort(distSquared);
idxNeighbors=[idxSorted(1:min(num,NNodes))];

end