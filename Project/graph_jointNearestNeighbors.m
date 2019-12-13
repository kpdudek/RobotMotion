function [idxNeighbors] = graph_jointNearestNeighbors(graphVector,idxX,num)

j = graphVector(idxX).j;
NNodes=length(graphVector);

%compute squared Euclidean distance
distSquared = zeros(1,length(graphVector));
for iNode = 1:length(graphVector)
    diff = (j-graphVector(iNode).j).^2;
    distSquared(iNode) = sqrt(sum(diff));
end

%sort and get first k neighbors
[~,idxSorted]=sort(distSquared);
idxNeighbors=[idxSorted(1:min(floor(num*(2/3)),NNodes)),idxSorted(min(4+floor(num*(1/3)),NNodes))];

end