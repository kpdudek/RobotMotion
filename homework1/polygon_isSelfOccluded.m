%function [flagPoint]=polygon_isSelfOccluded(vertex,vertexPrev,vertexNext,point)
%Given the corner of a polygon, checks whether a given point is self-occluded or
%not by that polygon (i.e., if it is ``inside'' the corner's cone or not). Points
%on boundary (i.e., on one of the sides of the corner) are not considered
%self-occluded.  Note that to check self-occlusion from one vertex, knowing the
%two lines formed with the previous and next vertices (and their ordering) is
%sufficient.

%Use the function edge_angle to check the angle between the segment  vertex--
%point and the segments  vertex-- vertexPrev and  vertex-- vertexNext. The
%function returns  NaN if  vertex1 or  vertex2 coincides with  vertex0.

function [flagPoint]=polygon_isSelfOccluded(vertex,vertexPrev,vertexNext,point)

cone_angle = edge_angle(vertex,vertexPrev,vertexNext,'unsigned');
point_angle = edge_angle(vertex,vertexPrev,point,'unsigned');

if point_angle < cone_angle && point_angle > 0
    flagPoint = true;
    return
else
    flagPoint = false;
end

end

