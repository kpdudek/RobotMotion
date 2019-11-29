function [worldLinks] = Kinematics(thetas)

iCirc = 0:.1:2*pi;
x = sin(iCirc);
y = cos(iCirc);
x = [x,x].*.05;
y = [y,y].*.05;
z = zeros(size(iCirc));


z = @(length) [z,ones(size(iCirc))*length];

link1 = [x',y',z(.2)'];
link2 = [x',y'-.1,z(.5)'];
link3 = [x',y',z(.5)'];
link4 = [x',y',z(.2)'];

links.link1  = struct('Link','1','Points',link1);
links.link2  = struct('Link','2','Points',link2);
links.link3  = struct('Link','3','Points',link3);
links.link4  = struct('Link','4','Points',link4);

worldLinks = KinemeticMap(links,thetas);

link1 = collisionMesh(worldLinks.link1.Points);
link2 = collisionMesh(worldLinks.link2.Points);
link3 = collisionMesh(worldLinks.link3.Points);
link4 = collisionMesh(worldLinks.link4.Points);

show(link1)
hold on
show(link2)
show(link3)
show(link4)
axis equal
end
