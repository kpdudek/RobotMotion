function J = jacobianMatrix(thetaEval)
% links = Kinematics(thetaEval);
% t1 = links.j(1); t2 = links.j(2); t3 = links.j(3); t4 = links.j(4);
t1 = thetaEval(1); t2 = thetaEval(2); t3 = thetaEval(3); t4 = thetaEval(4);
R1 = rot3d('z',t1);
R2 = rot3d('y',t2);
R3 = rot3d('y',t3);
R4 = rot3d('y',t4);

T2 = [0;0;.2];
T3 = [0;0;.5];
T4 = [0;0;.5];
EEF = [0;0;.2];
% links.EEF(:,1) = (R1*R2*R3*R4*links.EEF + R1*R2*R3*T4 + R1*R2*T3 + R1*T2 + T1)';

hat = [0,-1,1;1,0,-1;-1,1,0];

J = [(hat*R1)*R2*R3*R4*EEF + (hat*R1)*R2*R3*T4 + (hat*R1)*R2*T3 + (hat*R1)*T2,...
     R1*(hat*R2)*R3*R4*EEF + R1*(hat*R2)*R3*T4 + R1*(hat*R2)*T3 ,...
     R1*R2*(hat*R3)*R4*EEF +  R1*R2*(hat*R3)*T4 ,...
     R1*R2*R3*(hat*R4)*EEF];

end