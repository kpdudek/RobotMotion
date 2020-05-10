%function [URep]=potential_repulsiveSphere(xEval,sphere)
%Evaluate the sum repulsive potentials from  sphere at the location $x= xEval$.
%The function returns the repulsive potential as given by    @  (  eq:repulsive
%\@@italiccorr ).
function [URep]=potential_repulsiveSphere(xEval,obstacle)
nbXEval=size(xEval,2);
dist=sphere_distance(obstacle,xEval);
%Initialize returned potential with a default value
URep=zeros(1,nbXEval);
%Set points inside the obstacle
flagDistPositive=dist>0;
URep(~flagDistPositive)=Inf;
%Set points inside the radius of influence
flagDistInfluence=dist<obstacle.distInfluence;
URep(flagDistPositive & flagDistInfluence)=(1./dist(flagDistPositive)-1/obstacle.distInfluence).^2/2;
