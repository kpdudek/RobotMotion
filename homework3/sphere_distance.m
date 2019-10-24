%function [dPointsSphere,pointsSphere]=sphere_distance(sphere,points)
%Computes the distance between points and the sphere, as well as the point on the
%sphere that realizes that distance, while taking into account if it is hollow or
%filled in.

%Remember that the radius of the sphere is negative for hollow spheres.

function [dPointsSphere,pointsSphere]=sphere_distance(sphere,points)

dPointsSphere = zeros(1,length(points(1,:)));
pointsSphere = zeros(size(points));
xSphere = sphere.xCenter(1);
ySphere = sphere.xCenter(2);

for iPoint = 1:length(points(1,:))
    xPoint = points(1,iPoint);
    yPoint = points(2,iPoint);
    
    euclidDist = sqrt((xPoint-xSphere)^2 + (yPoint-ySphere)^2);
    if sphere.radius > 0
        Dist = (euclidDist - sphere.radius);
    elseif sphere.radius < 0
        Dist = abs(sphere.radius) - euclidDist;
    end
    
    theta = atan((yPoint-ySphere)/(xPoint-xSphere));
    xEdge = sphere.radius * cos(theta) + xSphere;
    yEdge = sphere.radius * sin(theta) + ySphere;
    
    dPointsSphere(iPoint) = Dist;
    pointsSphere(:,iPoint) = [xEdge;yEdge];
end

end