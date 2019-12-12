function plotLinks(links)

for iLink = 1:length(links)
    if ~isempty(links(iLink).link1)
        hold on
        show(collisionMesh(links(iLink).link1))
        show(collisionMesh(links(iLink).link2))
        show(collisionMesh(links(iLink).link3))
        show(collisionMesh(links(iLink).link4))
        plot3(links(iLink).EEF(1),links(iLink).EEF(2),links(iLink).EEF(3),'y.','MarkerSize',10)
    end
end

end