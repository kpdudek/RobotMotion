function plotRobot(links)

for iLink = 1:length(links)
    link1 = collisionMesh(links(iLink).link1.Points);
    link2 = collisionMesh(links(iLink).link2.Points);
    link3 = collisionMesh(links(iLink).link3.Points);
    link4 = collisionMesh(links(iLink).link4.Points);

    show(link1)
    hold on
    show(link2)
    show(link3)
    show(link4)
    axis equal
end
end