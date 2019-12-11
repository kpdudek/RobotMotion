function plotLinks(links)

for iLink = 1:length(links)
    if ~isempty(links(iLink).link1.Points)
        hold on
        show(collisionMesh(links(iLink).link1.Points))
        show(collisionMesh(links(iLink).link2.Points))
        show(collisionMesh(links(iLink).link3.Points))
        show(collisionMesh(links(iLink).link4.Points))
    end
end

end