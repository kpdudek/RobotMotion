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

%%
vertex0 = [2;2];
vertex1 = [0;0];
vertex2 = [4;0];
point = [0;4];

figure('Name','Co-Linear')
polygon_plot([vertex0,vertex1,vertex2],'b')
hold on
plot(point(1),point(2),'k*')
hold on
plot(vertex0(1),vertex0(2),'or')

fprintf('Co-Linear\n')
disp(polygon_isSelfOccluded(vertex0,vertex2,vertex1,point))

%%
testPoints = zeros(2,100);
for iColumns = 1:length(testPoints(1,:))
    testPoints(1,iColumns) = randi([-1,6]);
    testPoints(2,iColumns) = randi([-3,3]);
end

[vertices1,vertices2] = twolink_polygons();
polygon_plot(vertices1,'b')

for indexVertex = 1:length(vertices1(1,:))
    if indexVertex == length(vertices1(1,:))
        iNextElement = 1;
        iPreviousElement = indexVertex -1;
    elseif indexVertex == 1
        iPreviousElement = length(vertices1(1,:));
        iNextElement = indexVertex + 1;
    else
        iPreviousElement = indexVertex - 1;
        iNextElement = indexVertex + 1;
    end
    vertex0 = vertices1(:,indexVertex);
    vertex1 = vertices1(:,iPreviousElement);
    vertex2 = vertices1(:,iNextElement);
    
    hold on
    
    for iPoint = 1:length(testPoints(1,:))
        point = testPoints(:,iPoint);
        selfOccluded = polygon_isSelfOccluded(vertex0,vertex2,vertex1,point);
        
        plot(point(1),point(2),'k*','MarkerSize',12)
        hold on
        
        if selfOccluded
            quiver(vertex0(1),vertex0(2),point(1),point(2),'r','AutoScale','off')
        else
            quiver(vertex0(1),vertex0(2),point(1),point(2),'g','AutoScale','off')
        end
        
    end
end



end