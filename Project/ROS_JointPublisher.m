%% Clear and load
clear all; close all; clc;
load finalPaperGraph3_Path.mat

%% ROS Master
rosinit

%% Publishers
J1 = rospublisher('/rrbot/joint1_position_controller/command','std_msgs/Float64');
J2 = rospublisher('/rrbot/joint2_position_controller/command','std_msgs/Float64');
J3 = rospublisher('/rrbot/joint3_position_controller/command','std_msgs/Float64');
J4 = rospublisher('/rrbot/joint4_position_controller/command','std_msgs/Float64');

%% Set up data
j1 = rosmessage(J1);
j2 = rosmessage(J2);
j3 = rosmessage(J3);
j4 = rosmessage(J4);

%% Set Home pose
thetas = deg2rad(jPath(:,1));
j1.Data = thetas(1);
j2.Data = thetas(2);
j3.Data = thetas(3);
j4.Data = thetas(4);

send(J1,j1);
send(J2,j2);
send(J3,j3);
send(J4,j4);
%% Run Joint angles
for iConfig = 1:length(jPath(1,:))
    thetas = deg2rad(jPath(:,iConfig));
    j1.Data = thetas(1);
    j2.Data = thetas(2);
    j3.Data = thetas(3);
    j4.Data = thetas(4);
    
    send(J1,j1);
    send(J2,j2);
    send(J3,j3);
    send(J4,j4);
    pause(.5)
end
%% Shutdown
rosshutdown

