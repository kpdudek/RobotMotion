%function [gradU]=potential_totalGrad(xEval,world,potential)
%Compute the gradient of the total potential, $ U= U_ attr+  @ @ _i U_ rep,i$,
%where $ $ is given by the variable  potential.repulsiveWeight
function [gradU]=potential_totalGrad(xEval,world,potential)
