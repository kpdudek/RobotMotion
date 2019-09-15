%function polygon_isVisible_test()
%This function should perform the following operations: enumerate  an array 
%testPoints with dimensions [ 2 $ $  5] containing points generated uniformly at
%random using rand and scaled to approximately occupy the rectangle $[0,5]
%[-2,2]$ (i.e., the $x$ coordinates of the points should fall between $0$ and
%$5$, while the $y$ coordinates between $-2$ and $2$).  the coordinates 
%vertices1 and  vertices2 of two polygons from twolink_polygons.  two  logical
%vectors  flag1 and  flag2 by calling polygon_isVisible using  testPoints and,
%respectively,  vertices1 and  vertices2 as argument. item:test-polygon For each
%polygon  vertices1,  vertices2, display a separate figure using the following:
%enumerate  the array  testPointsWithPolygon by concatenating  testPoints with
%the coordinates of the polygon (i.e., the coordinates of the polygon become also
%test points).  the polygon (use polygon_plot). item:test-visibility For each
%vertex $v$ in the polygon: enumerate  the visibility of each point in 
%testPointsWithPolygon with respect to that polygon (using polygon_isVisible). 
%lines from the vertex $v$ to each point in  testPointsPolygon according in green
%if the corresponding point is visible, and in red otherwise. enumerate enumerate
% the order of the vertices in  vertices1,  vertices2 using the function fliplr. 
%item item:test-polygon above with the reversed edges. enumerate

%The function should display four separate figures in total, each one with a
%single polygon and lines from each vertex in the polygon, to each point.
function polygon_isVisible_test()

testPoints = zeros(2,5);
for iColumns = 1:length(testPoints(1,:))
    testPoints(1,iColumns) = randi([0,5]);
    testPoints(2,iColumns) = randi([-2,2]);
end

[vertices1,vertices2] = twolink_polygons();

%%
figure('Name','Polygon 1');
polygon_plot(vertices1,'b')
testPointsWithPolygon = [testPoints,vertices1];

for iVertex = 1:length(vertices1(1,:))
    flagVisible = polygon_isVisible(vertices1,iVertex,testPointsWithPolygon);
    for iPoints = 1:length(testPointsWithPolygon)
        if flagVisible(iPoints)
            quiver(vertices1(1,iVertex),vertices1(2,iVertex),testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'g','AutoScale','off')
        else
            quiver(vertices1(1,iVertex),vertices1(2,iVertex),testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'r','AutoScale','off')
        end
    end
end
%%
figure('Name','Polygon 2');
polygon_plot(vertices2,'b')
testPointsWithPolygon = [testPoints,vertices2];

for iVertex = 1:length(vertices2(1,:))
    flagVisible = polygon_isVisible(vertices2,iVertex,testPointsWithPolygon);
    for iPoints = 1:length(testPointsWithPolygon)
        if flagVisible(iPoints)
            quiver(vertices2(1,iVertex),vertices2(2,iVertex),testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'g','AutoScale','off')
        else
            quiver(vertices2(1,iVertex),vertices2(2,iVertex),testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'r','AutoScale','off')
        end
    end
end
%%
figure('Name','Polygon 3');
vertices1 = fliplr(vertices1);
polygon_plot(vertices1,'b')
testPointsWithPolygon = [testPoints,vertices1];

for iVertex = 1:length(vertices1(1,:))
    flagVisible = polygon_isVisible(vertices1,iVertex,testPointsWithPolygon);
    for iPoints = 1:length(testPointsWithPolygon)
        if flagVisible(iPoints)
            quiver(vertices1(1,iVertex),vertices1(2,iVertex),testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'g','AutoScale','off')
        else
            quiver(vertices1(1,iVertex),vertices1(2,iVertex),testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'r','AutoScale','off')
        end
    end
end
%%
figure('Name','Polygon 4');
vertices2 = fliplr(vertices2);
polygon_plot(vertices2,'b')
testPointsWithPolygon = [testPoints,vertices2];

for iVertex = 1:length(vertices2(1,:))
    flagVisible = polygon_isVisible(vertices2,iVertex,testPointsWithPolygon);
    for iPoints = 1:length(testPointsWithPolygon)
        if flagVisible(iPoints)
            quiver(vertices2(1,iVertex),vertices2(2,iVertex),testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'g','AutoScale','off')
        else
            quiver(vertices2(1,iVertex),vertices2(2,iVertex),testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'r','AutoScale','off')
        end
    end
end
end


