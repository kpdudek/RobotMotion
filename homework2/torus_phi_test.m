function torus_phi_test()
fun=@(x) torus_phi(x);

theta1 = 0:.1:2*pi;
theta2 = 0:.3:2*pi;
hold on
axis equal
for iTheta1 = 1:length(theta1)
    for iTheta2 = 1:length(theta2)
        theta = [theta1(iTheta1);theta2(iTheta2)];
        torus = fun(theta);
        x = torus(1);
        y = torus(2);
        z = torus(3);
        plot3(x,y,z,'.b','MarkerSize',12)
    end
end

end