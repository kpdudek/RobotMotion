%function torus_plotCharts()
%For each one of the chart domains $U_i$ from the previous question: enumerate  a
% @x   grid structure with fields  @x   xx and  @x   yy that define a grid of
%regular point in $U_i$. Use  @x   NGrid=33.  the function grid_eval with
%argument  @x   grid and torus_phi.  the surface described by the values in  @x  
%grid.F using the Matlab function surf. enumerate

%Use the commands  @x   hold on and  @x   hold off to show all the charts on the
%same figure. To better show the overlap between the charts, you can use
%different colors each one of them, and the  @x     FaceAlpha  ,0.75 option for
%surf.

function torus_plotCharts()
fun=@(x) torus_phi(x);

U1 = [ 0   ,  0;
       pi  ,   pi
     ];
U2 = [ 0   ,  pi-.3;
       pi  ,  2*pi+.3
     ];
U3 = [ pi-.3    ,  0;
       2*pi+.3  ,   pi
     ];
U4 = [ pi-.3    ,  pi-.3;
       2*pi+.3  ,  2*pi+.3
     ];
 
figure() 
hold on
axis equal

grid1=struct('xx',linspace(U1(1,1),U1(2,1),33),'yy',linspace(U1(1,2),U1(2,2),33));
grid1=grid_eval(grid1,fun);
surf(grid1.F(:,:,1),grid1.F(:,:,2),grid1.F(:,:,3),'FaceColor','b','FaceAlpha',.75,'HandleVisibility','off')

grid2=struct('xx',linspace(U2(1,1),U2(2,1),33),'yy',linspace(U2(1,2),U2(2,2),33));
grid2=grid_eval(grid2,fun);
surf(grid2.F(:,:,1),grid2.F(:,:,2),grid2.F(:,:,3),'FaceColor','g','FaceAlpha',.75,'HandleVisibility','off')

grid3=struct('xx',linspace(U3(1,1),U3(2,1),33),'yy',linspace(U3(1,2),U3(2,2),33));
grid3=grid_eval(grid3,fun);
surf(grid3.F(:,:,1),grid3.F(:,:,2),grid3.F(:,:,3),'FaceColor','k','FaceAlpha',.75,'HandleVisibility','off')

grid4=struct('xx',linspace(U4(1,1),U4(2,1),33),'yy',linspace(U4(1,2),U4(2,2),33));
grid4=grid_eval(grid4,fun);
surf(grid4.F(:,:,1),grid4.F(:,:,2),grid4.F(:,:,3),'FaceColor','r','FaceAlpha',.75,'HandleVisibility','off')

end

%figure()
% surf(XX,YY,grid.F(:,:,1),'FaceColor','g','FaceAlpha',.75)
% %figure()
% surf(XX,YY,grid.F(:,:,2),'FaceColor','g','FaceAlpha',.75)
%figure()