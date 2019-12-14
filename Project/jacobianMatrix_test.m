close all; clear; clc;

iCirc = 0:.5:2*pi;
x = sin(iCirc);
y = cos(iCirc);
x = [x,x].*.05;
y = [y,y].*.05;
z_zero = zeros(size(iCirc));




z = @(length) [z_zero,ones(size(iCirc))*length];

link1 = [x',y',z(.2)'];
link2 = [x',y'-.1,z(.5)']; % y'-.1
link3 = [x',y',z(.5)'];
link4 = [x',y',z(.2)'];
eef = [0;0;.2];

thetas = [45,45,45,45];
robot = initRobot(1);
robot.link1 = link1;
robot.link2 = link2;
robot.link3 = link3;
robot.link4 = link4;
robot.EEF = eef;
robot.j = thetas;


thetaDot= [45;45;45;45];
J = jacobianMatrix(thetas);
eefJacobianMat = J * thetaDot;
% invX = pinv(J)*eefJacobianMat;
invX = pinv(J)*eefJacobianMat;
disp(invX)
disp(eefJacobianMat)

eefJacobian = jacobian(robot,thetaDot);
disp(eefJacobian)