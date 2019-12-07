close all; clear; clc;

fig = figure('Name','Robot','Visible','off');

obstacles = struct('ob',collisionBox(.5,.5,.5));
T = trvec2tform([.5 0 .25]);
obstacles(1).ob.Pose = T;
show(obstacles.ob)
hold on

obstacles(2) = struct('ob',collisionBox(.5,.5,.5));
T = trvec2tform([-.5 0 .25]);
obstacles(2).ob.Pose = T;
show(obstacles(2).ob)

obstacles(3) = struct('ob',collisionBox(.5,.5,.5));
T = trvec2tform([0 .5 .25]);
obstacles(3).ob.Pose = T;
show(obstacles(3).ob)


print = false;
count = 1;

QFree = initRobot();
collision = initRobot();

r1 = 0:22.5:359;
r2 = 0:11.25:45;
r3 = 0:22.5:45;
r4 = 0;
for iTheta1 = r1
    for iTheta2 = r2
        for iTheta3 = r3
            for iTheta4 = r4
                if ~print
                    iter = length(r1)*length(r2)*length(r3)*length(r4);
                    fprintf('%d Iterations will be computed...\n',iter)
                    pause(1)
                    print = true;
                end
                thetas = [iTheta1,iTheta2,iTheta3,iTheta4];
                worldLinks = Kinematics(thetas);
                
                hold on
                
                if ~robotIsCollision(worldLinks,obstacles)
                    QFree(end+1) = worldLinks;
                else
                    collision(end+1) = worldLinks;
                end
                
                percent = (count / iter) * 100;
                hspace()
                fprintf('%2.1f\n',percent)
                count = count + 1;
                
            end
        end
    end
end
QFree = QFree(2:end);
collision = collision(2:end);

set(fig,'Visible','on')

figure('Name','Free Space')
plotLinks(QFree)
hold on
plotObstacles(obstacles)
axis equal

figure('Name','Collision')
plotLinks(collision)
hold on
plotObstacles(obstacles)
axis equal

hspace()
fprintf('Done!\n')
