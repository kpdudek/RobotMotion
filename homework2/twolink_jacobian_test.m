function twolink_jacobian_test()

theta = [0 , 0    , pi   , pi;
         0 , pi/2 , pi/2 , pi
        ];

thetaDot = [1 , 0;
            0 , 1
           ];

for iTheta = 1:length(theta(1,:))
    for iThetaDot = 1:length(thetaDot(1,:))
        p_eff_dot = twolink_jacobian(theta(:,iTheta),thetaDot(:,iThetaDot));
        disp([theta(:,iTheta),thetaDot(:,iThetaDot),p_eff_dot])
    end
end
end