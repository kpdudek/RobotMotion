%function [vertexEffectorDot]=twolink_jacobian(theta,thetaDot)
%Implement the map for the Jacobian of the position of the end effector with
%respect to the joint angles as derived in Question  q:jacobian-effector.

function [vertexEffectorDot]=twolink_jacobian(theta,thetaDot)

vertexEffectorDot = zeros(size(theta));

% Translation vector from B2 -> B1
B1_T_B2 = [5;0];

% End effector coordinates
p_eff = [4.5;0];

for iTheta = 1:length(theta(1,:))
    theta1 = theta(1,iTheta);
    theta2 = theta(2,iTheta);
    thetaDot1 = thetaDot(1,iTheta);
    thetaDot2 = thetaDot(2,iTheta);
    
    hat1 = [ 0         , -thetaDot1;
             thetaDot1 , 0
           ];
    
    hat2 = [ 0         , -thetaDot2;
             thetaDot2 , 0
           ];
    
    vertexEffectorDot(:,iTheta) = (rot2d(theta1)*hat1)*(rot2d(theta2)*hat2)*p_eff + (rot2d(theta1)*hat1)*B1_T_B2;
end

end