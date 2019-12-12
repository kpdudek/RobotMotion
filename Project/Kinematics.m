%function [worldLinks] = Kinematics(thetas)
%Defines the geometry of the robot in the local frame of each link. The
%robot is a four link manipulator consisting of cylindrical links
%
%Calls function [worldLinks] = KinemeticMap(robot) to transform the
%coordinates of the links and the end effector to the world frame
%
%The robot is defined as a struct with fields:
%   link1 : The points defining the mesh of link 1
%   link2 : The points defining the mesh of link 2
%   link3 : The points defining the mesh of link 3
%   link4 : The points defining the mesh of link 4
%     EEF : The coordinate of the tip of the end effector 
%       j : The joint angles of the configuration

function [worldLinks] = Kinematics(thetas)
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

robot = initRobot(1);
robot.link1 = link1;
robot.link2 = link2;
robot.link3 = link3;
robot.link4 = link4;
robot.EEF = eef;
robot.j = thetas;

worldLinks = KinemeticMap(robot);

end
