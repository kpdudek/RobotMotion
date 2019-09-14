%function [flag]=edge_isCollision(vertices1,vertices2)
%Returns  true if the two edges intesect.  Note: if the two edges overlap but are
%colinear, or they overlap only at a single endpoint, they are not considered as
%intersecting (i.e., in these cases the function returns  false). If one of the
%two edges has zero length, the function should always return the result that
%edges are non-intersecting.

%The function should be able to handle any orientation of the edges (including
%both vertical and horizontal). Note that the ``overlap'' case needs to be
%checked up to floating-point precision.


function [flag]=edge_isCollision(vertices1,vertices2)
% This function computes the linear equation for each pair of vertices. The
% intersection of the two lines is computed and if the x value of the
% intersection falls in the range of the vertices passed then they are
% considered in collision

% Zero length condition returns no collision. If x and y points are the
% same, the line is considered zero length
zeroLength = ((vertices1(1,1)==vertices1(1,2)) && (vertices1(1,1)==vertices1(2,2))) || ((vertices2(1,1)==vertices2(1,2)) && (vertices2(1,1)==vertices2(2,2)));
if zeroLength
    flag = false;
    return
end

% Endpoint intersections return false. This loop checks if the x and y
% coordinate are equal for each vertex in the two arrays
for iVertex = 1:2
    for jVertex = 1:2
        endpointIntersection = (vertices1(1,iVertex) == vertices2(1,jVertex)) && (vertices1(2,iVertex) == vertices2(2,jVertex));
        if endpointIntersection
            flag = false;
            return
        end
    end
end

% Compute the parameters of the linear equation for each set of vertices
vertices1_linearSlope = ((vertices1(2,2)-vertices1(2,1))/(vertices1(1,2)-vertices1(1,1)));
vertices1_Yintercept = vertices1(2,1)-(vertices1_linearSlope*vertices1(1,1));

vertices2_linearSlope = ((vertices2(2,2)-vertices2(2,1))/(vertices2(1,2)-vertices2(1,1)));
vertices2_Yintercept = vertices2(2,1)-(vertices2_linearSlope*vertices2(1,1));

% Check for parallel lines which will never collide
if vertices1_linearSlope == vertices2_linearSlope
    flag = false;
    return
end

% Compute the actual intersections. The first two conditions handles vertical
% lines
if vertices1_linearSlope == Inf
    vertices1_xValue = vertices1(1,1);
    y_intersection = vertices2_linearSlope * vertices1_xValue + vertices2_Yintercept;
    
    yinRange = (y_intersection <= max(vertices1(2,:))) && (y_intersection >= min(vertices1(2,:))) && (y_intersection <= max(vertices2(2,:))) && (y_intersection >= min(vertices2(2,:)));
    if yinRange
        flag = true;
        return
    else
        flag = false;
        return
    end
        
elseif vertices2_linearSlope == Inf
    vertices2_xValue = vertices2(1,1);
    y_intersection = vertices1_linearSlope * vertices2_xValue + vertices1_Yintercept;
    
    yinRange = (y_intersection <= max(vertices1(2,:))) && (y_intersection >= min(vertices1(2,:))) && (y_intersection <= max(vertices2(2,:))) && (y_intersection >= min(vertices2(2,:)));
    if yinRange
        flag = true;
        return
    else
        flag = false;
        return
    end
else
    % Set the left hand side of the linear equation equal to each other to find
    % the x value of the intersection between the lines
    x_intersection = (vertices2_Yintercept - vertices1_Yintercept) / (vertices1_linearSlope - vertices2_linearSlope);
    
    % If the intersection x value falls in the x-range for each set of vertices
    % then they are considered intersecting edges
    % By using a <= or >= single end point
    xinRange = (x_intersection <= max(vertices1(1,:))) && (x_intersection >= min(vertices1(1,:))) && (x_intersection <= max(vertices2(1,:))) && (x_intersection >= min(vertices2(1,:)));
    if xinRange
        flag = true;
        return
    else
        flag = false;
        return
    end
end
end