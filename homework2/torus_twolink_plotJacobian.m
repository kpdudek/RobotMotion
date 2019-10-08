%function torus_twolink()
%For each one of the curves used in Question  q:torusDrawChartsTangents, do the
%following: itemize  torus_pushCurve to compute the array  thetaPoints for the
%curve;  twolink_draw to plot the two-link manipulator in each one of the
%configurations given by the columns of  thetaPoints. itemize The function should
%produce a total of four windows (or, alternatively, a single window with four
%subplots), each window (or subplot) showing all the configurations of the
%manipulator superimposed on each other.

% @boxDodgerBlue3 white  optional For each window (or subplot), use the color of
%the corresponding curve as used in Question  q:torusDrawChartsTangents.

function torus_twolink_plotJacobian()

a1 = [3/4*pi;0];
a2 = [3/4*pi;3/4*pi];
a3 = [-3/4*pi;3/4*pi];
a4 = [0;-3/4*pi];
a = [a1,a2,a3,a4];
b = [-1;-1];



colors = {'m','y','c','g'};
for iCurve = 1:length(a(1,:))
    figure()
    hold on
    %subplot(2,2,iCurve)
    %hold on
    axis equal
    %thetaPoints = torus_phiPushCurve(a(:,iCurve),b);
    thetaPoints = line_linspace(a(:,iCurve),b,0,1,31);
    thetaDot = ones(size(thetaPoints));
    thetaDot = [thetaDot(1,:).*a(1,iCurve);thetaDot(2,:)];
    thetaDot = [thetaDot(1,:);thetaDot(2,:).*a(2,iCurve)];
    eff_dot = twolink_jacobian(thetaPoints,thetaDot);
    
    for iPoint = 1:length(thetaPoints(1,:))
        twolink_plot(thetaPoints(:,iPoint),'b')
        p_eff = twolink_kinematicMap(thetaPoints(:,iPoint));
        quiver(p_eff(1),p_eff(2),eff_dot(1,iPoint),eff_dot(2,iPoint),colors{iCurve})
    end
    
end

end