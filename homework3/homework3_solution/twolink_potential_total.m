%function [U]=twolink_potential_total(thetaEval,world,potential)
%Compute the function $U=U_ attr+  @ @ _iU_ rep,i$, where $ $ is given by the
%variable  @x   potential.repulsiveWeight
function [U]=twolink_potential_total(thetaEval,world,potential)
U=potential_total(twolink_kinematicMap(thetaEval),world,potential);
