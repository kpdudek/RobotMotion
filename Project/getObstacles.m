function obstacles = getObstacles()

obstacles = struct('ob',collisionBox(.5,.5,.5));
T = trvec2tform([.5 0 .25]);
obstacles(1).ob.Pose = T;

obstacles(2) = struct('ob',collisionBox(.5,.5,.5));
T = trvec2tform([-.5 0 .25]);
obstacles(2).ob.Pose = T;

obstacles(3) = struct('ob',collisionBox(.5,.5,.5));
T = trvec2tform([0 .5 .25]);
obstacles(3).ob.Pose = T;

end