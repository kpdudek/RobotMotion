%function [grid]=grid_eval(grid,fun)
%This function evaluates the function fun (which should be a function handle) on
%each point defined by the grid.
function [grid]=grid_eval(grid,fun,world,potential)

%get dimensions of the grid
szMesh=[length(grid.xx) length(grid.yy)];

%get output size of fun (at the origin, just as a test point)
szOutput=size(fun(zeros(2,1),world,potential),1);

%allocate output
funEvaluated=false([szMesh szOutput]);

%double for loop to evaluate the function
for iMesh=1:szMesh(1)
    for jMesh=1:szMesh(2)
        funEvaluated(iMesh,jMesh,:)=fun([grid.xx(iMesh);grid.yy(jMesh)],world,potential);
    end
end

grid.F=funEvaluated;