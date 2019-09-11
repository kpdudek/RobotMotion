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

vertex0 = vertices(:,indexVertex);
vertex1 = vertices(:,indexVertex-1);
vertex2 = vertices(:,indexVertex+1);

flagPoints = [];
for iPoint = 1:length(testPoints(1,:))
    point = testPoints(:,iPoint);
    pointOccluded = polygon_isSelfOccluded(vertex0,vertex1,vertex2,point);
    if pointOccluded
        flagPoints(end+1) = false;
    else
        for nbVertices = 1:length(vertices(1,:))
            if nbVertices == 1
                edge = [vertices(1,nbVertices),vertices(1,end);vertices(2,nbVertices),vertices(2,end)];
                pointRay = [vertices(1,nbVertices),point(1);vertices(2,nbVertices),point(2)];
                if edge_isCollision(edge,pointRay)
                    flagPoints(end+1) = false;
                end
            end
        end
    end
end


end
