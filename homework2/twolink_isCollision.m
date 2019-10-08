%function [flagTheta]=twolink_isCollision(theta,points)
%For each specified configuration, returns  true if  any of the links of the
%manipulator collides with  any of the points, and  false otherwise. Use the
%function polygon_isCollision to check if each link of the manipulator is in
%collision.
%For this question,  do not consider self-collision (i.e., if the two polygons
%overlap but they do not cover any of the points, then it is not a collision).
function [flagTheta]=twolink_isCollision(theta,points)
flagTheta = false(1,length(theta(1,:)));

for iTheta = 1:length(theta(1,:))
    [eef,vertices1,vertices2] = twolink_kinematicMap(theta(:,iTheta));
    if ismember(true,polygon_isCollision(vertices1,points)) || ismember(true,polygon_isCollision(vertices2,points))
        flagTheta(iTheta) = true;
    end
end

end
 