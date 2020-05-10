function flagCollision = robotIsCollision(links,obstacles)

if isempty(obstacles)
    flagCollision = false;
    return
end

for iObstacle = 1:length(obstacles)
    if checkCollision(collisionMesh(links.link1),obstacles(iObstacle).ob)
        flagCollision = true;
        break
    elseif checkCollision(collisionMesh(links.link2),obstacles(iObstacle).ob)
        flagCollision = true;
        break
    elseif checkCollision(collisionMesh(links.link3),obstacles(iObstacle).ob)
        flagCollision = true;
        break
    elseif checkCollision(collisionMesh(links.link4),obstacles(iObstacle).ob)
        flagCollision = true;
        break
    else
        flagCollision = false;
    end
end

end