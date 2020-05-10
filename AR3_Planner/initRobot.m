function robot = initRobot(num)
robot = repmat(struct('link1',[],'link2',[],'link3',[],'link4',[],'EEF',[],'j',[]),num,1);
end