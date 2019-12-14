function links = KinemeticMap(links)

t1 = links.j(1); t2 = links.j(2); t3 = links.j(3); t4 = links.j(4);

R1 = rot3d('z',t1);
R2 = rot3d('y',t2);
R3 = rot3d('y',t3);
R4 = rot3d('y',t4);

T1 = [0;0;0];
T2 = [0;0;.2];
T3 = [0;0;.5];
T4 = [0;0;.5];

for iPoint = 1:length(links.link1)
    links.link1(iPoint,:) = (R1*links.link1(iPoint,:)' + T1)';
    links.link2(iPoint,:) = (R1*R2*links.link2(iPoint,:)' + R1*T2 + T1)';
    links.link3(iPoint,:) = (R1*R2*R3*links.link3(iPoint,:)' + R1*R2*T3 + R1*T2 + T1)';
    links.link4(iPoint,:) = (R1*R2*R3*R4*links.link4(iPoint,:)' + R1*R2*R3*T4 + R1*R2*T3 + R1*T2 + T1)';
end

links.EEF(:,1) = (R1*R2*R3*R4*links.EEF + R1*R2*R3*T4 + R1*R2*T3 + R1*T2 + T1);
end