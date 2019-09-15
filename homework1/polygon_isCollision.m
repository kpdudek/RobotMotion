%function [flagPoints]=polygon_isCollision(vertices,testPoints)
%Checks whether the a point is in collsion with a polygon (that is, inside for a
%filled in polygon, and outside for a hollow polygon).
function [flagPoints]=polygon_isCollision(vertices,testPoints)

flagPoints = false(1,length(testPoints(1,:)));
for iPoint = 1:length(testPoints(1,:))
    for iVertex = 1:length(vertices(1,:))
        flagVisible = polygon_isVisible(vertices,iVertex,testPoints);
    end
    if ismember(true,flagVisible)
        flagPoints(iPoint) = false;
    else
        flagPoints(iPoint) = true;
    end
end
end