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

fprintf('On Edge 2\n')
disp(polygon_isSelfOccluded(vertex0,vertex1,vertex2,point))

end