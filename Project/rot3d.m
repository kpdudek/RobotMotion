function mat = rot3d(axis,theta)

theta = deg2rad(theta);
if isequal(axis,'y')
    mat = [cos(theta),  0, sin(theta);
           0,           1, 0;
           -sin(theta), 0, cos(theta)
           ];
elseif isequal(axis,'z')
    mat = [cos(theta), -sin(theta), 0;
           sin(theta), cos(theta),  0;
           0,          0,           1
           ];
else
    error('Unsupported axis')
end

end