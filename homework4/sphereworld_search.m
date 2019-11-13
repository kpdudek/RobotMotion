%function sphereworld_search(NCells)
%enumerate  the variables  @x   xStart,  @x   xGoal from      Marker
%file_provided [sphereworld.mat]  @x   sphereworld.mat  each of the three values
%for  @x   NCells: enumerate  the function sphereworld_freeSpace_graph for the
%given value of  @x   NCell.  each goal in  @x   xGoal: enumerate 
%graph_search_startGoal from every starting location in  @x   xStart to that
%goal.  the world using sphereworld_plot, together with the resulting
%trajectories. enumerate enumerate enumerate

%In total, this function should produce six different images (three choices for 
%@x   NCell times two goals).

function sphereworld_search(NCells)
load('sphereworld.mat')
for iSize = 1:length(NCells)
    [graphVector]=sphereworld_freeSpace_graph(NCells(iSize));
    
    figure()
    sphereworld_plot(world,xGoal)
    hold on
    graph_plot(graphVector)
    hold on
    for iGoal = 1:length(xGoal)
        xPath1 = graph_search_startGoal(graphVector,xStart(:,1),xGoal(:,iGoal));
        xPath2 = graph_search_startGoal(graphVector,xStart(:,2),xGoal(:,iGoal));
        plot(xPath1(1,:),xPath1(2,:),'r','LineWidth',1.5)
        plot(xPath2(1,:),xPath2(2,:),'r','LineWidth',1.5)
    end
end
end
