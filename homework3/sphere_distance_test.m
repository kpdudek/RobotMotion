function sphere_distance_test()
% Solid Sphere
sphere1 = struct('xCenter',[5;5],'radius',1,'distInfluence',1);
points = [8,5,8,1 ; 5,5,8,1];

figure()
hold on

sphere_plot(sphere1,'b')
plot(points(1,:),points(2,:),'.','MarkerSize',12)


[dPoints,sPoints] = sphere_distance(sphere1,points);
disp(dPoints)
plot(sPoints(1,:),sPoints(2,:),'.','MarkerSize',12)

axis equal


%% Hollow sphere

sphere1 = struct('xCenter',[5;5],'radius',-2,'distInfluence',1);
points = [8,5,8,1 ; 5,5,8,1];

figure()
hold on

sphere_plot(sphere1,'b')
plot(points(1,:),points(2,:),'.','MarkerSize',12)


[dPoints,sPoints] = sphere_distance(sphere1,points);
disp(dPoints)
plot(sPoints(1,:),sPoints(2,:),'.','MarkerSize',12)

axis equal
end