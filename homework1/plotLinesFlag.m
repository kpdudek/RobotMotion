%function plotLinesFlag(pointsStart,pointsEnd,flags)
%Plot lines going from  pointsStart to  pointsEnd with a color that depends on 
%flags. Each element in  flag corresponds to a column in  pointsStart and one in 
%pointsEnd (i.e., to the endpoints of a line). If an element in  flag is  true,
%the corresponding line should be plotted in red, while if it is  false, it
%should be plotted in green.
function plotLinesFlag(pointsStart,pointsEnd,flags)
