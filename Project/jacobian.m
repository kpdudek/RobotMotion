function eefDot = jacobian(links,thetaDot)
t1 = links.j(1); t2 = links.j(2); t3 = links.j(3); t4 = links.j(4);
td1 = thetaDot(1); td2 = thetaDot(2); td3 = thetaDot(3); td4 = thetaDot(4);

R1 = rot3d('z',t1);
R2 = rot3d('y',t2);
R3 = rot3d('y',t3);
R4 = rot3d('y',t4);

T2 = [0;0;.2];
T3 = [0;0;.5];
T4 = [0;0;.5];

% links.EEF(:,1) = (R1*R2*R3*R4*links.EEF + R1*R2*R3*T4 + R1*R2*T3 + R1*T2 + T1)';

hat = @(w) [0,-w,w;w,0,-w;-w,w,0];

eefDot = (hat(td1)*R1)*R2*R3*R4*links.EEF + (hat(td1)*R1)*R2*R3*T4 + (hat(td1)*R1)*R2*T3 + ...
    (hat(td1)*R1)*T2 + R1*(hat(td2)*R2)*R3*R4*links.EEF + R1*(hat(td2)*R2)*R3*T4 + R1*(hat(td2)*R2)*T3 ...
    + R1*R2*(hat(td3)*R3)*R4*links.EEF + R1*R2*(hat(td3)*R3)*T4 + R1*R2*R3*(hat(td4)*R4)*links.EEF;
% sum(eefDot,2);
end