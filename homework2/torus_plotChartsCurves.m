%function torus_plotChartsCurves()
%The function should iterate over the following four curves: itemize  @x  
%a=[3/4*pi;0],  @x   a=[3/4*pi;3/4*pi],  @x   a=[-3/4*pi;3/4*pi],  @x  
%a=[0;-3/4*pi], itemize and  @x   b=[-1;-1]. The function should show an overlay
%containing: itemize  output of torus_plotCharts;  output of the functions
%torus_pushCurve for each one of the curves. itemize \@@par 

%This function needs to use plot3 to show the output of torus_pushCurve, and
%quiver3 to show the output of torus_pushCurveTangent. You should see that all
%the curves start at the same point on the torus.   Use different colors to
%display the results of the different curves.

function torus_plotChartsCurves()

a1 = [3/4*pi;0];
a2 = [3/4*pi;3/4*pi];
a3 = [-3/4*pi;3/4*pi];
a4 = [0;-3/4*pi];
a = [a1,a2,a3,a4];
b = [-1;-1];

torus_plotCharts();
hold on

colors = {'m','y','c','g'};
for iCurve = 1:length(a(1,:))
    xPoints = torus_phiPushCurve(a(:,iCurve),b);
    plot3(xPoints(1,:),xPoints(2,:),xPoints(3,:),colors{iCurve})
end

end
