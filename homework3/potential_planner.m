%function [xPath,UPath]=potential_planner(xStart,world,potential,epsilon,gradHandle)
%This function uses potential_totalGrad to implement the gradient-descent-based
%planner with step size  @x   epsilon, and evaluates the cost along the returned
%path. The planner must stop either after  @x   NSteps=1000 steps or when $ 
%U<10^-3$.
function [xPath,UPath]=potential_planner(xStart,world,potential,epsilon,gradHandle)
NSteps = 1000;
xPath = NaN(2,NSteps);
UPath = NaN(1,NSteps);

xPath(:,1) = xStart;
pot = gradHandle.U(xPath(:,1),world,potential);
for iStep = 2:1000
    pot = gradHandle.U(xPath(:,iStep),world,potential);
    UPath(iStep) = pot;
    potGrad = gradHandle.gradU(xPath(:,iStep-1),world,potential);
    xPath(:,iStep) = xPath(iStep-1) + epsilon*potGrad;
    if norm(potGrad) < 10^-3
        break
    end
end

end
