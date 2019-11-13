function sphereworld_test()

underDefined = sphereworld_freeSpace_graph(8);
graph_plot(underDefined)

Defined = sphereworld_freeSpace_graph(35);
figure(); graph_plot(Defined)

overDefined = sphereworld_freeSpace_graph(250);
figure(); graph_plot(overDefined)

end