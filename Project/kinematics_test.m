close all; clear; clc;

fig = figure('Name','Robot','Visible','off');
print = false;
count = 1;

r1 = 0:22.5:360;
r2 = 0:45:90;
r3 = 0:45:90;
r4 = 0:45:90;
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
                Kinematics(thetas)
                hold on
                percent = (count / iter) * 100;
                hspace()
                fprintf('%2.1f\n',percent)
                count = count + 1;
                
            end
        end
    end
end
hspace()
fprintf('Done!\n')
set(fig,'Visible','on')





    
    