function flagCollision = robotIsCollision(links,obstacles)

for iObstacle = 1:length(obstacles)
    if checkCollision(collisionMesh(links.link1.Points),obstacles(iObstacle).ob)
        flagCollision = true;
        break
    elseif checkCollision(collisionMesh(links.link2.Points),obstacles(iObstacle).ob)
        flagCollision = true;
        break
    elseif checkCollision(collisionMesh(links.link3.Points),obstacles(iObstacle).ob)
        flagCollision = true;
        break
    elseif checkCollision(collisionMesh(links.link4.Points),obstacles(iObstacle).ob)
        flagCollision = true;
        break
    else
        flagCollision = false;
end

end