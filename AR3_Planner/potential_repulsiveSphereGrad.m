%function [gradURep]=potential_repulsiveSphereGrad(xEval,sphere)
%Compute the gradient of $U_ rep$ for a single sphere, as given by    @  ( 
%eq:repulsive-gradient \@@italiccorr ).
function [gradURep]=potential_repulsiveSphereGrad(xEval,obstacle)

[dPointSphere,PointSphere] = sphere_distance(obstacle,xEval); %get distance and point on sphere
d_influence = obstacle.distInfluence; % get d_influence

if and(dPointSphere > 0,dPointSphere < d_influence) %if point is in region of influence calculate U
    gradURep = -(1/dPointSphere-1/d_influence)*(1/dPointSphere^2)*(xEval-PointSphere)/dPointSphere;
else
    gradURep = [0;0;0];
end

%This function must use the outputs of sphere_distanceSphere.
