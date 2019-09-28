function rot3d()
theta = pi/4;

R1 = [1, 0, 0;
      0, cos(theta), -sin(theta);
      0, sin(theta), cos(theta);];
mat1 = test_axes(R1);
disp(mat1)

%%
R2 = [cos(theta), 0, -sin(theta);
      0, 1, 0;
      sin(theta), 0, cos(theta);];
mat2 = test_axes(R2);
disp(mat2)

%%
R3 = [cos(theta), -sin(theta), 0;
      sin(theta), cos(theta), 0;
      0, 0, 1;];
mat3 = test_axes(R3);
disp(mat3)

%%
R4 = [-cos(theta), sin(theta), 0;
      -sin(theta), -cos(theta), 0;
      0, 0, 1;];
mat4 = test_axes(R4);
disp(mat4)

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