function links = KinemeticMap(links,thetas)

t1 = thetas(1); t2 = thetas(2); t3 = thetas(3); t4 = thetas(4);

R1 = rot3d('z',t1);
R2 = rot3d('y',t2);
R3 = rot3d('y',t3);
R4 = rot3d('y',t4);

T1 = [0;0;0];
T2 = [0;0;.2];
T3 = [0;0;.5];
T4 = [0;0;.56];

for iPoint = 1:length(links.link1.Points)
    links.link1.Points(iPoint,:) = (R1*links.link1.Points(iPoint,:)' + T1)';
    links.link2.Points(iPoint,:) = (R1*R2*links.link2.Points(iPoint,:)' + R1*T2 + T1)';
    links.link3.Points(iPoint,:) = (R1*R2*R3*links.link3.Points(iPoint,:)' + R1*R2*T3 + R1*T2 + T1)';
    links.link4.Points(iPoint,:) = (R1*R2*R3*R4*links.link4.Points(iPoint,:)' + R1*R2*R3*T4 + R1*R2*T3 + R1*T2 + T1)';
end

links.EEF.Points(:,1) = (R1*R2*R3*R4*links.EEF.Points(:,1) + R1*R2*R3*T4 + R1*R2*T3 + R1*T2 + T1)';
end