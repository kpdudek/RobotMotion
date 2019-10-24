%function [gradU]=potential_totalGrad(xEval,world,potential)
%Compute the gradient of the total potential, $ U= U_ attr+  @ @ _i U_ rep,i$,
%where $ $ is given by the variable  potential.repulsiveWeight
function [gradU]=potential_totalGrad(xEval,world,potential)

gradUattr = potential_attractiveGrad(xEval,potential);
gradU = gradUattr;
for iRep = 1:length(world)
    gradUrep = potential_repulsiveSphereGrad(xEval,world(iRep));
    gradU = gradU + (potential.repulsiveWeight * gradUrep);
end

end