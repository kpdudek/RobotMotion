function field_PlotPotential()
load sphereworld.mat

potential=struct('shape','conic','xGoal',[5;5],'repulsiveWeight',10);
grid = struct('xx',linspace(-10,10,61),'yy',linspace(-10,10,61));

fHandle=@(xInput) potential_total(xInput,world,potential);
figure()
field_plotThreshold(fHandle,10,grid)

fHandle=@(xInput) potential_totalGrad(xInput,world,potential);
figure()
field_plotThreshold(fHandle,10,grid)


end