function plotThetas(thetas)

for iTheta = 1:length(thetas(1,:))
    links = Kinematics(thetas(:,iTheta)');
    plotLinks(links)
end

end