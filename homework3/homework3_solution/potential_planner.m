%function [xPath,UPath]=potential_planner(xStart,world,potential,epsilon,handles)
%This function uses potential_totalGrad to implement the gradient-descent-based
%planner with step size  @x   epsilon, and evaluates the cost along the returned
%path. The planner must stop either after  @x   NSteps=1000 steps or when $ 
%U<10^-3$.
function [xPath,UPath]=potential_planner(xStart,world,potential,epsilon,fHandles)

Nsteps = 1000; % number of steps
steps = 1; % intitialize step counter
xPath = zeros(2,Nsteps); % initialize xPath
UPath = zeros(1,Nsteps); % initialize UPath
xPath(:,1) = xStart; % fill in first xPath value
UPath(1) = fHandles.U(xStart,world,potential); % fill in first UPath value

%if 1000 steps haven't been taken and the magnitude of gradient is > 10^-3,
%take a step
while and(steps<Nsteps,norm(potential_totalGrad(xPath(:,steps),world,potential))>10^-3)
    current_gradient = fHandles.gradU(xPath(:,steps),world,potential);
    xPath(:,steps+1) = xPath(:,steps)-epsilon*current_gradient;
    UPath(steps+1) = fHandles.U(xPath(:,steps+1),world,potential);
    steps = steps+1;
end

% if Nsteps not taken, fill in the rest of the matrices with Nan
if steps < Nsteps
   xPath(:,steps:1000) = NaN;
   UPath(steps:1000) = NaN;
end
