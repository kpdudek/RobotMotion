%function polygon_plot(vertices,style)
%Draws a closed polygon described by  vertices using the style (e.g., color)
%given by  style.

function polygon_plot(vertices,style)
%Each edge in the polygon must be an arrow pointing from one vertex to the next.
%In Matlab, use the function quiver to actually perform the drawing. The function
%should  not create a new figure.
for iVertex = 1:length(vertices)
    if iVertex == 1
        uVertex = vertices(1,1) - vertices(1,end);
        vVertex = vertices(2,1) - vertices(2,end);
        quiver(vertices(1,end),vertices(2,end),uVertex,vVertex,'Color',style,'AutoScale','off','LineWidth',2);
    else
        uVertex = vertices(1,iVertex) - vertices(1,iVertex-1);
        vVertex = vertices(2,iVertex) - vertices(2,iVertex-1);
        quiver(vertices(1,iVertex-1),vertices(2,iVertex-1),uVertex,vVertex,'Color',style,'AutoScale','off','LineWidth',2);
    end
    hold on
end

end