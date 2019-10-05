%function [x]=torus_phi(theta)
%Implements equation    @  (  eq:chartTorus \@@italiccorr ).

function [x]=torus_phi(theta)

x = zeros(3,length(theta(1,:)));

for iTheta = 1:length(theta(1,:))
    % Variables
    theta1 = theta(1,iTheta);
    theta2 = theta(2,iTheta);
    r = 3;
    % Calculations
    phi_mult_mat = [ 1,0 ; 0,0 ; 0,1 ];
    phi_circle = rot2d(theta1) * [1;0];
    x(:,iTheta) = blkdiag(rot2d(theta2),1) * ((phi_mult_mat * phi_circle) + [r;0;0]);
end
end
