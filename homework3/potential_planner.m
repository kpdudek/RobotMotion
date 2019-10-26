%function [xPath,UPath]=potential_planner(xStart,world,potential,epsilon,gradHandle)
%This function uses potential_totalGrad to implement the gradient-descent-based
%planner with step size  @x   epsilon, and evaluates the cost along the returned
%path. The planner must stop either after  @x   NSteps=1000 steps or when $ 
%U<10^-3$.
function [xPath,UPath]=potential_planner(xStart,world,potential,epsilon,gradHandle)
NSteps = 1000;
xPath = NaN(2,NSteps);
UPath = NaN(1,NSteps);

iStep = 1;
xPath(:,1) = xStart;
potGrad = gradHandle.gradU(xPath(:,iStep),world,potential);
UPath(1) = gradHandle.U(xPath(:,1),world,potential);

while norm(potGrad) > 10^-3
    potGrad = gradHandle.gradU(xPath(:,iStep),world,potential);
    xPath(:,iStep+1) = xPath(:,iStep) - epsilon.*potGrad;
    UPath(iStep+1) = gradHandle.U(xPath(:,iStep+1),world,potential);
    iStep = iStep + 1;
    if iStep == 1000
        break
    end
end

end
