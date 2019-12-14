%function [grid]=grid_eval(grid,fun)
%This function evaluates the function fun (which should be a function handle) on
%each point defined by the grid.
function [grid]=grid_eval(grid,fun)

%get dimensions of the grid
szMesh=[size(grid.yy,2) size(grid.xx,2)];

%get output of fun at the origin, just as a test point
fEvalZero=fun(zeros(2,1));

%allocate output
fEval=repmat(permute(fEvalZero,[1 3 2]),[szMesh 1]);

%double for loop to evaluate the function
for iXCoord=1:szMesh(2)
    for iYCoord=1:szMesh(1)
        fEval(iYCoord,iXCoord,:)=fun([grid.xx(iXCoord);grid.yy(iYCoord)]);
    end
end

grid.F=fEval;