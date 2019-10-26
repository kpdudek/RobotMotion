function field_PlotPotential()
load sphereworld.mat

potential=struct('shape','quadratic','xGoal',[5;5],'repulsiveWeight',1);
grid = struct('xx',linspace(-10,10,61),'yy',linspace(-10,10,61));

fHandle=@(xInput) potential_total(xInput,world,potential);
figure('Name','Quad')
field_plotThreshold(fHandle,10,grid)

fHandle=@(xInput) potential_totalGrad(xInput,world,potential);
figure('Name','Quad')
field_plotThreshold(fHandle,10,grid)


potential=struct('shape','conic','xGoal',[5;5],'repulsiveWeight',1);
grid = struct('xx',linspace(-10,10,61),'yy',linspace(-10,10,61));

fHandle=@(xInput) potential_total(xInput,world,potential);
figure('Name','Conic')
field_plotThreshold(fHandle,10,grid)

fHandle=@(xInput) potential_totalGrad(xInput,world,potential);
figure('Name','Conic')
field_plotThreshold(fHandle,10,grid)


end