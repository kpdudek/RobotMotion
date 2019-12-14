%function twolink_planner_test(shape,repulsiveWeight,epsilon)
%This function performs the same steps as potential_planner_test in Questino 
%q:potentialPlannerTest, except for the following: itemize  step  it:grad-handle:
% @x   gradHandle should be set to  @x   @twolink_totalGrad.  step 
%it:grad-handle: Use the contents of the variable  @x   thetaStart instead of  @x
%  xStart to initialize the planner.  step  it:plot-plan: Use twolink_plot to
%plot the results of the planner (since the output  @x   xPath from
%potential_planner will really contain a sequence of join angles, rather than a
%sequence of 2-D points). itemize
function twolink_planner_test(shape,repulsiveWeight,epsilon)
%load world data
problemData=load('sphereworld.mat');
%shorthand for variables
xGoal=problemData.xGoal;
xStart=problemData.thetaStart;
world=problemData.world;
%setup potential struct (exept goal)
potential.shape = shape;
potential.world = problemData.world;
potential.repulsiveWeight = repulsiveWeight;
%setup fHandles struct
fHandles.U=@twolink_potential_total;
fHandles.gradU=@twolink_potential_totalGrad;

nbGoals=size(xGoal,2);
nbStarts=size(xStart,2);
figNb=0;
%iterate over goals
for iGoal=1:nbGoals
    %finish setup of potential struct
    potential.xGoal = xGoal(:,iGoal);
    %iterate over starts
    for iStart=1:nbStarts
        [xPath, UPath] = potential_planner(xStart(:,iStart), world, potential, epsilon, fHandles);
        figNb=figNb+1;
        figure(figNb)
        subplot(1,2,1)
        sphereworld_plot(world, xGoal(:,iGoal));
        hold on
        twolink_plot(xPath(:,1:20:end),'r')
        hold off
        subplot(1,2,2)
        hold on
        plot(1:size(UPath,2), UPath);
        hold off
        pause(0.1)
    end
end
