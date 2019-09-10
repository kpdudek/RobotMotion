function edge_isCollision_test()

% Parallel lines
vertices1 = [1,4;1,4];
vertices2 = [4,1;8,4];
fprintf('Lines do not collide\n')
disp(edge_isCollision(vertices1,vertices2))

% Collision
vertices1 = [1,4;1,4];
vertices2 = [4,1;1,4];
fprintf('Lines collide\n')
disp(edge_isCollision(vertices1,vertices2))

% Zero length
vertices1 = [1,1;2,2];
vertices2 = [4,1;1,4];
fprintf('Zero length\n')
disp(edge_isCollision(vertices1,vertices2))

% Single endpoint intersection aka the T shape
vertices1 = [0,2;0,2];
vertices2 = [1,2;1,0];
fprintf('Single end point, T shape\n')
disp(edge_isCollision(vertices1,vertices2))

% End point intersection
vertices1 = [0,1;0,1];
vertices2 = [1,2;1,0];
fprintf('End point intersection\n')
disp(edge_isCollision(vertices1,vertices2))

% Horizontal line collision
vertices1 = [0,2;2,2];
vertices2 = [0,2;0,4];
fprintf('Horizontal collision\n')
disp(edge_isCollision(vertices1,vertices2))

% Vertical line collision
vertices1 = [0,2;0,2];
vertices2 = [1,1;0,2];
fprintf('Vertical collision\n')
disp(edge_isCollision(vertices1,vertices2))

% Horizontal line  NO collision
vertices1 = [0,2;2,2];
vertices2 = [5,6;0,4];
fprintf('Horizontal NO collision\n')
disp(edge_isCollision(vertices1,vertices2))

% Vertical line NO collision
vertices1 = [0,2;0,2];
vertices2 = [4,4;0,2];
fprintf('Vertical NO collision\n')
disp(edge_isCollision(vertices1,vertices2))

% Vertical line and horizontal line end point collision
vertices1 = [0,2;2,2];
vertices2 = [2,2;0,2];
fprintf('Vertical and horizontal line end point collision\n')
disp(edge_isCollision(vertices1,vertices2))

% Vertical line and horizontal line SINGLE end point collision
vertices1 = [0,2;2,2];
vertices2 = [2,2;0,4];
fprintf('Vertical and horizontal line SINGLE end point collision\n')
disp(edge_isCollision(vertices1,vertices2))
end