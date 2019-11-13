function graph_search_test()
close all;

load('graph_testData.mat')
load('Grid_Graph.mat')
load('rec_graph.mat')

bigG = buildGraph(50);

Graph = bigG;
idxStart = 1;
idxGoal = length(Graph);

[xPath,graphVector] = graph_search(Graph,idxStart,idxGoal);
hold on;
plot(xPath(1,:),xPath(2,:),'b','LineWidth',1.5)

end