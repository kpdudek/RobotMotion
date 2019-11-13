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

[vertices1,vertices2] = twolink_polygons();

% End effector coordinate in B2
B2_P_eff = [4.5;0];

% Rotation matrix from a point in B1 to the world frame
W_P_B1 = @(B1_P) rot2d(theta1)*B1_P;

% Translation vector from B2 -> B1
B1_T_B2 = [5;0];

% Rotation matrix from a point in B2 to the world frame
W_P_B2 = @(B2_P) rot2d(theta1)*rot2d(theta2)*B2_P + rot2d(theta1)*B1_T_B2;


% Convert vertices1 and vertices2 into the world frame along with the end
% effector
vertexEffectorTransf = W_P_B2(B2_P_eff);

vertices1Transf = zeros(2,length(vertices1));
for iVertex1 = 1:length(vertices1)
    vertices1Transf(:,iVertex1) = W_P_B1(vertices1(:,iVertex1));
end

vertices2Transf = zeros(2,length(vertices2));
for iVertex2 = 1:length(vertices2)
    vertices2Transf(:,iVertex2) = W_P_B2(vertices2(:,iVertex2));
end

end



