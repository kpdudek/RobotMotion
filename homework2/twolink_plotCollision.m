%function twolink_plotCollision(theta,points)
%This function should: enumerate  the points specified by  @x   points as black
%asterisks.  twolink_isCollision for determining if each configuration is a
%collision or not.  twolink_plot to plot the manipulator for all configurations,
%using a red color when the manipulator is in collision, and green otherwise.
%enumerate
function twolink_plotCollision(theta,points)

isCollision = twolink_isCollision(theta,points);
for iConfig = 1:length(theta(1,:))
    if isCollision(iConfig)
        twolink_plot(theta(:,iConfig),'r',[])
    else
        twolink_plot(theta(:,iConfig),'g',[])
    end
end

for iPoint = 1:length(points(1,:))
    plot(points(1,iPoint),points(2,iPoint),'k*','MarkerSize',12) 
end
end