%function torus_plotChartsCurves()
%The function should iterate over the following four curves: itemize  @x  
%a=[3/4*pi;0],  @x   a=[3/4*pi;3/4*pi],  @x   a=[-3/4*pi;3/4*pi],  @x  
%a=[0;-3/4*pi], itemize and  @x   b=[-1;-1]. The function should show an overlay
%containing: itemize  output of torus_plotCharts;  output of the functions
%torus_pushCurve for each one of the curves. itemize \@@par 
function torus_plotChartsCurves()

%This function needs to use plot3 to show the output of torus_pushCurve, and
%quiver3 to show the output of torus_pushCurveTangent. You should see that all
%the curves start at the same point on the torus.   Use different colors to
%display the results of the different curves.
