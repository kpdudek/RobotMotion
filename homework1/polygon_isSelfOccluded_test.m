function polygon_isSelfOccluded_test()
%%
vertex0 = [2;2];
vertex1 = [0;0];
vertex2 = [4;0];
point = [2;1];

figure('Name','Self Occluded')
polygon_plot([vertex0,vertex1,vertex2],'b')
hold on
plot(point(1),point(2),'k*')
hold on
plot(vertex0(1),vertex0(2),'or')

fprintf('Self occluded\n')
disp(polygon_isSelfOccluded(vertex0,vertex1,vertex2,point))

%%
vertex0 = [2;2];
vertex1 = [0;0];
vertex2 = [4;0];
point = [0;0];

figure('Name','On Edge 1')
polygon_plot([vertex0,vertex1,vertex2],'b')
hold on
plot(point(1),point(2),'k*')
hold on
plot(vertex0(1),vertex0(2),'or')

fprintf('On edge 1\n')
disp(polygon_isSelfOccluded(vertex0,vertex1,vertex2,point))

%%
vertex0 = [2;2];
vertex1 = [0;0];
vertex2 = [4;0];
point = [4;0];

figure('Name','On Edge 2')
polygon_plot([vertex0,vertex1,vertex2],'b')
hold on
plot(point(1),point(2),'k*')
hold on
plot(vertex0(1),vertex0(2),'or')

fprintf('On Edge 2\n')
disp(polygon_isSelfOccluded(vertex0,vertex1,vertex2,point))

%%
vertex0 = [2;2];
vertex1 = [3;1];
vertex2 = [5;1];
vertex3 = [6;2];
vertex4 = [4;4];
point = [4;2];

figure('Name','More Complex Occluded')
polygon_plot([vertex0,vertex1,vertex2,vertex3,vertex4],'g')
hold on
plot(point(1),point(2),'k*')
hold on
plot(vertex0(1),vertex0(2),'or')

fprintf('More Complex Occluded2\n')
disp(polygon_isSelfOccluded(vertex0,vertex4,vertex1,point))

%%
vertex0 = [2;2];
vertex1 = [0;0];
vertex2 = [4;0];
point = [-12;0];

figure('Name','Outside Poly')
polygon_plot([vertex0,vertex1,vertex2],'b')
hold on
plot(point(1),point(2),'k*')
hold on
plot(vertex0(1),vertex0(2),'or')

fprintf('Outside Poly\n')
disp(polygon_isSelfOccluded(vertex0,vertex2,vertex1,point))



end