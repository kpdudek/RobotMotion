function robot = initRobot(num)

for i = 1:num
    robot(i).link1  = struct('Link','1','Points',[]);
    robot(i).link2  = struct('Link','2','Points',[]);
    robot(i).link3  = struct('Link','3','Points',[]);
    robot(i).link4  = struct('Link','4','Points',[]);
end
end