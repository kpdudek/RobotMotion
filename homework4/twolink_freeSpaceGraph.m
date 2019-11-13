%function twolink_freeSpaceGraph()
%The function performs the following steps enumerate  the contents of  @x  
%twolink_freeSpace_data.mat.  grid2graph.  the resulting  @x   vectorGraph struct
%array in the file  @x   twolink_freeSpace_graph.mat. enumerate

function twolink_freeSpaceGraph()

data= load('twolink_freeSpace_data.mat');

grid = data.grid;
grid.F = grid.F';
graphVector = grid2graph(grid);

figure()
graph_plot(graphVector)

save('twolink_freeSpace_graph.mat','graphVector')

easyStart = [.76;.12];
easyEnd = [.76;6.00];

medStart = [.76;.12];
medEnd = [2.72;5.45];

easyPath = graph_search_startGoal(graphVector,easyStart,easyEnd);
medPath = graph_search_startGoal(graphVector,medStart,medEnd);

figure()
twolink_animatePath(easyPath,20);
figure()
twolink_animatePath(medPath,20);
end
