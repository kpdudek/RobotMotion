%function [dPointsSphere,pointsSphere]=sphere_distance(sphere,points)
%Computes the distance between points and the sphere, as well as the point on the
%sphere that realizes that distance, while taking into account if it is hollow or
%filled in.
function [dPointsSphere,pointsSphere]=sphere_distance(sphere,points)

%Remember that the radius of the sphere is negative for hollow spheres.
