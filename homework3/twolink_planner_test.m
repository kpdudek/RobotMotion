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

%styles used for each line
styles={'r','g','b','c','m'};
%load world data
problemData=load('sphereworld.mat');
%shorthand for variables
xGoal=problemData.xGoal;
thetaStart=problemData.thetaStart;
world=problemData.world;
%setup potential struct (exept goal)
potential.shape = shape;
potential.world = problemData.world;
potential.repulsiveWeight = repulsiveWeight;
%setup fHandles struct
fHandles.U=@twolink_potential_total;
fHandles.gradU=@twolink_potential_totalGrad;

nbStarts=size(thetaStart,2);
%iterate over goals
for iGoal=1:size(xGoal,2)
    %finish setup of potential struct
    potential.xGoal = xGoal(:,iGoal);
    %figure number depends on goal
    iFig=(iGoal-1)*nbStarts+1;
    figure(iFig)
    subplot(1,2,1)
    sphereworld_plot(world, xGoal(:,iGoal));
    %iterate over starts
    for iStart=1:nbStarts
        [xPath, UPath] = potential_planner(thetaStart(:,iStart), world, potential, epsilon, fHandles);
        subplot(1,2,1)
        hold on
        for iTheta = 1:50:length(xPath)
            twolink_plot([xPath(1,iTheta); xPath(2,iTheta)], styles{iStart});
        end
        hold off
        subplot(1,2,2)
        hold on
        plot(1:size(UPath,2), UPath, styles{iStart});
        hold off
    end

end
