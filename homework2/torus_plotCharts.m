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

chart1 = [ 0   ,  0;
       pi  ,   pi
     ];
chart2 = [ 0   ,  pi-.3;
       pi  ,  2*pi+.3
     ];
chart3 = [ pi-.3    ,  0;
       2*pi+.3  ,   pi
     ];
chart4 = [ pi-.3    ,  pi-.3;
       2*pi+.3  ,  2*pi+.3
     ];
 
figure() 
hold on
axis equal

grid1=struct('xx',linspace(chart1(1,1),chart1(2,1),33),'yy',linspace(chart1(1,2),chart1(2,2),33));
grid1=grid_eval(grid1,fun);
surf(grid1.F(:,:,1),grid1.F(:,:,2),grid1.F(:,:,3),'FaceColor','b','FaceAlpha',.75,'HandleVisibility','off')

grid2=struct('xx',linspace(chart2(1,1),chart2(2,1),33),'yy',linspace(chart2(1,2),chart2(2,2),33));
grid2=grid_eval(grid2,fun);
surf(grid2.F(:,:,1),grid2.F(:,:,2),grid2.F(:,:,3),'FaceColor','g','FaceAlpha',.75,'HandleVisibility','off')

grid3=struct('xx',linspace(chart3(1,1),chart3(2,1),33),'yy',linspace(chart3(1,2),chart3(2,2),33));
grid3=grid_eval(grid3,fun);
surf(grid3.F(:,:,1),grid3.F(:,:,2),grid3.F(:,:,3),'FaceColor','k','FaceAlpha',.75,'HandleVisibility','off')

grid4=struct('xx',linspace(chart4(1,1),chart4(2,1),33),'yy',linspace(chart4(1,2),chart4(2,2),33));
grid4=grid_eval(grid4,fun);
surf(grid4.F(:,:,1),grid4.F(:,:,2),grid4.F(:,:,3),'FaceColor','r','FaceAlpha',.75,'HandleVisibility','off')

end

%figure()
% surf(XX,YY,grid.F(:,:,1),'FaceColor','g','FaceAlpha',.75)
% %figure()
% surf(XX,YY,grid.F(:,:,2),'FaceColor','g','FaceAlpha',.75)
%figure()