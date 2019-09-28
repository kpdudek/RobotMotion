%function [vertexEffectorTransf,vertices1Transf,vertices2Transf]=twolink_kinematicMap(theta)
%The function returns the coordinate of the end effector, plus the vertices of
%the links, all transformed according to $ _1, _2$.

%Use the results from Question  q:kinematicMapDerivation to guide your
%implementation. This function must use twolink_polygons to obtain the vertices
%of the polygons of the matrix, and it must use rot2d from Question  q:rot2d.
%Note that here we are simply computing the vertices of the transformed polygons,
%without plotting them. The next function will be used to plot the transformed
%vertices.

function [vertexEffectorTransf,vertices1Transf,vertices2Transf]=twolink_kinematicMap(theta)
theta1 = theta(1);
theta2 = theta(2);

B2_R_W = [cos(theta1)*cos(theta2)-sin(theta1)*sin(theta2), cos(theta1)*sin(theta2)+sin(theta1)*cos(theta2);
       -cos(theta2)*sin(theta1)-cos(theta1)*sin(theta2), -sin(theta1)*sin(theta2)+cos(theta1)*cos(theta2);];
P_W = [0;10];
B2_T_W = [5*cos(theta2);-5*sin(theta2)];

P_B2 = B2_R_W * P_W - B2_T_W;

disp(P_B2)
end