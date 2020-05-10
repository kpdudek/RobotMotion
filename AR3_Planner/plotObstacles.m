function plotObstacles(obstacles)

hold on
for iObstacle = 1:length(obstacles)
    show(obstacles(iObstacle).ob)
end

end