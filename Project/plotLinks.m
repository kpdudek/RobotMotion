function plotLinks(links)

for iLink = 1:length(links)
    if ~isempty(links(iLink).link1)
        hold on
        [~,patchObj] = show(collisionMesh(links(iLink).link1));
        patchObj.FaceColor = [0 0 1];
%         patchObj.EdgeColor = 'none';
        [~,patchObj] = show(collisionMesh(links(iLink).link2));
        patchObj.FaceColor = [0 0 1];
%         patchObj.EdgeColor = 'none';
        [~,patchObj] = show(collisionMesh(links(iLink).link3));
        patchObj.FaceColor = [0 0 1];
%         patchObj.EdgeColor = 'none';
        [~,patchObj] = show(collisionMesh(links(iLink).link4));
        patchObj.FaceColor = [0 0 1];
%         patchObj.EdgeColor = 'none';
        plot3(links(iLink).EEF(1),links(iLink).EEF(2),links(iLink).EEF(3),'y.','MarkerSize',10,'HandleVisibility','off')
    end
end

end