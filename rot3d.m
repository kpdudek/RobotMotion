function rot3d()
clear
close all
clc
%%
theta = pi/4;

R1 = [1, 0, 0;
      0, cos(theta), -sin(theta);
      0, sin(theta), cos(theta);];
mat1 = test_axes(R1);
disp(mat1)

figure('Name','Rot 1')
hold on
axis equal
quiver3(0,0,0,mat1(1,1),mat1(2,1),mat1(3,1))
quiver3(0,0,0,mat1(1,2),mat1(2,2),mat1(3,2))
quiver3(0,0,0,mat1(1,3),mat1(2,3),mat1(3,3))
legend('x','y','z')
xlim([-1 1])
ylim([-1 1])
zlim([-1 1])
grid on
%%
R2 = [cos(theta), 0, -sin(theta);
      0, 1, 0;
      sin(theta), 0, cos(theta);];
mat2 = test_axes(R2);
disp(mat2)

figure('Name','Rot 2')
hold on
axis equal
quiver3(0,0,0,mat2(1,1),mat2(2,1),mat2(3,1))
quiver3(0,0,0,mat2(1,2),mat2(2,2),mat2(3,2))
quiver3(0,0,0,mat2(1,3),mat2(2,3),mat2(3,3))
legend('x','y','z')
xlim([-1 1])
ylim([-1 1])
zlim([-1 1])
grid on
%%
R3 = [cos(theta), -sin(theta), 0;
      sin(theta), cos(theta), 0;
      0, 0, 1;];
mat3 = test_axes(R3);
disp(mat3)
figure('Name','Rot 3')
hold on
axis equal
quiver3(0,0,0,mat3(1,1),mat3(2,1),mat3(3,1))
quiver3(0,0,0,mat3(1,2),mat3(2,2),mat3(3,2))
quiver3(0,0,0,mat3(1,3),mat3(2,3),mat3(3,3))
legend('x','y','z')
xlim([-1 1])
ylim([-1 1])
zlim([-1 1])
grid on
%%
R4 = [-cos(theta), sin(theta), 0;
      -sin(theta), -cos(theta), 0;
      0, 0, 1;];
mat4 = test_axes(R4);
disp(mat4)

figure('Name','Rot 4')
hold on
axis equal
quiver3(0,0,0,mat4(1,1),mat4(2,1),mat4(3,1))
quiver3(0,0,0,mat4(1,2),mat4(2,2),mat4(3,2))
quiver3(0,0,0,mat4(1,3),mat4(2,3),mat4(3,3))
legend('x','y','z')
xlim([-1 1])
ylim([-1 1])
zlim([-1 1])
grid on
end

function rot_mat = test_axes(R)
e1 = [1;0;0];
e2 = [0;1;0];
e3 = [0;0;1];
rot_mat = [];

rot_mat = [rot_mat,R * e1];
rot_mat = [rot_mat,R * e2];
rot_mat = [rot_mat,R * e3];
end