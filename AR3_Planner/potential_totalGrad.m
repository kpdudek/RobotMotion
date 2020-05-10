%function [gradU]=potential_totalGrad(xEval,world,potential)
%Compute the gradient of the total potential, $ U= U_ attr+  @ @ _i U_ rep,i$,
%where $ $ is given by the variable  potential.repulsiveWeight
function [gradU]=potential_totalGrad(xEval,obstacles,potential)
[~,world_size] = size(obstacles); % check the size of the world for iteration
gradU = potential_attractiveGrad(xEval,potential); % initialize gradU as the attractive potential grad

for iworld_sphere = 1:world_size % iterate through each sphere and add the repulsive potential
   gradU = gradU+potential.repulsiveWeight*potential_repulsiveSphereGrad(xEval,obstacles(iworld_sphere)); 
end