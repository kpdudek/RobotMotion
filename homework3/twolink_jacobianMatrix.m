%function [Jtheta]=twolink_jacobianMatrix(theta)
%Compute the matrix representation of the Jacobian of the position of the end
%effector with respect to the joint angles as derived in Question 
%q:jacobian-matrix.
function [Jtheta]=twolink_jacobianMatrix(theta)

xeff = 4.5;
xTrans = 5;
theta1 = theta(1);
theta2 = theta(2);

oneone = xeff*((-sin(theta1)*cos(theta2))+(-cos(theta1)*sin(theta2))) + xTrans*(-sin(theta1));

onetwo = xeff*((-cos(theta1)*sin(theta2))+(-sin(theta1)*cos(theta2)));

twoone = xeff*((cos(theta1)*cos(theta2))+(-sin(theta1)*sin(theta2))) + xTrans*(cos(theta1));

twotwo = xeff*((-sin(theta2)*sin(theta1))+(cos(theta1)*cos(theta2)));


Jtheta =  [oneone, onetwo ; twoone, twotwo];

end


