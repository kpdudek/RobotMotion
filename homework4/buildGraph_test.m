function buildGraph_test()
close all
nodes = 40;
rec = 20;

graphVector = buildGraph(nodes,rec);

graph_plot(graphVector)

end