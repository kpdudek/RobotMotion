function potential_SphereGrad_test()

sphere1 = struct('xCenter',[5;5],'radius',1,'distInfluence',3);
point = [7 ; 5];

figure()
hold on

sphere_plot(sphere1,'b')
plot(point(1,:),point(2,:),'.','MarkerSize',12)

[dPoints,sPoints] = sphere_distance(sphere1,point);
plot(sPoints(1,:),sPoints(2,:),'.','MarkerSize',12)

% Repulsive
gradR = potential_repulsiveSphereGrad(point,sphere1);
disp(gradR)
quiver(sPoints(1),sPoints(2),gradR(1),gradR(2),'r')

% Attractive
pot = struct('xGoal',[5;5],'repulsiveWeight',5,'shape','conic');
gradA = potential_attractiveGrad(point,pot);
disp(gradA)
quiver(sPoints(1),sPoints(2),gradA(1),gradA(2),'g')

axis equal

end