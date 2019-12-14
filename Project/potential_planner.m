%function [xPath,UPath]=potential_planner(xStart,world,potential,epsilon,handles)
%This function uses potential_totalGrad to implement the gradient-descent-based
%planner with step size  @x   epsilon, and evaluates the cost along the returned
%path. The planner must stop either after  @x   NSteps=1000 steps or when $ 
%U<10^-3$.
function [xPath,UPath]=potential_planner(xStart,obstacles,potential,epsilon,fHandles,Nsteps)

% Nsteps = 2500; % number of steps
steps = 1; % intitialize step counter
xPath = zeros(4,Nsteps); % initialize xPath
UPath = zeros(1,Nsteps); % initialize UPath
xPath(:,1) = xStart; % fill in first xPath value
UPath(1) = fHandles.U(xStart,obstacles,potential); % fill in first UPath value

%if 1000 steps haven't been taken and the magnitude of gradient is > 10^-3,
%take a step
while steps<Nsteps%and(steps<Nsteps,norm(robot_potential_totalGrad(xPath(:,steps),obstacles,potential))>10^-3)
    current_gradient = fHandles.gradU(xPath(:,steps),obstacles,potential);
    if (sum(current_gradient) == 0) && steps < 100
        current_gradient = [-.01;-.01;-.01;-.01];
    end
    xPath(:,steps+1) = xPath(:,steps)-epsilon*current_gradient;
    UPath(steps+1) = fHandles.U(xPath(:,steps+1),obstacles,potential);
    steps = steps+1;
end

% if Nsteps not taken, fill in the rest of the matrices with Nan
if steps < Nsteps
   xPath(:,steps:1000) = NaN;
   UPath(steps:1000) = NaN;

end
