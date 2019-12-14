%function [U]=twolink_potential_total(thetaEval,world,potential)
%Compute the function $U=U_ attr+  @ @ _iU_ rep,i$, where $ $ is given by the
%variable  @x   potential.repulsiveWeight
function [U]=robot_potential_total(thetaEval,obstacles,potential)
xEval = Kinematics(thetaEval);
U=potential_total(xEval.EEF,obstacles,potential);
