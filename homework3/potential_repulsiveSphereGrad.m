%function [gradURep]=potential_repulsiveSphereGrad(xEval,sphere)
%Compute the gradient of $U_ rep$ for a single sphere, as given by    @  ( 
%eq:repulsive-gradient \@@italiccorr ).

%This function must use the outputs of sphere_distanceSphere.

function [gradURep]=potential_repulsiveSphereGrad(xEval,sphere)
[dPoints,sPoints] = sphere_distance(sphere,xEval);
gradURep = zeros(2,1);

if (dPoints > 0) && (dPoints < sphere.distInfluence)
    gradDi = (xEval - sPoints) / dPoints;
    gradURep = -1 * (1/dPoints - 1/sphere.distInfluence) * (1/(dPoints^2)) * gradDi;
end


end



