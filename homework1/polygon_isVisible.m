%function [flagPoints]=polygon_isVisible(vertices,indexVertex,testPoints)
%Checks whether a point $p$ is visible from a vertex $v$ of a polygon. In order
%to be visible, two conditions need to be satisfied: enumerate  point $p$ should
%not be self-occluded with respect to the vertex $v$\\ (see
%polygon_isSelfOccluded).  segment $p$--$v$ should not collide with  any of the
%edges of the polygon (see edge_isCollision). enumerate

%Note that, with the definitions of edge collision and self-occlusion given in
%the previous questions, a vertex should be visible from the previous and
%following vertices in the polygon.

function [flagPoints]=polygon_isVisible(vertices,indexVertex,testPoints)

% Assigning indexes for the previous and next element while handling the
% edge cases where the index is the first or last element
if indexVertex == length(vertices(1,:))
    iNextElement = 1;
    iPreviousElement = indexVertex -1;
elseif indexVertex == 1
    iPreviousElement = length(vertices(1,:));
    iNextElement = indexVertex + 1;
else
    iPreviousElement = indexVertex - 1;
    iNextElement = indexVertex + 1;
end
vertex0 = vertices(:,indexVertex);
vertex1 = vertices(:,iPreviousElement);
vertex2 = vertices(:,iNextElement);

% Loop through every test point
% If the point is self occluded it is not visible and move on
% If the point is not self occluded check if the ray from vertex_i to P
% collides with any edge in the polygon
flagPoints = false(1,length(testPoints(1,:)));
for iPoint = 1:length(testPoints(1,:))
    point = testPoints(:,iPoint);
    pointOccluded = polygon_isSelfOccluded(vertex0,vertex1,vertex2,point);
    if pointOccluded == true
        flagPoints(iPoint) = false;
    else
        % Create an edge of the polygon from vertex_i-1 to vertex_i
        for iVertex = 1:length(vertices(1,:))
            if iVertex == 1
                % If the vertex is the first in the array, make the previous
                % vertex the last element in the array
                edge = [vertices(1,end),vertices(1,iVertex);vertices(2,end),vertices(2,iVertex)];
                pointRay = [vertices(1,iVertex),point(1);vertices(2,iVertex),point(2)];
                if edge_isCollision(edge,pointRay)
                    flagPoints(iPoint) = false;
                else
                    flagPoints(iPoint) = true;
                end
            else
                edge = [vertices(1,iVertex-1),vertices(1,iVertex);vertices(2,iVertex-1),vertices(2,iVertex)];
                pointRay = [vertices(1,iVertex),point(1);vertices(2,iVertex),point(2)];
                if edge_isCollision(edge,pointRay)
                    flagPoints(iPoint) = false;
                else
                    flagPoints(iPoint) = true;
                end
            end
        end
    end
end


end
