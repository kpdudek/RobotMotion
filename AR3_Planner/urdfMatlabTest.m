AR3 = importrobot('AR3.urdf');
AR3.DataFormat = 'column';

startConfig = [0 0 0 0 0 0]';
goalConfig = [pi/2 pi/4 pi/2 0 -pi/4 0]';

% Define a trapezoidal velocity trajectory between the two configurations
q = trapveltraj([startConfig goalConfig],10,'EndTime',3);

% show(AR3,q(:,1));
% hold on
% for configIdx = 2:length(q(1,:))
%     show(AR3,q(:,configIdx));
% end


