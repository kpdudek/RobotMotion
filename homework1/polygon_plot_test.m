% function polygon_plot_test()
% This function tests polygon_plot(vertices,style) by constructing an array
% and passing it to polygon_plot()
function polygon_plot_test()
    figure('Name','polygon_plot()')
    test_polygon = [2,3,4,3,2,1;
                    1,1,2.5,4,4,2.5];
    polygon_plot(test_polygon,'r')
end