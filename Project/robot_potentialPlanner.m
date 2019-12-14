%function twolink_planner_test(shape,repulsiveWeight,epsilon)
%This function performs the same steps as potential_planner_test in Questino 
%q:potentialPlannerTest, except for the following: itemize  step  it:grad-handle:
% @x   gradHandle should be set to  @x   @twolink_totalGrad.  step 
%it:grad-handle: Use the contents of the variable  @x   thetaStart instead of  @x
%  xStart to initialize the planner.  step  it:plot-plan: Use twolink_plot to
%plot the results of the planner (since the output  @x   xPath from
%potential_planner will really contain a sequence of join angles, rather than a
%sequence of 2-D points). itemize
function [xPath,UPath] = robot_potentialPlanner(shape,repulsiveWeight,epsilon,xStart,xGoal,obstacles,Nsteps)
%shorthand for variables
% obstacles = getObstacles();

%setup potential struct (exept goal)
potential.shape = shape;
potential.world = obstacles;
potential.repulsiveWeight = repulsiveWeight;

%setup fHandles struct
fHandles.U=@robot_potential_total;
fHandles.gradU=@robot_potential_totalGrad;

nbGoals=size(xGoal,2);
nbStarts=size(xStart,2);
%iterate over goals
for iGoal=1:nbGoals
    %finish setup of potential struct
    potential.xGoal = xGoal(:,iGoal);
    %iterate over starts
    for iStart=1:nbStarts
        [xPath, UPath] = potential_planner(xStart(:,iStart), obstacles, potential, epsilon, fHandles,Nsteps);
    end
end
