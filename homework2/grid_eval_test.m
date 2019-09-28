function grid_eval_test()
grid=struct('xx',linspace(-1,1,31),'yy',linspace(-1,1,31));
fun=@(x) x'*diag([4,1])*x;
grid=grid_eval(grid,fun);

[XX,YY]=meshgrid(grid.xx,grid.yy);
surf(XX,YY,grid.F)
