function inClass_20190925()

%% Part 1.2
clear; clc;
for iX = -4:2:4
    for iY = -4:2:4
        vec = [iX;iY];
        fx = -.25*(vec-1);
        disp([iX,iY])
        disp(fx)
    end
end

%% Part 1.3
clear; clc; close all;
figure()
for iX = -4:2:4
    for iY = -4:2:4
        vec = [iX;iY];
        
        mat = [
                -1 , 0;
                0  , 1;
              ];
          
        fx = -.25*mat*(vec-1);
        quiver(iX,iY,fx(1),fx(2),'AutoScale','off','LineWidth',1.25)
        disp([iX,iY])
        disp(fx)
        hold on
    end
end

end