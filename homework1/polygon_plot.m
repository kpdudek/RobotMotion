%function polygon_plot(vertices,style)
%Draws a closed polygon described by  vertices using the style (e.g., color)
%given by  style.

function polygon_plot(vertices,style)
%Each edge in the polygon must be an arrow pointing from one vertex to the next.
%In Matlab, use the function quiver to actually perform the drawing. The function
%should  not create a new figure.
for iVertex = 1:length(vertices)
    if iVertex == 1
        u = vertices(1,1) - vertices(1,end);
        v = vertices(2,1) - vertices(2,end);
        quiver(vertices(1,end),vertices(2,end),u,v,'Color',style,'AutoScale','off','LineWidth',2);
    else
        u = vertices(1,iVertex) - vertices(1,iVertex-1);
        v = vertices(2,iVertex) - vertices(2,iVertex-1);
        quiver(vertices(1,iVertex-1),vertices(2,iVertex-1),u,v,'Color',style,'AutoScale','off','LineWidth',2);
    end
    hold on;
end

end