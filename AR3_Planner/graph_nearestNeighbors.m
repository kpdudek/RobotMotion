%Returns the k nearest neighbors in the graph for a given point.
%Input arguments
%   graphVector (dim. [NNodes x 1], type struct): the structure describing the graph of the roadmap, as specified in Homework 4.
%   x (dim. [2 x 1]): coordinates of the point of which we need to find the nearest neighbors.
%   k (dim. [1 x 1]): number of nearest neighbors to find.
%Output arguments
%    idxNeighbors (dim. [NNeighbors x 1]): indeces in graphVector of the neighbors of x. Generally, NNeighbors=k, except when graphVector contains less than k vertices, in which case all vertices are returned.
function [idxNeighbors]=graph_nearestNeighbors(graphVector,x,k)

distSquared = zeros(1,length(graphVector));
%compute squared Euclidean distance
for iNode = 1:length(graphVector)
    distSquared(iNode) = sqrt((graphVector(iNode).x(1)-x(1))^2 + (graphVector(iNode).x(2)-x(2))^2 + (graphVector(iNode).x(3)-x(3))^2);
end

%sort and get first k neighbors
[~,idxSorted]=sort(distSquared);
idxNeighbors=idxSorted(1:min(k,length(graphVector)));
