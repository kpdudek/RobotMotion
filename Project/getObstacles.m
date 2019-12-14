function obstacles = getObstacles()
% obstacles = [];

size = .4;
x = .6;
y = 0;
z = .2;
obstacles = struct('ob',collisionBox(size,size,size),'xCenter',[],'radius',[],'distInfluence',[]);
T = trvec2tform([x y z]);
obstacles(1).ob.Pose = T;
obstacles(1).xCenter = [x;y;z];
obstacles(1).radius = sqrt(x^2 + y^2);
obstacles(1).distInfluence = 1.2*obstacles(1).radius;

size = .3;
x = -.7;
y = 0;
z = .15;
obstacles(2) = struct('ob',collisionBox(size,size,size),'xCenter',[],'radius',[],'distInfluence',[]);
T = trvec2tform([-.5 0 .25]);
obstacles(2).ob.Pose = T;
obstacles(2).xCenter = [x;y;z];
obstacles(2).radius = sqrt(x^2 + y^2);
obstacles(2).distInfluence = 1.2*obstacles(2).radius;

size = .4;
x = 0;
y = .6;
z = .2;
obstacles(3) = struct('ob',collisionBox(size,size,size),'xCenter',[],'radius',[],'distInfluence',[]);
T = trvec2tform([0 .5 .25]);
obstacles(3).ob.Pose = T;
obstacles(3).xCenter = [x;y;z];
obstacles(3).radius = sqrt(x^2 + y^2);
obstacles(3).distInfluence = 1.2*obstacles(1).radius;
end