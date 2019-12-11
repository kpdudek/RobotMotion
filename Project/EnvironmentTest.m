close all; clear; clc;

obstacles = getObstacles();

r1 = 0:90:359;
r2 = 0:22.5:45;
r3 = 0:22.5:45;
r4 = 0;
iter = length(r1)*length(r2)*length(r3)*length(r4);

QFree = initRobot(iter);
collision = initRobot(iter);

print = false;
count = 1;
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
                    QFree(count) = worldLinks;
                else
                    collision(count) = worldLinks;
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

figure()
plotObstacles(obstacles)
plotLinks(QFree)
plotLinks(collision)
axis equal


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

save SparseTest QFree collision
