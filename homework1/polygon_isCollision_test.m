%function polygon_isCollision_test()
%This function is the same as polygon_isVisible_test, but instead of step 
%item:test-visibility, use the following: enumerate  whether each point in 
%testPointsWithPolygon is in collision with the polygon or not using
%polygon_isCollision.  each point in  testPointsWithPolygon in green if it is not
%in collision, and red otherwise. enumerate Moreover, increase the number of test
%points from $5$ to $100$ (i.e.,  testPoints should have dimension [ 2 $ $ 
%100]).
function polygon_isCollision_test()

testPoints = zeros(2,100);
for iColumns = 1:length(testPoints(1,:))
    testPoints(1,iColumns) = randi([0,5]);
    testPoints(2,iColumns) = randi([-2,2]);
end

[vertices1,vertices2] = twolink_polygons();


figure('Name','Polygon 1');
polygon_plot(vertices1,'b')
testPointsWithPolygon = [testPoints,vertices1];

flagCollision = polygon_isCollision(vertices1,testPointsWithPolygon);
for iPoints = 1:length(testPointsWithPolygon)
    if flagCollision(iPoints)
        plot(testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'r.','MarkerSize',15)
    else
        plot(testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'g.','MarkerSize',15)
    end
end

figure('Name','Polygon 2');
polygon_plot(vertices2,'b')
testPointsWithPolygon = [testPoints,vertices2];

flagCollision = polygon_isCollision(vertices2,testPointsWithPolygon);
for iPoints = 1:length(testPointsWithPolygon)
    if flagCollision(iPoints)
        plot(testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'r.','MarkerSize',15)
    else
        plot(testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'g.','MarkerSize',15)
    end
end

figure('Name','Polygon 3');
vertices1 = fliplr(vertices1);
polygon_plot(vertices1,'b')
testPointsWithPolygon = [testPoints,vertices1];

flagCollision = polygon_isCollision(vertices1,testPointsWithPolygon);
for iPoints = 1:length(testPointsWithPolygon)
    if flagCollision(iPoints)
        plot(testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'r.','MarkerSize',15)
    else
        plot(testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'g.','MarkerSize',15)
    end
end

figure('Name','Polygon 4');
vertices2 = fliplr(vertices2);
polygon_plot(vertices2,'b')
testPointsWithPolygon = [testPoints,vertices2];

flagCollision = polygon_isCollision(vertices2,testPointsWithPolygon);
for iPoints = 1:length(testPointsWithPolygon)
    if flagCollision(iPoints)
        plot(testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'r.','MarkerSize',15)
    else
        plot(testPointsWithPolygon(1,iPoints),testPointsWithPolygon(2,iPoints),'g.','MarkerSize',15)
    end
end

end