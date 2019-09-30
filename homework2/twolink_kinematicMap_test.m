function twolink_kinematicMap_test()
%%
theta = [pi/2;-pi/2];
theta_dot = [pi/2;pi/4];
figure()
twolink_plot(theta,'b',theta_dot)
axis equal

%%
theta = [pi/2;-pi/2];
[eef,vertices1,vertices2] = twolink_kinematicMap(theta);
figure()
polygon_plot(vertices1,'b')
hold on
polygon_plot(vertices2,'g')
hold on
plot(eef(1),eef(2),'or','MarkerSize',15)
axis equal

%%
theta = [pi/2;0];
[eef,vertices1,vertices2] = twolink_kinematicMap(theta);
figure()
polygon_plot(vertices1,'b')
hold on
polygon_plot(vertices2,'g')
hold on
plot(eef(1),eef(2),'or','MarkerSize',15)
axis equal
%%
theta = [0;0];
[eef,vertices1,vertices2] = twolink_kinematicMap(theta);
figure()
polygon_plot(vertices1,'b')
hold on
polygon_plot(vertices2,'g')
hold on
plot(eef(1),eef(2),'or','MarkerSize',15)
axis equal
%%
theta = [pi/2;pi];
[eef,vertices1,vertices2] = twolink_kinematicMap(theta);
figure()
polygon_plot(vertices1,'b')
hold on
polygon_plot(vertices2,'g')
hold on
plot(eef(1),eef(2),'or','MarkerSize',15)
axis equal
end