%function [vertices1,vertices2]=twolink_polygons()
%Returns the vertices of two polygons that represent the links in a simple 2-D
%two-link manipulator.
function [vertices1,vertices2]=twolink_polygons()
vertices1=[0 -1;5 -0.5]';
vertices1=addYReflection(vertices1);
vertices2=[0 -0.5; 3.5 -0.5; 3.5 -0.75; 4 -1; 5 -0.5; 4 -0.3]';
vertices2=addYReflection(vertices2);


function vertices=addYReflection(vertices)
vertices=[vertices fliplr(diag([1 -1])*vertices)];

