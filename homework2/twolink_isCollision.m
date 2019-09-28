%function [flagTheta]=twolink_isCollision(theta,points)
%For each specified configuration, returns  true if  any of the links of the
%manipulator collides with  any of the points, and  false otherwise. Use the
%function polygon_isCollision to check if each link of the manipulator is in
%collision.
function [flagTheta]=twolink_isCollision(theta,points)

%For this question,  do not consider self-collision (i.e., if the two polygons
%overlap but they do not cover any of the points, then it is not a collision).
